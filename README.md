This is the personal website of Liam (liamzebedee) Edwards-Playne, which can be found at liamz.co. **Licensing:** content (\_posts, pages - about.md, this readme) is licensed under the _Creative Commons Attribution-ShareAlike 3.0 Unported License_. Code (\_assets, \_layouts, \_plugins, all the root pages) is licensed under _General Public License Version 3_. The content in the \_site directory is Copyright, although you can generate it yourself.

# Workflow
Generate site locally, push the static site to Github. Host both the jekyll source and the generated site in one repo. Jekyll site data (_layouts, _posts etc.) is stored in **source** branch and the **gh-pages** branch is pushed to through a submodule associated with the *\_site* directory.. 

## Plugins
I use the Jekyll Asset Pipeline to facilitate automatic compilation of .less and automatic compression of HTML/JS/CSS assets (the latter is currently not working).

> sudo gem install jekyll-asset-pipeline yui-compressor html_press

# Site layout
HTML5 site using Bootstrap. Built for mobile and desktop/tablet. 3 types of content:
* Pages - /about-me
* Essays - /essay/my-life-in-january
* Posts - /blog/note-name

## Layouts
* default
* default/base
* default/base
* default/base/post
* default/base/essay
