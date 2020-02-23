// https://raw.githubusercontent.com/poanchen/code-for-blog/master/2017/07/27/how-to-add-disqus-to-your-jekyll-site/src/js/disqus.js
var disqus_config = function () {
    // we are using document.location.* here because Jekyll code does not work well in JS code.
    this.page.url = document.location.href;
    this.page.identifier = document.location.pathname;
};

// You should be able to get the following lines of code from your Disqus admin.
// https://disqus.com/admin/universalcode
(function() { // DON'T EDIT BELOW THIS LINE
    var d = document, s = d.createElement('script');
    s.src = '//[your_username].disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
})();
