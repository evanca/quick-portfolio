## The Zones Project

### Project at a Glance
Zones was collaborative project I undertook with Black Bear Software.
It involved the development of two mobile-based Augmented Reality (AR) installations.
AR enriches and enhances our experience of real-world environments by overlaying new perceptual information that seamlessly integrates into our experience of an environment in realtime. This combination of the real and virtual worlds opens up new interactive and experiential possibilities.

### Client/Partners/Stakeholders:
<img src="images/bb.png?raw=true"/><br/>
<img src="images/issta.png?raw=true"/><br/>
<img src="images/digi E.png?raw=true"/><br/>


### Design Goal:
The goal was to use the technology that had been developed by the company to create uniquely immersive AR experiences.

### Research Questions:
1. What is the best way to set up the physical hardware in the space?
2. How should we design the mobile application to support immersion?
3. What role should sound play and what role should visuals play?

### Research Methodology
<img src="images/plan.png?raw=true"/><br/>

The approach here was design focused. Initial needs were gathered with the company and ideas weredeveloped in a workshop session. I then designed a prototype and shifted to a research-led iterative design process. Two key sets of stakeholders had to be accounted for here. The company involved and the audience at the events where the experiencs would be installed.  

<img src="images/ins1.png?raw=true"/><br/>

### Results: Key Insights
- A. Delivering sound and visuals via the mobile app makes for a more immersive, personal experience.
- B. Allow users to discover points of interest in the space through exploration.
- C. Sound should support exploration, visuals should reveal newly discovered information.

<img src="images/ins1b.png?raw=true"/><br/>

### Results: Design Impact
A: Delivering sound and visuals via the mobile app makes for a more immersive experience.
- A1. Later prototypes allow users to use earphones to listen and to view imagery on their smart devices.
- A2. Early prototypes presented imagery on screens in the space and sound via speakers in the space.

B: Allow users to discover points of interest in the space through exploration.
- B1. Later prototypes supported exploration and play.
- B2. Early prototypes led listeneres through the experience like a tour.

C: Sound should support exploration, visuals should reveal newly discovered information.
- C1. Later prototypes used sound for way-finding and visuals to present information .
- C2. Early prototypes used visual wayfinding and sound was used for aesthetics only.


<img src="images/in2.png?raw=true"/><br/>


### Detailed Overview
#### How it Works
We created two location/proximity-aware installations that were delivered over mobile devices with headphones. The system was driven by a mobile phone application interacting with a Bluetooth (BLE 4.0) beacon infrastructure. The system mapped audio and images to specific locations within the environments. Participants could then navigate through the spaces and the sounds they were hearing and images they were seeing over the app would change depending on the route they took through the environment.  

Poster:
<img src="images/Poster.png?raw=true"/><br/>

#### The Design Process
My role involved the design of the visual and audio elements for each installation, assistance in the design and testing of the underlying AR framework and to install each piece. The development process involved working with Alan and the development team at Black Bear to put together a prototype. With this in place we set up an indoor testing space and an outdoor space. We installed the prototype in both spaces and began user testing. We adopted an iterative approach to design where testing would be followed by consultation with Black Bear who would implement our changes.

#### Sound Design & Sonification
The first installation involved 7 different sonifications of data from the European migrant crisis. Two datasets were used. The first represented the number of migrants lost at sea between the 01/10/2015 and the 24/08/2016 and the second represented Syrian Emigration Rate 2007-2014. Data was acquired from the UNHRC and the World Bank's open data resources.

The 6 sonifications of those lost at sea were created using granular synthesis techniques (in Csound) where audio files containing recordings of the Mediterranean sea were split into tiny pieces called grains and then reassembled to create timbral structures termed 'grain clouds'. The data was mapped to control the parameters of these grain clouds: amplitude, density, transposition factor, octaviation ratio and grain size. The original recording of waves in the Mediterranean sea was  reprocessed to become a sonification. The end result is a sonification that still sounds like the sea, but the sound rises in intensity to reflect the data. The original recording of the waves is then mixed back into the sonification to create the final audio stream.

Original Recording of Waves:
- [Original](Zones 1/Audio/Lost at sea/Waves.mp3)

Sonification made from original recording:
- [Sonification](Zones 1/Audio/Lost at sea/Waves1 Sonified.mp3)

Finished Audio Mixing Waves and Sonification:
- [Final File: Data & Waves](Zones 1/Audio/Lost at sea/MedSon1.mp3)

A number of additional sonifications were created in which the data is mapped to slightly different timescales and synthesis parameters.

- [Medson3](Zones 1/Audio/SR/B3/MedSon3.mp3)
- [Medson4](Zones 1/Audio/SR/B3/MedSon4.mp3)
- [Medson5](Zones 1/Audio/SR/B3/MedSon5.mp3)

The data representing the Syrian emigration rate was dealt with differently. This data was mapped to midi control change (CC) values and used to control the level of distortion applied to a tone that was synthesised using wavetable synthesis techniques in Logic Pro X. The results is a drone that grows in intensity to reflect the changes in the original dataset.

- [Drone Sonification](Zones 1/Audio/SR/B2/Son.mp3)

Soundscape recordings were gathered from sources in Middle Eastern countries and Europe. A number of these were recorded by Alan.
I processed these recordings further using distortion and artificial glitching techniques. Further sound design elements included material taken from TV and Radio broadcasts about the crisis, which were edited into a collage and soundscapes designed to evoke a sense off empty space.

Media Environment:
- [Media Collage 1](Zones 1/Audio/SR/B4/Rad1.mp3)
- [Media Collage 2](Zones 1/Audio/SR/B4/Rad2.mp3)
- [Media Collage 3](Zones 1/Audio/SR/B4/Rad3.mp3)

Empty Environment:
- [Empty Space 1](Zones 1/Audio/SR/B6/Emp1.mp3)
- [Empty Space 3](Zones 1/Audio/SR/B6/Emp3.mp3)
- [Empty Space 5](Zones 1/Audio/SR/B6/Emp5.mp3)

Navigating through Zones 1:
- [Zones 1 Installation](Zones 1/Audio/Zones_1.mp3)

#### Visual Design
We chose a clean and minimalistic approach to the design of the visuals components for the app. I created some visual elements for the landing page and re-processed (glitched) as series of images representing the different environments. The app was reactive to the users location so rather than touching or swiping it was responsive to their movement throughout the physical space and virtual environments.

About Page:
<img src="images/app/about.png?raw=true"/><br/>
Holding Page:
<img src="images/app/hold.png?raw=true"/><br/>
Location 4:
<img src="images/app/page4.png?raw=true"/><br/>
Location 5:
<img src="images/app/page5.png?raw=true"/><br/>

#### Experience Design
Each installation had a number of distinct environments each with their own soundscape and associated imagery. As you move through the physical space you can explores these different environments. Three of these environments are tied to specific places. One environment is comprised of soundscapes from Syria, another consists of the Mediterranean sea sonifications and a third is comprised of soundscapes from around Europe. The remaining three are more abstract sonic landscapes. One sonic landscape is designed to sound like an idealised empty space or void.  A second is comprised of relevant media material from TV and radio broadcasts and a third is comprised of the sonification of the Syrian emigration rate described previously.
Mobile technologies played an [important role in helping people navigate their way out of Syria and into Europe at the onset of the Syrian Civil War.](https://www.wired.com/2015/12/smartphone-syrian-refugee-crisis/) The Zones project was designed with this phenomenon in mind allowing the audience members to navigate through an analogous series of environments using their own mobile devices.

#### Installations & Iteration 2
The first iteration of Zones was installed at the the Craft Village in Derry where it was open to public audiences for three days as part of the 2016 Irish Sound Science and Technology Festival. The installation was well received and covered on local radio and we delivered a conference presentation about the development of the system:

[Sound Place and Multi-place @ The Irish Sound Science and Technology Association Conference, Ulster University, September 7th 2016](https://drive.google.com/file/d/1GuGESpqTsXv98x-d86LRmn9hikweBm5n/view)

<img src="images/craft_village.jpg?raw=true"/><br/>

We were invited to install a second iteration of Zones indoors at the International Workshop on Digital Empathy in The Great Hall at Ulster University's Magee Campus in Derry.
The second iteration of Zones was a sizeable improvement over the first. Additional audio elements were introduced to account for the new location and a new soundscape elements were designed punctuate this new experience. The environment that had previously comprised of a sonification of Syrian emigration data was now populated with droning tones created using a variety of methods including wavetable synthesis and formant synthesis.

Navigating through Zones 2:
- [Moving through the Center](/Zones 2/Audio/Full Recordings/Z2_Centre.mp3)
- [Moving around Syria](/Zones 2/Audio/Full Recordings/Z2_SyriaScape.mp3)
- [Approaching the DroneScape](/Zones 2/Audio/Full Recordings/Z2_DroneScape.mp3)


For example, in the DroneScape Sonification above data is mapped to control the pitch and formant shape, of a formant synthesis method, [fof synthesis to be precise](https://www.jstor.org/stable/3679809?seq=1) implemented with Csound. The data also controls the intensity of a Doppler shifting effect applied to the signal.


<img src="images/great_hall.jpg?raw=true"/><br/>
