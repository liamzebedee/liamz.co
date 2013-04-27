This is the personal website of Liam (liamzebedee) Edwards-Playne, which can be found at liamz.co. **Licensing:** content (\_posts, pages - about.md, this readme) is licensed under the _Creative Commons Attribution-ShareAlike 3.0 Unported License_. Code (\_assets, \_layouts, \_plugins, all the root pages) is licensed under _General Public License Version 3_. The content in the \_site directory is Copyright, although you can generate it yourself.

# Workflow
Generate site locally, push the static site to Github. Host both the jekyll source and the generated site in one repo. Jekyll site data (_layouts, _posts etc.) is stored in **source** branch and the **gh-pages** branch is pushed to through a submodule associated with the *\_site* directory.. 

## Plugins
I use the Jekyll Asset Pipeline to facilitate automatic compilation of .less and automatic compression of HTML/JS/CSS assets (the latter is currently not working).

> sudo gem install jekyll-asset-pipeline yui-compressor html_press

# Site layout
HTML5 site using Bootstrap. Built for mobile and desktop/tablet. 3 types of content:
* Pages - /about-me
* Essays - /2013/jan/my-life-in-january
* Posts - /post/note-name

## Layouts
* default
* default/base
* default/base
* default/base/post
* default/base/essay

# Design Philosophy
My ephiphany came back when I looked at my website, and thought - I don't that this is the "Home of Liam" every time I visit a page. And then I saw [Paul Graham's website](http://www.paulgraham.com/), and I had my lightbulb moment. 

Content is king. Home page serves to a) introduce the reader to me (the author) and b) get them to read posts. Each post links to at least 3 other posts, to encourage further reading. 

Index:
* LIAMZEBEDEE · home · about · contact · posts · essays
* introduction to me
* range of posts on different topics
* latest posts and essays
* quote of the day

Content:
* LIAMZEBEDEE · home · about · contact · posts · essays
* Title, Date
* Content
* Related (previous, next, stimulated by, in response to)
* Responses
