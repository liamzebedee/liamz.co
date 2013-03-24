# Workflow
Generate site locally, push the static site to Github. Host both the jekyll source and the generated site in one repo. Jekyll site data (_layouts, _posts etc.) is stored in **source** branch and the **gh-pages** branch is pushed to through a submodule associated with the *\_site* directory.. 

## Setup
1. Create main branch to store site data. `git checkout -b source`
2. Add everything in this new branch, commit and push. 
	git add -A
	git commit -m "initial"
	git push --force origin source:source
3. Create a new empty branch to serve the _site and push it. Depending on your provider this could be **master**, **gh-pages** or something else. 
	git symbolic-ref HEAD refs/heads/gh-pages
	rm .git/index
	git clean -fdx
	touch index.html
	git add index.html
	git commit -m "Blank new gh-pages branch"
	git push --force origin gh-pages
4. Switch back to the source branch. 
	git checkout source
5. Add a submodule, which is really our **gh-pages** branch, to the path _site. Replace the URL with the location of your repository.
	git submodule add https://github.com/liamzebedee/site.com.git _site
	git submodule update
	git add _site
	git commit -m "Added _site as submodule"
7. Last step is to generate our first instance of jekyll then push it to the repository. 
	jekyll
	cd _site
	git add -A
	git commit -m "initial generation of site"
	git push
	

# Site layout
HTML5 site using Bootstrap. Built for mobile and desktop/tablet. 3 types of content:
* Pages - /about-me
* Articles - /2013/jan/my-life-in-january
* Notes - /thebrey/note-name

## Layouts
* default
* base <- default
* content <- base
* article <- content
* note <- content

# Comments
I like to refine my ideas and views, so if you have any comments don't hesitate to sent me a message.
