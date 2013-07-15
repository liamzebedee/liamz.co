---
layout: post
title: Ultimate introduction to Jekyll
description: "A detailed introduction and guide for those who've had no prior experience with Jekyll — the magnificent beast which powers both this website and many others."

category: guide
tag: tech
---
**Jekyll** is a website generation framework written in Ruby. The philosophy of Jekyll is simplicity. Jekyll generates static websites that require no server-side generation; the output of a Jekyll site can be served to a web browser **without additional processing**.

Jekyll at its core is a text transformation engine that operates on files. A Jekyll site is **stored on the filesystem** and processed by the **jekyll** executable to produce a static site, found in the *\_site* directory. Jekyll takes files it deems to be content (which can be written in multiple markup languages), and churns them through a templating engine to produce a webpage. 

Because the site is stored on the filesystem, there are multiple traits you can observe to distinguish the purposes of each file. 

## Special files
These are files that begin with an underscore. Jekyll will ignore any files that begin with an underscore. I call these files 'special files' because usually they have some purpose in site generation, but aren't part of the final site.

So we are building a site with Jekyll. We start with an empty directory, *website*. After running **jekyll**, a directory is produced: *\_site*. This directory contains nothing. Why did the directory contain nothing? Because nothing amounts to nothing. The moral of this story is that the *website* directory contains content — when there is no content, no website is made. 

This time you have done something - you've made a very simple "Hello World" webpage, which is saved as *index.html*. You run **jekyll** and what do you know, that very page has now been copied to *\_site/index.html*. Jekyll will copy all files that **do not begin with an underscore**, and **need not be processed**, to the *\_site* directory. 

## YAML Front Matter
But how does Jekyll know what files need to be churned through the templating engine? It is very simple actually, each file that needs to be processed starts with what we call **YAML Front Matter**. 

**YAML Front Matter** is a header at the top of a file, written in [YAML](https://en.wikipedia.org/wiki/YAML), and encased in three dashes at the top and bottom, that determines how a file is processed. An example file, *capitalism.md*:

	---
	layout: post
	---
	How is **capitalism** shaping government?

The **YAML Front Matter** is used for setting:

* predefined variables
* custom data of your own

Now we will move on to discuss the predefined *layout* variable. 

## Templating engine: basics
Every file that contains **YAML Front Matter** is processed by the templating engine. The templating language used is Liquid, which is a very simple and safe language for simple manipulation of data. 

Now back to the *layout* variable. When we specify this variable, a file will attempted to be loaded from a special directory called **\_layouts**. In the above example, we specified 'post' to be our layout. When *capitalism.md* is run through the templating engine, everything except the **YAML Front Matter** will be stored in a [template variable](https://github.com/mojombo/jekyll/wiki/Template-Data) *content*. So for the layout *post*:

	<article id="post">
	{% raw %}{{ content }}{% endraw %}
	</article>

The file generated, *\_site/capitalism.html*, will look like:

	<article id="post">
	How is <b>capitalism</b> shaping government?
	</article>

What have we learned?

1. Jekyll processes all files with YAML Front Matter
2. Processed files are structured in a layout heirachy, where their content is assigned to the variable *content*. The variable *layout* determines how the file is rendered. 
3. Depending on the markup language of the file, additional conversions may happen. 

In the previous example, capitalism.html had the word capitalism in bold. The layout that the post used was written in HTML, but the post itself was written in Markdown. This exemplifies despite its simplicity, the powerful nature of Jekyll.

In this section we created a **page** *capitalism.md* and a **layout** *post*.

## Templating engine: advanced
So far we have learnt about the basics of Jekyll templating. Now we should learn some more about the filesystem structure.

There are three special files that are yet to be discussed: *\_config.yml*, *\_includes* and *\_posts/*. 

1. The config file specifies site-wide variables [that are used by both Jekyll](https://github.com/mojombo/jekyll/wiki/Configuration) and can be used by templates. It's like a global YAML Front Matter. 
2. The includes directory contains templates that can be used by layouts and posts/pages alike. 
3. This is the 'blog-aware' feature of Jekyll. The posts directory contains posts (e.g. *capitalism.md*) that are accessible via variables (e.g. they can be iterated) and can also have other meta data tweaked (such as permalink structure and categories). 

Each file in the *\_posts* directory must follow the format of *YEAR-MONTH-DAY-title.MARKUP*. Each post can set YAML Front Matter [global variables](https://github.com/mojombo/jekyll/wiki/YAML-Front-Matter), of which the following are most popular:
   
* **title** — the title of the post (overrides such specified in the filename)
* **date** — the date when the post was published (overrides such specified in the filename)
* **categories** — a list of categories the post belongs to (which can also be specified in the directory structure of \_posts, but that's rather unecessary for small blogs)
* **layout** — layout to which the post is inserted into

Lastly, to use Jekyll effectively you should learn how to use the [Liquid templating language](https://github.com/shopify/liquid/wiki/liquid-for-designers), what powers Jekyll templates.

## Conclusion
In this guide I have covered the basic concepts needed to understand how Jekyll websites are implemented. Jekyll is a text transformation engine that operates on files, and uses a combination of the Liquid templating language, YAML Front Matter and underscores to provide a powerful yet simplistic alternative to popular CMSs. Its usage of text files instead of databases is what has garnered the title of "hacker's blogging framework", allowing everyone to use their favorite editor. 
