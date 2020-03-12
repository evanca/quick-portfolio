---
layout: post
title:  "How to Configure Raspbian Linux"
url: /how-to-configure-raspbian-linux
comments: true
date: 2020-03-03 07:17:00
categories: raspberry
author_name : Steve Mitchell
author_url : /author/steve
author_avatar: steve
show_avatar : false
read_time : 15
feature_image: feature-raspberry
show_related_posts: false
square_related: recommend-raspberry
---
{% include image.html url="/img/post-assets/2020-03-10-how-to-configure-raspbian/raspbian-logo-300x253.png" description="Raspbian Logo" %}

This article is the second in my series describing how I built a small data center out of Raspberry Pis and the struggles I overcame along the way. The first article, <a href="https://smitchell.github.io/some-assembly-required">Some Assembly Required</a>, covered choosing parts and assembling the cluster. This article picks up from there with the installation of the operating system on your Raspberry Pis.

Six steps to setting up your OS:

1. Pick a Linux distribution
1. Flash the OS to a MicroSD card.
1. Enable SSH
1. Connect, update, and adjust the configuration
1. Set the static IP address.
1. (optional) Partition the SSD and make it the boot drive

# Choosing a Linux Distribution
You have options when it comes to the OS. Here are a few Linux distributions that run on Raspberry Pis. 

* Arch Linux Arm
* Centos
* Gentoo
* Kali Linux
* OpenSuse
* Raspbian
* Ubuntu

There are other specialty distributions for media servers, firewalls, etc. Those aren’t appropriate for Kubernetes, but may find a place in your ecosystem, eventually. I briefly ran <a href="https://openwrt.org/">OpenWrt</a> on one Pi as a firewall, before repurposing that Pi for my cluster.

In the end, I chose Rasbian because of the large community of Raspbian users. If you have an affinity for Centos, Ubuntu, or some other Linux distribution, then that may be the best choice for you.
# Creating Boot images
I am running Raspbian headless, with no monitor or keyboard, so I downloaded the Buster Lite version instead of the desktop version.

{% include image.html url="/img/post-assets/2020-03-10-how-to-configure-raspbian/download-raspbian.png" description="https://www.raspberrypi.org/downloads/raspbian/" %}

<a href="https://www.balena.io/etcher/">Belena Etcher</a> is an open source program for flashing OS images to removable storage. Raspberry Pi has since released its own <a href="https://www.raspberrypi.org/blog/raspberry-pi-imager-imaging-utility/">open-source utility for flashing SD cards</a>. Use whatever software suits your taste.

{% include image.html url="/img/post-assets/2020-03-10-how-to-configure-raspbian/Etcher.png" description="https://www.balena.io/etcher/" %}

Launch the Flashing software. Pick the Rasbian image. Insert the MicroSD card, and Flash it. 
# Enabling SSH
To enable SSH on the first boot, you must create an empty file named “ssh” on the boot image. 
Mount the MicroSD card that you just flashed and use the “touch” command to create an empty file named “ssh” in the boot directory. On a Mac, the following command creates the “ssh” file.

```shell
touch /Volumes/boot/ssh
```
# First Boot
There are a number of changes to make after the first boot. Assuming that you are running headless, the first challenge is discovering the DHCP IP address assigned to the Raspberry Pi when it booted.
## Find the IP Address
Insert the MicroSD into the Raspberry Pi, power it on, and give it a minute to come online. <a href="https://angryip.org/">Angry IP Scanner<a/> is a free network scanner to sniff out the IP address on your network. The new device shows up with a hostname of “raspberrypi,” as pictured below.

{% include image.html url="/img/post-assets/2020-03-10-how-to-configure-raspbian/network-scan.png" description="https://angryip.org/" %}

Open a terminal and use “ssh” to connect to the Raspberry Pi as the “pi” user, for example:

```shell
ssh pi@192.168.1.196
```

The default password is “raspberry.” Use "apt" to upgrade Raspbian to current versions.

```shell
sudo apt update
sudo apt full-upgrade -y
```

{% include tip.html content="Would you like to be able to update all Rasbian on your Raspberry Pis at once and broadcast commands to all your Raspberry Pis simultaneously? If so, see my side-note <a href='/side_notes/how-to-multicast-commands.html'>How to Multicast Commands</a>. More than just multicasting, it shows how to use a keyboard shortcut to launch multiple terminal sessions simultaneously, each of which automatically connects to a different Raspberry Pi." %}
# Adjust the Configuration
Raspbian has a configuration utility to edit its configuration. We’ll use it to make initial changes.
After making this group of changes, we’ll reboot and make sure we can connect to the host. These changes can all be made in a terminal, however, the configuration tool makes it easier if your Linux skills are rusty.

Here’s what we’ll be doing:

1. Change User Password
1. Localisation Options
1. Advanced Options
1. Network Options

Launch the raspi-config utility with this command.

```shell
sudo raspi-config
```

The main menu appears:
{% include image.html url="/img/post-assets/2020-03-10-how-to-configure-raspbian/raspi-config-home.png" description="Raspberry Pi Software Configuration Tool Main Menu" %}
## Change User Password
Select the “Change User Password” option by pressing Enter on the top menu item, shown in red above. Enter “OK” when prompted, and then set your own, secure password.
## Localization Options
Next, update the localization options.

{% include image.html url="/img/post-assets/2020-03-10-how-to-configure-raspbian/raspi-config-localization.png" description="Raspberry Pi Software Configuration Tool Localization Menu" %}
### Change Locale
The default locale is “en_GB.UTF-8 UTF-8.” Change if desired.	
### Change Time Zone
The default time zone is “London.” Change if desired.
### Change Keyboard Layout
It is good to have a keyboard to use in case of SSH problems. I bought a Logitech K400 Plus Wireless Touch TV Keyboard with Easy Media Control and Built-In Touchpad. It has to be mapped correctly or it won’t work when you need it. The keyboard needs to be attached to the Raspberry Pi when you change the configuration so that it can be probed by Raspbian. For me, that meant moving the keyboard’s USB bluetooth connector from one Raspbian Pi to the next as I set up each of them. 

Select Change Keyboard Layout and then follow the prompts appropriately for your keyboard model. If the initial menu does not load, ensure that your keyboard is attached. For me, this happened when I moved from one Raspberry Pi to the next but forgot to move the Bluetooth USB connector.

{% include tip.html content=" When I first started I was unable to sign in to my first Raspberry Pi via ssh. I tried and tried, nothing worked. Eventually, I discovered the key mapping of the keyboard I used to reset the password was wrong. One of the special characters in my password was map to a different key, which is why I couldn’t log in over SSH from my laptop. I  reattached the keyboard, changed the password back to “raspberry,” corrected the keyboard mapping, then changed the password back again to fix the problem." %}
## Advanced Options
This configuration change is optional. Select Advanced Options:

{% include image.html url="/img/post-assets/2020-03-10-how-to-configure-raspbian/raspi-config-advanced.png" description="Raspberry Pi Software Configuration Tool Advanced Options Menu" %}
### Memory Split

Select Memory Split and reduce the amount of memory allocated for the GPU from 64mb to 16mb. This gives you a little more RAM for Kubernetes.
## Change the hostname
The last thing we’ll do before rebooting is change the hostname. This makes it possible to distinguish between this Raspberry Pis and others on your network. Return to the main menu and select Network Options.	

{% include image.html url="/img/post-assets/2020-03-10-how-to-configure-raspbian/raspi-config-network.png" description="Raspberry Pi Software Configuration Tool Network Options Menu" %}

Select Hostname and change the name from “raspberrypi” to a unique name for your cluster. I named mine “pi1” - “pi6.” Select “yes” when prompted to reboot.

Give the Pi a minute to finish rebooting, then use ssh to reconnect to the host using the same DHCP IP address you originally found on the network with the IP scanner. This time log in using the new password you set above.
## Reserved DHCP or Static IP

You’ll want to lock down the Raspberry Pi’s internet address so that it doesn’t change after a shutdown or loss of power. Most home routers have a setting to reserve the DHCP address for a device. That may be the easiest option for you, in which case, you can sign in to your home router and reserve the DHCP address of each Raspberry Pi. Alternatively, you can give each Raspberry Pi a static IP address.
### Static IP Addresses 

To use static IP addresses, sign in to your home router and find its DHCP address range.

{% include image.html url="/img/post-assets/2020-03-10-how-to-configure-raspbian/DHCP_range.png" description="Home Router DHCP Server IP Range" %}

DHCP addresses start at 192.168.1.100 on the router shown above, so addresses below 192.168.1.100 are available to use as static IP addresses. Edit /etc/dhcpcd.conf and find the section named “Example of static IP configuration.” Uncomment the interface line, and change the routers and domain main servers to be the Router’s LAN IPv4 Address pictured above, and set the static IP address to the desired IP. I left the IPv6 address commented out, but you can set that too if you like.

```shell
sudo vi /etc/dhcpcd.conf
sudo reboot
```

The updated settings should look something like this:

{% include image.html url="/img/post-assets/2020-03-10-how-to-configure-raspbian/static_ip.png" description="Example Static IP Configuration" %}

Before connecting to the host you may need to remove the old IP address from your laptop’s ~/.ssh/known_hosts. Edit ~/.ssh/known_hosts, delete the line starting with the Pi’s old DHCP IP address, and save the file. 

To test the change, ssh to the host using the new static IP address.

```shell
ssh pi@192.168.1.10
```

# Booting from SSD
Technically, the Raspberry Pi 4 doesn’t support booting from SSD yet. You can get around this booting issue by assigning root path to /dev/sda. Technically, the Raspberry Pi still boots from the MicroSD card but then all reads and writes to the root directory happens on the mSATA drive. This "Try At Home" <a href="https://www.youtube.com/watch?v=FM9wuFLufyA">YouTube video</a> gives great step-by-step instructions.

{% include tip.html content="This optional step, to boot from an SSD, may differ depending on your setup. My SSD mounted as /dev/sda, but yours may not. To find your SSD run the “sudo fdisk --list” command. Your SSD will be described like “Disk /dev/sda: 238.5 GiB, Disk model: SD mSATA.” Take note of the path, e.g. /dev/sda, and use that wherever you see “/dev/sda” referenced below." %}

The video linked above explains what to set up the SSD. Here is a summary of the commands issued in the video. Watch the video for a full explanation.

Find the SSD drive and repartition it.

```shell
sudo fdisk --list # (to find your SSD)
sudo fdisk /dev/sda
```

Once you launch fdisk perform the following steps:

1. “p” to print the partitions. There should be none. If there are any partitions, use “d” to delete them.
2. “n” to create a new partition. 
* Accept the default, “p” (primary)
*  Accept the first sector start.
*  Accept the last sector start.
3. “w” to write the partition.

Next, use mkfs to format the new partition. Answer “y” when prompted whether to proceed despite a dos partition being found.

```shell
sudo mkfs.ext4 /dev/sda
```

When the format operation completes, run the following commands to copy the MicroSD card to the SSD.

```shell
sudo mkdir /media/external
sudo mount /dev/sda /media/external
cd /media/external
sudo rsync -avx --exclude /media/external / /media/external/
```

## Switching the Boot Drive
The last step in the process is to change the Raspberry Pi to use the micro SATA as the root. Two changes are needed in the  /boot/cmdline.txt file:

1. Change the root location
1. Set the usb-storage.quirks parameter using the vendor id and part number of your USB to SSD converter to prevent it from binding to the “uas” storage driver.

Make a backup before editing  /boot/cmdline.txt:

```shell
sudo cp /boot/cmdline.txt /boot/cmdline.txt.bak
```

Carefully edit /boot/cmdline.txt and change the root path, "root=/dev/sda," and append the usb-storage.quirks parameter, i.e. "usb-storage.quirks=045b:0229:u."

{% include tip.html content="To learn how to use \"usb-storage.quirks\" to bind to the right USB storage driver, see my side note: <a href='https://smitchell.github.io/side_notes/how-to-bind-to-the-right-usb-storage-driver.html'>How to bind to the right USB Storage Driver</a>." %}

Here is how the cmdline looks before and after editing.
### BEFORE

console=serial0,115200 console=tty1 root=PARTUUID=738a4d67-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait

### AFTER
console=serial0,115200 console=tty1 root=<span style="color:red">/dev/sda</span> rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait <span style="color:red">usb-storage.quirks=045b:0229:u</span

Reboot and then reconnect to the host and verify the change with the findmnt command. 

```shell
findmnt -n -o SOURCE /
```

The response from “findmnt” should be “/dev/sda” (or whatever you passed into cmdline.txt).

{% include tip.html content="Extend the life of your MicroSD or SSD with a few tweaks: <a href='/side_notes/how-to-reduce-writes-to-ssd.html'>How to Reduce Writes to SSD</a>." %}

### The Raspberry Pi won’t boot - What do I do?
If you make a mistake in the cmdline.txt file, booting might fail. No worries. That is why you made a backup copy of cmdline.txt before making changes. Remove the MicroSD card from the Pi, pop it into your computer, and restore the original /boot/cmdline.txt file from the backup you created. Problem solved.
## Rinse and Repeat
Repeat this process for each Raspberry Pi. The next post will cover simple tips that making working on your Raspberry Pis a pleasure.

# Next Steps

In my next article we will cover installing Kubernetes and setting up your cluster.

----

# References
* <a href="https://angryip.org/">https://angryip.org</a>
* <a href="https://iterm2.com/">https://iterm2.com</a>
* <a href="https://www.balena.io/etcher/">https://www.balena.io/etcher</a>
* <a href="https://manhattanproducts.us/manhattan-en-mini-multi-card-readerwriter-101981.html">https://manhattanproducts.us/manhattan-en-mini-multi-card-readerwriter-101981.html</a>
* <a href="https://www.electromaker.io/blog/article/12-best-linux-operating-systems-for-the-raspberry-pi">https://www.electromaker.io/blog/article/12-best-linux-operating-systems-for-the-raspberry-pi</a>
* <a href="https://www.raspberrypi.org/documentation/installation/installing-images/">https://www.raspberrypi.org/documentation/installation/installing-images</a>
* <a href="https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address/">https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address</a>
* <a href="https://www.raspberrypi.org/documentation/remote-access/ssh/">https://www.raspberrypi.org/documentation/remote-access/ssh</a>
* <a href="https://www.raspberrypi.org/documentation/raspbian/updating.md">https://www.raspberrypi.org/documentation/raspbian/updating.md</a>
* <a href="https://www.youtube.com/watch?v=FM9wuFLufyA">https://www.youtube.com/watch?v=FM9wuFLufyA</a>


