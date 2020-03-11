---
layout: sidenote
title:  "How to bind to the right USB storage driver"
comments: true
date: 2020-03-07 10:16:00
author_name : Steve Mitchell
author_url : /author/steve
author_avatar: steve
show_avatar : false
read_time : 4
show_related_posts: false
---
In the article <a href="https://smitchell.github.io/how-to-configure-raspbian-linux">How to Configure Raspbian Linux</a> we discuss the usb-storage.quirks parameter to bind to the right storage manager. This side note goes on to explain in more detail.

{% include tip.html content="All you have to do for this step is to find the vendor and part number of your USB to mSATA adapter <a href='http://www.linux-usb.org/usb.ids'>here</a> and append the usb-storage.quirks parameter to /boot/cmdline.txt. 
 Given the vendor, 045b, and part, 0229, the parameter to add to /boot/cmdline.txt would look like this: \"usb-storage.quirks=045b:3483:u\". This article goes on to explain why you need the usb-storage.quirks parameter, and how I found my vendor and part number. You can stop here if you found your vendor and part number on <a href='http://www.linux-usb.org/usb.ids'>http://www.linux-usb.org/usb.ids</a>.
" %}

Some posts I read about booting from SSD mentioned usb-storage.quirks. I began to worry that I had missed an important step. The issue is that in certain situations, the Linux "uas" storage driver disables SAT transfers. You can see which storage driver is in use with the lsusb command or dmesg command as shown below.

{% include image.html url="/img/side-note-assets/how-to-bind-to-the-right-usb-storage-driver/lsusb_cmd.png" description="Checking the Storage Drive type with lsusb" %}

{% include image.html url="/img/side-note-assets/how-to-bind-to-the-right-usb-storage-driver/dmesg-scsi.png" description="Checking the Storage Driver type using dmesg" %}

As you can see above, Raspbian uses the "uas" storage driver, not the older "usb_storage" driver. We need to keep the mSATA from binding to the uas storage driver with the usb-storage.quirks setting. 

The usb-storage.quirks parameter, e.g. “usb-storage.quirks=045b:3483:u”, is documented on the <a href="https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html">Kernel Parameters page</a>. It documents that the "u" on the end instructs the kernel NOT to bind that vendor and part to the uas storage driver, thus avoiding the compatibility problems.

> u = IGNORE_UAS (don't bind to the uas driver)

All you have to do is figure out the vendor and part number to use. To learn that, and a lot more, about your Raspberry Pi, you can install hwinfo.

```shell
sudo apt get hwinfo
hwinfo --scsi
```

The output shows my INDMEM mSATA is bound to the "uas" storage driver, but Vendor and Device are not hexadecimal numbers. To get those, I had to find my USB to mSATA converter.

{% include image.html url="/img/side-note-assets/how-to-bind-to-the-right-usb-storage-driver/hwinfo_scsi_before.png" description="mSATA attached to uas Storage Driver (which is not what we want)" %}

I ran the hwinfo specifying "--all" and then I searched for "mSATA." I found the renkforce mSATA Adapter.

```shell
hwinfo --all
```

{% include image.html url="/img/side-note-assets/how-to-bind-to-the-right-usb-storage-driver/hwinfo-usb-to-msata.png" description="USB to mSATA Converter" %}

To verify that was what I needed, I went over to the Linux USB Id directory, <a href="http://www.linux-usb.org/usb.ids">http://www.linux-usb.org/usb.ids</a>, and looked up "renkforce".

{% include image.html url="/img/side-note-assets/how-to-bind-to-the-right-usb-storage-driver/usb.ids.png" description="Vendor and Part from http://www.linux-usb.org/usb.ids" %}

Feeling confident that I had the correct information, I made a backup of /boot/cmdline.txt, and then added the usb-storage.quirks parameter.

console=serial0,115200 console=tty1 root=/dev/sda rootfstype=ext4 elevator=deadline fsck.repair=yes rootwai usb-storage.quirks=045b:0229:u

After rebooting, I used hwinfo again to verify that the change had worked.

{% include image.html url="/img/side-note-assets/how-to-bind-to-the-right-usb-storage-driver/hwinfo_scsi_after.png" description="The Drive Module is now usb_storage instead of uas" %}

Alternatively, I could have verified it worked with the lsusb command:

{% include image.html url="/img/side-note-assets/how-to-bind-to-the-right-usb-storage-driver/lsusb_after.png" description="The Drive Module is now usb_storage instead of uas" %}

That’s it. You should now avoid any USB SATA compatibility issues caused by the “uas" storage driver.

----

# References

* <a href="https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html">https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html</a>
* <a href="https://www.2daygeek.com/how-to-check-system-hardware-manufacturer-model-and-serial-number-in-linux/">https://www.2daygeek.com/how-to-check-system-hardware-manufacturer-model-and-serial-number-in-linux</a>
* <a href="http://www.linux-usb.org/usb.ids">http://www.linux-usb.org/usb.ids</a>
* <a href="https://www.raspberrypi.org/forums/viewtopic.php?t=245931">https://www.raspberrypi.org/forums/viewtopic.php?t=245931</a>
