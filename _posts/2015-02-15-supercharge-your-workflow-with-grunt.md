---
layout: post
date: 2015-02-11 08:50:28
categories: coding js
author_name : Dan Robberts
author_url : /author/dan
author_avatar: dan
show_avatar : true
read_time : 34
feature_image: feature-laptop
show_related_posts: true
square_related: recommend-laptop
---

The Grunt ecosystem is huge and it's growing every day. With literally hundreds of plugins to choose from, you can use Grunt to automate just about anything with a minimum of effort. If someone hasn't already built what you need, authoring and publishing your own Grunt plugin to npm is a breeze. See how to [get started](http://gruntjs.com/).

In one word: automation. The less work you have to do when performing repetitive tasks like minification, compilation, unit testing, linting, etc, the easier your job becomes. After you've configured it through a Gruntfile, a task runner can do most of that mundane work for you—and your team—with basically zero effort.

Jekyll also offers powerful support for code snippets:

{% highlight javascript %}
{
  "name": "my-project-name",
  "version": "0.1.0",
  "devDependencies": {
    "grunt": "~0.4.5",
    "grunt-contrib-jshint": "~0.10.0",
    "grunt-contrib-nodeunit": "~0.4.1",
    "grunt-contrib-uglify": "~0.5.0"
  }
}
{% endhighlight %}

The easiest way to add Grunt and gruntplugins to an existing `package.json` is with the command `npm install <module> --save-dev`. Not only will this install `<module>` locally, but it will automatically be added to the devDependencies section, using a tilde version range.

For example, this will install the latest version of Grunt in your project folder, adding it to your devDependencies:

Grunt
