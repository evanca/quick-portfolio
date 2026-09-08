---
title: Smart Flip Clock
description: A 3D-printed, Raspberry Pi powered flip clock that shows the time and the weather using four tiny stepper motors, built for under $20.
date: 2019-06-01
order: 3
featured: true
tags:
  - 3d-printing
  - raspberry-pi
  - python
  - hardware
thumbnail:
  src: /images/3dprints/flipclock_render.png
  alt: CAD render of the flip clock
---

So far, this has been my longest project to date. I set out to make a "smart" flip clock, where the digits and other information are displayed using a 70s-style flipping mechanism. I had a few constraints to limit the project: it would be powered by a Raspberry Pi, and the whole thing had to be made for under $20. That was made possible by sourcing four small stepper motors online and using wires I already had. The majority of the project was the CAD design of the mechanism; a small part went to the Python code that indexes each digit and displays the information.

After three months, the clock can display the time, and shows the weather when the button on the side is pressed. There is also a pause function for when I need it to be extra quiet. Here are a few pictures of the progress along the way.

This is a render of the clock nearing its final version. The only thing it doesn't have yet is a spot for the weather button.

![CAD render of the flip clock](/images/3dprints/flipclock_render.png)

I hadn't used stepper motors before, and now I really like them.

<video autoplay loop muted playsinline preload="metadata" src="/images/3dprints/flipclock_first.mp4" aria-label="The first single-digit prototype flipping"></video>

Pretty much the same thing as before, times four. I put sticky notes on to see if I'd be able to display some information this time.

<video autoplay loop muted playsinline preload="metadata" src="/images/3dprints/flipclock_second.mp4" aria-label="Four digits flipping with sticky-note faces"></video>

The black letters you see here are all 3D printed as well. This part took a while, with all of the small pieces needing precise gluing.

<video autoplay loop muted playsinline preload="metadata" src="/images/3dprints/flipclock_third.mp4" aria-label="Printed digits installed on the flaps"></video>

Here it is as it sits on my desk. No more test jumpers hanging around.

<video autoplay loop muted playsinline preload="metadata" src="/images/3dprints/flipclock_fourth.mp4" aria-label="The finished flip clock on a desk"></video>

I'm happy to say this project turned out so well. I previously relied on my phone as an alarm and used my computer as my main source of time, but now this is a good-looking way to get the time at a glance.
