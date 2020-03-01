---
layout: post
title:  "How to check the revision number of your Raspberry Pi"
url: /how-to-check-the-revision-number-of-your-raspberry-pi
comments: true
date: 2020-02-26 13:17:00
categories: [side-notes]
author_name : Steve Mitchell
author_url : /author/steve
author_avatar: steve
show_avatar : false
read_time : 4
feature_image: feature-sidenotes
show_related_posts: true
square_related: recommend-sidenotes
---
As mentioned in the article, there was a design flaw of the Raspberry Pis prior to revision V1.2 causing some USB-C power cables not to work. Use the following command to see what revision you have.
```shell script
cat /proc/cpuinfo
```
<figure>
    <a href="/img/post-assets/2020-02-29-how-to-check-the-revision-number-of-your-raspberry-pi/RaspberryPiRevision.png"><img src="/img/post-assets/2020-02-29-how-to-check-the-revision-number-of-your-raspberry-pi/RaspberryPiRevision.png"></a>
    <figcaption>How to check the revision of your Raspberry Pi</figcaption>
</figure>
