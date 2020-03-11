---
layout: sidenote
title:  "How to Reduce Writes to SSD"
comments: true
date: 2020-03-10
author_name : Steve Mitchell
author_url : /author/steve
author_avatar: steve
show_avatar : false
read_time : 4
show_related_posts: false
---
## Reduce Writes to the MicroSD or SSD
Whether or not you use an SSD, you should know that too many writes shorten the life of MicroSD cards and SSDs. To reduce the number of writes, I applied some tips from this post by <a href="http://ideaheap.com/2013/07/stopping-sd-card-corruption-on-a-raspberry-pi/">Nicholas Wertzberger</a>.

### Disable Swapping
```shell
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove
### Moving logging to tempfs
```

Edit /etc/fstab and add the following for lines.

```shell
tmpfs    /tmp    tmpfs    defaults,noatime,nosuid,size=100m    0 0
tmpfs    /var/tmp    tmpfs    defaults,noatime,nosuid,size=30m    0 0
tmpfs    /var/log    tmpfs    defaults,noatime,nosuid,mode=0755,size=100m    0 0
tmpfs    /var/spool/mqueue    tmpfs    defaults,noatime,nosuid,mode=0700,gid=12,size=30m    0 0
```

These changes should help extend the life of your MicroSD or SSD.

----

## References

* <a href="https://www.zdnet.com/article/raspberry-pi-extending-the-life-of-the-sd-card/">https://www.zdnet.com/article/raspberry-pi-extending-the-life-of-the-sd-card</a>
* <a href="http://ideaheap.com/2013/07/stopping-sd-card-corruption-on-a-raspberry-pi/">http://ideaheap.com/2013/07/stopping-sd-card-corruption-on-a-raspberry-pi</a>
