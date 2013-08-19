require 'jekyll_asset_pipeline'
module Jekyll
	module Commands
		# I overwrite this here so we only do heavy work (like compressing HTML and stuff)
		# when we are building the site, not when testing (which uses jekyll serve)
		class << Build
			alias_method :_build, :build
			def build(site, options)
				puts options['heavy_build']
				if options['heavy_build']
					require 'jekyll-press'
				end
				_build(site, options)
			end
		end
	end
end
