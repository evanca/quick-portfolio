---
layout: post
title:  "How to check the revision number of your Raspberry Pi"
comments: true
date: 2020-02-26 13:17:00
author_name : Steve Mitchell
author_url : /author/steve
author_avatar: steve
show_avatar : false
read_time : 4
feature_image: feature-sidenotes
show_related_posts: false
square_related: recommend-sidenotes
---
As mentioned in the article, there was a design flaw of the Raspberry Pis prior to revision V1.2 causing some USB-C power cables not to work. Use the following command to see what revision you have.
```shell
cat /proc/cpuinfo
```
<figure>
    <a href="/img/post-assets/2020-02-29-how-to-check-the-revision-number-of-your-raspberry-pi/RaspberryPiRevision.png"><img src="/img/post-assets/2020-02-29-how-to-check-the-revision-number-of-your-raspberry-pi/RaspberryPiRevision.png"></a>
    <figcaption>How to check the revision of your Raspberry Pi</figcaption>
</figure>
<br/>
The Raspberry Pi 4 V 1.2 and above include a fix to the USB-C port the make some USB-C charging cables incompatible. 
