---
title: MIDI Stepper Motor Music
description: An open-source Arduino project that turns up to five stepper motors into musical instruments driven by any MIDI file from your DAW.
date: 2023-11-01
order: 4
featured: true
repo: https://github.com/barlowtj48/MIDI-Stepper-Motor-Music
url: https://www.tiktok.com/@bar_low/playlist/Motor%20Music-7299252254878583598
tags:
  - arduino
  - python
  - music
  - hardware
---

An open-source project that turns stepper motors into musical instruments using MIDI. Import any MIDI file into the DAW of your choice, output it to an Arduino, and use the attached stepper motors as frequency generators to play music.

**[See it in action on TikTok](https://www.tiktok.com/@bar_low/playlist/Motor%20Music-7299252254878583598)**

## How it works

A Python script bridges a virtual MIDI port (loopMIDI on Windows, IAC Driver on Mac) to an Arduino running a custom sketch. Each stepper motor is assigned to a MIDI channel. When notes are sent on that channel, the corresponding motor spins at the right frequency to produce the note. An Arduino CNC Shield with A4988 stepper drivers keeps the hardware setup straightforward.

## What you need

- Arduino Uno + CNC Shield (comes with A4988 drivers)
- NEMA 17 stepper motors
- 12V power supply
- A DAW capable of MIDI output (FL Studio, etc.)
- Python + the Arduino IDE

The project supports up to five motors and includes detailed instructions for wiring, polarity testing, software setup and troubleshooting.

**Full project and tutorial on GitHub:** [MIDI-Stepper-Motor-Music](https://github.com/barlowtj48/MIDI-Stepper-Motor-Music)
