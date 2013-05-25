module Jekyll
	class PermalinkRewriter < Generator
	safe true
	
		def generate(site)
			# Until Jekyll allows me to use :slug, I have to resort to this

			site.categories['post'].each do |item|
				# /blog/this-is-a-title
				item.data['permalink'] = '/blog/' + item.slug + '/'
			end
			site.categories['essay'].each do |item|
				# /essay/this-is-a-title
				item.data['permalink'] = '/essay/' + item.slug + '/'
			end
		end
	end
end
