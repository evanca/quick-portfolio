---
layout: sidenote
title:  "How to Multicast Commands"
comments: true
date: 2020-03-07
author_name : Steve Mitchell
author_url : /author/steve
author_avatar: steve
show_avatar : false
read_time : 4
show_related_posts: false
---

If you are more Dev than Ops, like me, then you will think this is cool. If you are more Ops than Dev, then you already know how to do this. When I press ⌘-⇧-P from iTerm I am immediately connected to all my Raspberry Pis at the same time. It’s great for running simultaneous software updates.

## Ta-Dah!

{% include image.html url="/img/side-note-assets/how-to-multicast-commands/tadah.png" description="Sign-in with Shortcut" %}

It just takes three steps to do:

1. Add the Raspberry Pis to your Host’s File
2. Use SSH Keys for Authentication
3. Save a terminal session that automatically signs into all of your nodes from a shortcut key.

## Add the Raspberry Pis to your Host’s File

Add the hostname of all the Raspberry nodes to the /etc/hosts file on your computer.

{% include image.html url="/img/side-note-assets/how-to-multicast-commands/hostsfile.png" description="Add Pis to Hosts File" %}

## Use SSH Keys for Authentication

Complex passwords are a drag to type over and over, so use SSH keys to authenticate with your Raspberry Pi nodes. You’ll need RSA keys on your laptop. Look in ~/.ssh. If you don’t have one, use ssh-keygen to create one:

```shell
ssh-keygen
```

Once you have an RSA Key, send it to each Raspberry Pi node with ssh-copy-id. 

```shell
ssh-copy-id -i ~/.ssh/id_rsa.pub  pi@pi1
```

You can now ssh into pi1 without a password. Repeat for each Raspberry Pi node in your cluster.

## Automatically Sign in to all the Nodes at Once

This last step takes a bit of work to set-up, but it allows you to use a keyboard shortcut in iTerm to open terminals to all of your Raspberry Pi nodes at once. This allows you to automatically sign in to all of them. Next, you can use iTerm’s “Broadcast Input to all Panes” feature to send keystrokes simultaneously to all the nodes.

Read <a href="https://blog.andrewray.me/how-to-create-custom-iterm2-window-arrangments/">Andrew Ray’s blog post</a> and follow his step-by-step instructions. Here are the screenshots from my setup.

Split your terminal window into panes for all the Raspberry Pi nodes, then create a separate profile for each host.

{% include image.html url="/img/side-note-assets/how-to-multicast-commands/iterm-profile_anotated.png" description="Create Profile for Each Host" %}

Note how the “Send text at start” field is set to “ssh pi@pi1” to log into the host. Each profile signs into a different host. 

Select each terminal pane and create a session. Select the corresponding profile from the list and click the Use Selected Profile button.

{% include image.html url="/img/side-note-assets/how-to-multicast-commands/iterm-session.png" description="Create a Session in each Pane linked to a Profile" %}

When all of the terminal panes are tied to a session, save the entire window.

{% include image.html url="/img/side-note-assets/how-to-multicast-commands/iterm-saveWindows.png" description="Save all the Panes in the Window" %}

Finally, add a shortcut to open the window. I chose ⌘-⇧-P (for Pi).

{% include image.html url="/img/side-note-assets/how-to-multicast-commands/iterm-shortcut.png" description="Add Keyboard Shortcut to Launch Window" %}

Now, when I open iTerm and press, ⌘-⇧-P, iTerm opens a window with six sessions, each automatically connected to each Raspberry Pi.

{% include image.html url="/img/side-note-assets/how-to-multicast-commands/tadah.png" description="Sign-in with Shortcut" %}

To simultaneous type in all six terminal windows, use iTerm’s Broadcast feature.

{% include image.html url="/img/side-note-assets/how-to-multicast-commands/iterm-broadcast.png" description="How to Broadcast Keystrokes to all Raspberry Pis" %}

That’s it. These three things will make working with your Raspberry Pi cluster so much more enjoyable.

----
# References

* <a href="https://pimylifeup.com/raspberry-pi-ssh-keys/">https://pimylifeup.com/raspberry-pi-ssh-keys<a>
* <a href="https://blog.andrewray.me/how-to-create-custom-iterm2-window-arrangments/">https://blog.andrewray.me/how-to-create-custom-iterm2-window-arrangments<a>




