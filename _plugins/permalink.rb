module Jekyll
	class PermalinkRewriter < Generator
		safe true
		priority :low
	
		def generate(site)
			# Until Jekyll allows me to use :slug, I have to resort to this
			site.posts.each do |item|
				item.data['permalink'] = '/' + item.slug + '/'
			end
		end
	end
end
