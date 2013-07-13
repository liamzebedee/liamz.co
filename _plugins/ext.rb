require 'jekyll_asset_pipeline'
require 'jekyll-i18n'
#require 'jekyll-press'
module Jekyll
	module Commands
		# I overwrite this here so we only do heavy work (like compressing HTML and stuff)
		# when we are building the site, not when testing (which uses jekyll serve)
		class Build < Command
			class << self
				alias_method :_process, :process
				def process(options)
					require 'jekyll-press'
					options['asset_pipeline']['bundle'] = true
					options['asset_pipeline']['compress'] = true
					_process(options)
				end
			end
		end
	end
end
