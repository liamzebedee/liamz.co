# jekyll-i18n
# — A simple plugin for multilingual Jekyll sites
# Author: Liam Edwards-Playne <liamz.co>
# License: GPLv3

require 'i18n'
require 'pathname'

module Jekyll
	I18n.load_path += Dir['_i18n/*.yml']
	
	class TranslateTag < Liquid::Tag
		
		def initialize(tag_name, text, tokens)
			super
			@text = text
		end
		
		# Gets a translation of a key according to the page.lang
		def render(context)
			# See https://www.iana.org/assignments/language-subtag-registry for full list of tags
			I18n.locale = context.registers[:page]['lang'].intern
			I18n.t(@text.strip)
		end
		
	end
	
	# Necessary filter when you need multi-language site variables (e.g. menus)
	module TranslateFilter
		
		def translate(input)
			I18n.locale = @context.registers[:page]['lang'].intern
			I18n.t(input.strip)
		end
		
		alias_method :t, :translate
		
	end
	
	class TranslatedIncludeTag < Liquid::Tag
		def initialize(tag_name, file, tokens)
			super
			@file = file.strip
		end

		def render(context)
			includes_dir = File.join(context.registers[:site].source, '_includes')

			lang = context.registers[:page]['lang']
			@file.insert(@file.index('.'), '.'+lang) if lang != 'und'

			if File.symlink?(includes_dir)
				return "Includes directory '#{includes_dir}' cannot be a symlink"
			end

			if @file !~ /^[a-zA-Z0-9_\/\.-]+$/ || @file =~ /\.\// || @file =~ /\/\./
				return "Include file '#{@file}' contains invalid characters or sequences"
			end

			Dir.chdir(includes_dir) do
				choices = Dir['**/*'].reject { |x| File.symlink?(x) }
				if choices.include?(@file)
					source = File.read(@file)
					partial = Liquid::Template.parse(source)
					context.stack do
					partial.render(context)
				end
				else
					"Included file '#{@file}' not found in _includes directory"
				end
			end
		end
	end
	
	module Convertible
		alias_method :_read_yaml, :read_yaml
		
		# Enhances the original method to extract the language from the extension.
		def read_yaml(base, name)
			rv = _read_yaml(base, name)
			
			# Infer language from first dot in filename.
			lang = (name.split '.')[1]
			
			if lang == 'mul' or I18n.available_locales.include? lang.intern
				data['lang'] = lang
			else
				# Default language is undefined.
				# If we are procesing a layout, we don't set a language/
				# This is so when we do render_liquid, we don't override the page's lang.
				data['lang'] = 'und' if not self.is_a? Jekyll::Layout
			end
			
			rv
		end
		
		alias_method :_render_liquid, :render_liquid
		
		def render_liquid(content, payload, info)
			info[:registers][:page]['lang'] = data['lang']
			_render_liquid(content, payload, info)
		end
		
	end
	
	class Page
		
		alias_method :_url, :url
		# Enhances original by applying /LANG/URL.
		def url			
			@url = _url
			lang = data['lang']
			# For 'mul' we generate multiple pages — inappropriate to have a url here.
			# For 'und' there is no language — return.
			if lang == 'mul' or lang == 'und'
				return @url
			end
			
			# Gets filename
			name = Pathname.new(@url).basename.to_s
			# this could be bad if the directory has the same name as the file.
			# XXX substitute the last occurance in a string, not the first.
			nameWithoutLang = @url.sub(name, name.sub('.'+lang, ''))
			nameWithoutLang == '/index/' ? "/#{lang}/index.html" : "/#{lang}/"+nameWithoutLang
		end
		
	end
	
	# XXX this could probably be made more Ruby-like.
	class Post
	
		alias_method :_url, :url
		# Enhances original by applying /LANG/URL
		def url			
			@url = _url
			lang = data['lang']
			# For 'mul' we generate multiple pages — inappropriate to have a url here
			# For 'und' there is no language — return
			if lang == 'mul' or lang == 'und'
				return @url
			end
			
			# Gets filename
			name = Pathname.new(@url).basename.to_s
			# this could be bad if the directory has the same name as the file
			# XXX substitute the last occurance in a string, not the first
			nameWithoutLang = @url.sub(name, name.sub('.'+lang, ''))
			nameWithoutLang == '/index/' ? "/#{lang}/index.html" : "/#{lang}"+nameWithoutLang
		end
	
	end
	
	class LanguageTagGenerator < Generator
		priority :lowest
		def generate(site)
			site.posts.each do |post|
				lang = post.data['lang'].to_s
				site.tags[lang] ||= []
				site.tags[lang] << post
			end
			#puts site.tags
		end
	end
end

Liquid::Template.register_tag('t', Jekyll::TranslateTag)
Liquid::Template.register_tag('_include', Jekyll::TranslatedIncludeTag)
Liquid::Template.register_filter(Jekyll::TranslateFilter)
