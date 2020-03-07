---
layout: sidenote
title:  "How to check the revision number of your Raspberry Pi"
comments: true
date: 2020-02-26 13:17:00
author_name : Steve Mitchell
author_url : /author/steve
author_avatar: steve
show_avatar : false
read_time : 4
show_related_posts: false
---
As mentioned in <a href="/some-assemply-required">the article</a>, there was a design flaw of the Raspberry Pis prior to revision V1.2 causing some USB-C power cables not to work. There a couple of ways to see what revision you have.

# Open the Raspberry Pi Software Configuration Tool

A quick way to check your version is to open the Raspberry Pi Software Configuration Tool.

```shell
sudo raspi-config
```

{% include image.html url="/img/side-note-assets/how-to-check-the-revision-number-of-your-pi/Version_number_easy.png" description="Use the Software Configuration Tool" %}

# Display the CPU Info

Alternatively, you can list the CPU Info file.

```shell
cat /proc/cpuinfo
```

{% include image.html url="/img/side-note-assets/how-to-check-the-revision-number-of-your-pi/RaspberryPiRevision.png" description="Inspect the CPU Info File" %}

<br/>
The Raspberry Pi 4 V 1.2 and above include a fix to the USB-C port the make some USB-C charging cables incompatible. 
