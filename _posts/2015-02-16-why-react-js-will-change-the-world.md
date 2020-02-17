---
layout: post-sidebar
date: 2015-02-10
title: "Why React JS Will Change the World"
categories: coding js
author_name : Dan Robberts
author_url : /author/dan
author_avatar: dan
show_avatar : true
read_time : 22
feature_image: feature-water
show_related_posts: true
square_related: recommend-spain
---

React components implement a `render()` method that takes input data and returns what to display. This example uses an XML-like syntax called JSX. Input data that is passed into the component can be accessed by `render()` via `this.props`.

{% highlight HTML %}
<!DOCTYPE html>
<html>
  <head>
    <script src="build/react.js"></script>
    <script src="build/JSXTransformer.js"></script>
  </head>
  <body>
    <div id="example"></div>
    <script type="text/jsx">
      React.render(
        <h1>Hello, world!</h1>,
        document.getElementById('example')
      );
    </script>
  </body>
</html>
{% endhighlight %}

## Want CommonJS?
If you want to use React with browserify, webpack, or another CommonJS-compatible module system, just use the react npm package. In addition, the jsx build tool can be integrated into most packaging systems (not just CommonJS) quite easily.

## Next Steps
Check out the tutorial and the other examples in the starter kit's examples directory to learn more.

We also have a wiki where the community contributes with workflows, UI-components, routing, data management etc.

Good luck, and welcome!
