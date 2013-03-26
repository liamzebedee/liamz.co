# Workflow
Generate site locally, push the static site to Github. Host both the jekyll source and the generated site in one repo. Jekyll site data (_layouts, _posts etc.) is stored in **source** branch and the **gh-pages** branch is pushed to through a submodule associated with the *\_site* directory.. 

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

## CSS Layout
Header, menu then content. 

# Comments
I like to refine my ideas and views, so if you have any comments don't hesitate to sent me a message.
