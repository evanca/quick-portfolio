---
layout: post
title:  "Some Assembly Required"
url: /some-assembly-required
comments: true
date: 2020-02-26 13:17:00
categories: raspberry kubernetes
author_name : Steve Mitchell
author_url : /author/steve
author_avatar: steve
show_avatar : false
read_time : 10
feature_image: feature-raspberry
show_related_posts: false
square_related: recommend-raspberry
---

This is the first in a series of articles I am writing to tell you the story of how I built a small data center out of Raspberry Pis. We will uncover the struggles I overcame, along with the triumphs, I enjoyed throughout the process. Pictured below is the end result.

{% include image.html url="/img/post-assets/2020-02-26-some-assembly-required/cluster_front.jpg" description="K3s Kubernetes Cluster" %}

The bottom row contains three Raspberry Pi 4 K3s master nodes. The top row contains three Raspberry Pi K3s agent nodes. The middle row has a Raspberry Pi 3b that I plan to use to monitor my APC battery backup. Next to it is another Raspberry Pi 4 that I’m using for remote access. I’m using <a href="https://www.dataplicity.com/app/">Dataplicity</a> to share access with a few friends.

Covered in this post:
* **Components** - What parts did I use in my cluster?
* **Memory** - How much memory should you buy?
* **Storage** - Should you use Micro-SATA or MicroSD?
* **Power** - What about incompatible power cords?
* **Cooling** - Is passive cooling enough?
* **Assembly** - What are the assembly options?

## Components
You can see there was some assembly required.

{% include image.html url="/img/post-assets/2020-02-26-some-assembly-required/parts_spread.jpg" description="Most of the Parts" %}

You can find the parts I used on my public shopping list at Amazon. Click the image below to open the shopping list page.

{% include image.html url="/img/post-assets/2020-02-26-some-assembly-required/components.jpg" description="<a href='https://www.amazon.com/ideas/amzn1.account.AHYJ6ZRYBTXK37T2RDJPTLDER2CA/1GR6KKLS0JP9Q'>K3S Raspberry Pi 4 Cluster Parts on Amazon</a>" %}

In addition, I ordered clear acrylic plexiglass to connect the cluster mounts together. I ordered the 3/16” thickness, but I should have ordered the <a href="https://www.estreetplastics.com/1-8-x-6-x-12-Clear-Acrylic-Plexiglass-Sheet-p/1001250612.htm">next thinner size</a> to match the thickness of the tower case.

## Memory
The new Raspberry Pi 4 is powerful enough to replace a simple desktop computer given its up to 4gb of memory, high-speed USB-3 connectors, 2 4k micro HDMI ports, gigabit Ethernet, and four ARM processing cores.

{% include image.html url="/img/post-assets/2020-02-26-some-assembly-required/raspberrypispecs.png" description="Raspberry Pi Tech Specs" %}


My cluster runs Rancher K3s Kubernetes. The K3s hardware requirements are:
* **RAM** - 512mb minimum (Pi 4 has up to 4gb LPDDR4-2400 SDRAM)
* **CPU** - 1 minimum (Pi 4 has a Broadcom BCM2711, Quad-core Cortex-A72 64-bit 1.5GHz CPU)
* **Disks** - SSD recommend (Pi 4 has two USB 3 ports to attach mSATA )

The only option you have when ordering a Raspberry Pi 4 is the amount of memory. Get the model with 4gb of RAM. It’s really not a choice if you want to take full advantage of Kubernetes. 

## Storage
I bought Micro SATA extensions for my Raspberry Pis. If you decide to use mSATA, then you can buy an inexpensive 8gb microSD card since all the work will happen on the mSATA drive. If you don’t add mSATA, then buy a MicroSD suitably sized for your needs. Pay a little extra for a high-speed card from a well-known manufacturer, like SanDisk. 

{% include image.html url="/img/post-assets/2020-02-26-some-assembly-required/msata_adapter.jpg" description="mSATA Adapter" %}

Why should you pay for an mSATA drive with a USB-C adapter? The performance of the mSATA drive is better than the MicroSD. The chart below shows performance tests done by Jeff Geerling in his blog post, <a href="https://www.jeffgeerling.com/blog/2019/raspberry-pi-microsd-card-performance-comparison-2019Raspberry">Pi MicroSD Card Performance Comparisons, 2019</a>,  July 19, 2019. Jeff measured hdparm of 43.92 using the microSD card vs 345.41 using a USB3 SSD.

{% include image.html url="/img/post-assets/2020-02-26-some-assembly-required/pi-4-microsd-performance-vs-pi-3-b-plus.png" description="mSATA Adapter"%}

I added 256gb mSATA drives to all the Raspberry Pis in my cluster. That’s overkill, but since I want to fully enjoy playing on my Raspberry Pi playground, I spent the extra money.

{% include warning.html content="The INDMEM SSD mSATA cards I bought received a performance score of 1,332 when I tested them using http://www.iozone.org. A score over 8,000 is more typical for mSATA. I recommend that you choose a high scoring SSD from this list. <a href='https://storage.jamesachambers.com/msata/'>https://storage.jamesachambers.com/msata/</a>.  

I updated my public list to include a Kingston SSD instead of the INDMEM SSD. I will test it when I add my next Pi." %}


## Power
If you buy an official Raspberry Pi power supply you can ignore this section. If you have a lot of Raspberry Pis in your cluster you can save space by using an Anker 6-Port USB Charging Station, but be careful ordering the cables.
{% include image.html url="/img/post-assets/2020-02-26-some-assembly-required/power.png" description="Power Distribution" %}
Raspberry Pis had a bug in its USB-C connector, causing some USB-C cables to not work with the Raspberry Pi 4. This was corrected in the Raspberry Pi 4B V1.2. If you have an early version, choose one from those <a href="https://www.tomshardware.com/news/raspberry-pi-4-usb-c-cables-that-work,39869.html">reviewed on Top’s Hardware</a>. I did, and they work fine. Keep your shipping material slips handy, in case you buy an incompatible cable. 

{% include tip.html content="See the side-note: <a href='/side_notes/how-to-check-the-revision-number-of-your-raspberry-pi.html'>How to check the revision number of your Raspberry Pi</a>." %}

## Cooling
Nobody likes listening to fans. I have a Raspberry Pi 3 with a variable speed fan that can get quite loud.

{% include image.html url="/img/post-assets/2020-02-26-some-assembly-required/fan_cooled.png" description="Fan approaching takeoff speed" %}

The sound generated by six or eight fans would be too much noise for me. You can find lots of information about cooling Raspberry Pis. This <a href="https://www.youtube.com/watch?v=e6okZKRwnTQ">video on Raspberry Pi 3 cooling</a> is very thorough. 

The Yahboom 6-Layers Acrylic Cluster Case I use is completely open, so passive cooling is fine. The only problem is that the mSATA daughterboard assembly is too tall to fit in the bay. You can get around this if you mount the daughterboard in a separate bay above or below the Raspberry Pi, as shown here. 

{% include image.html url="/img/post-assets/2020-02-26-some-assembly-required/daughter_board.png" description="Separate Bay for Micro SATA Daughterboard" %}

Notice the silver heatsinks on the Raspberry Pi as well as the large black heatsink on the mSATA card.

If you have multiple columns of Raspberry Pis you should alternate putting the mSATA drive above or below the Raspberry Pi from one column to the next. If the Raspberry Pis are not across from each other routing the power cable past the adjacent Raspberry Pi can be tight. If you stagger the mounting so there is a Micro SATA drive next to each Raspberry Pi, then routing the power cable is no problem.
## Assembly
Once you decide what size MicroSD and mSATA cards to order and pick out a cluster case you like, it is time to assemble everything. 

{% include image.html url="/img/post-assets/2020-02-26-some-assembly-required/side_view.png" description="Side view of cluster" %}

In this side view, you can see the insets I drilled in the acrylic side panel to expose enough threads to attach the acorn nuts. This was necessary because I ordered the 3/16” thickness. I recommend you pick something similar in thickness to the acrylic pieces of cluster case, like 1/8", so you don’t have this problem.

Finish your mechanical installation of the cluster parts and we’ll pick-up with the software installation in the next article, Installing Raspian and Kubernetes.

I’m so happy that I work at <a href="https://thinkahead.com">Ahead</a> where this kind of experimentation is encouraged. If you want to learn about opportunities at Ahead, please reach out to my buddy, <a href="mailto:kaleigh.baker@thinkahead.com">Kaleigh</a>, to find out what positions are open or drop her your resume. 

## Next
In the next installment of the series, <a href="https://smitchell.github.io/how-to-configure-raspbian-linux">How to Configure Raspbian</a>, I detail the set-up of Raspbian, booting off of SSD.

----
### References
* <a href="https://blog.alexellis.io/cooling-off-your-rpi4/">https://blog.alexellis.io/cooling-off-your-rpi4</a>
* <a href="https://www.hackster.io/news/do-you-need-to-use-a-fan-for-cooling-with-the-new-raspberry-pi-4-6d523ca12453">https://www.hackster.io/news/do-you-need-to-use-a-fan-for-cooling-with-the-new-raspberry-pi-4-6d523ca12453</a>
* <a href="https://www.seeedstudio.com/blog/2019/09/18/raspberry-pi-4-cooling-test-compare-heat-sinks-and-cooling-fan/">https://www.seeedstudio.com/blog/2019/09/18/raspberry-pi-4-cooling-test-compare-heat-sinks-and-cooling-fan</a>
* <a href="https://projects.raspberrypi.org/en/projects/raspberry-pi-setting-up">https://projects.raspberrypi.org/en/projects/raspberry-pi-setting-up</a>
* <a href="https://jamesachambers.com/raspberry-pi-cheap-ssd-upgrade-30/">https://jamesachambers.com/raspberry-pi-cheap-ssd-upgrade-30</a>
* <a href="https://www.element14.com/community/community/raspberry-pi/blog/2019/08/30/quick-sd-to-ssd-on-the-pi-4">https://www.element14.com/community/community/raspberry-pi/blog/2019/08/30/quick-sd-to-ssd-on-the-pi-4</a>
*  <a href="https://jamesachambers.com/raspberry-pi-4-usb-boot-config-guide-for-ssd-flash-drives/">https://jamesachambers.com/raspberry-pi-4-usb-boot-config-guide-for-ssd-flash-drives</a>


[jekyll]:      http://jekyllrb.com
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-help]: https://github.com/jekyll/jekyll-help
