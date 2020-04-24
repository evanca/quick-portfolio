### The Zones Project

#### Project Description
Zones was collaborative project between Alan Dormer, Black Bear Software and myself.
It involved the development two mobile-based Augmented Reality (AR) installations. AR enriches and enhances our experience of real-world environments by overlaying new perceptual information that seamlessly integrates into our experience of an environment in realtime. This combination of the real and virtual worlds opens up new interactive and experiential possibilities.

#### How it Worked
We created two location/proximity-aware installations that were delivered over mobile devices with headphones. The system was driven by a mobile phone application interacting with a Bluetooth (BLE 4.0) beacon infrastructure. The system mapped audio and images to specific locations within the environments. Participants could then navigate through the spaces and the sounds they were hearing and images they were seeing over the app would change depending on the route they took through the environment.  

#### The Design Process
My role involved the design of the visual and audio elements for each installation, assistance in the design and testing of the underlying AR framework and to install each piece. The development process involved working with Alan and the development team at Black Bear to put together a prototype. With this in place we set up an indoor testing space and an outdoor space. We installed the prototype in both spaces and began user testing. We adopted an iterative approach to design where testing would be followed by consultation with Black Bear who would implement our changes.

#### Sound Design & Sonification
The first installation involved 7 different sonifications of data from the European migrant crisis. Two datasets were used. The first represented the number of migrants lost at sea between the 01/10/2015 and the 24/08/2016 and the second represented Syrian Emigration Rate 2007-2014. Data was acquired from the UNHRC and the World Bank's open data resources.

The 6 sonifications of those lost at sea were created using granular synthesis techniques (in Csound) where audio files containing recordings of the Mediterranean sea were split into tiny pieces called grains and then reassembled to create timbral structures termed 'grain clouds'. The data was mapped to control the parameters of these grain clouds: amplitude, density, transposition factor, octaviation ratio and grain size. The original recording of waves in the Mediterranean sea was  reprocessed to become a sonification. The end result is a sonification that still sounds like the sea, but the sound rises in intensity to reflect the data. The original recording of the waves is then mixed back into the sonification to create the final audio stream.


- [Original Recording of Waves](/original file is waves.mp3)
- [Sonification made from recording](/sonification file is waves1.mp3)

- [Final File: Data & Waves](/MedSon1.mp3)

A number of additional sonifications were created in which the data is mapped to slightly different timescales or parameters.

- [Example 1](/MedSon1.mp3)
- [Example 2](/MedSon3.mp3)
- [Example 3](/MedSon5.mp3)

The data representing the Syrian emigration rate was dealt with differently. This data was mapped to midi control change (CC) values and used to control the level of distortion applied to a tone that was synthesised using wavetable synthesis techniques in Logic Pro X. The results is a drone that grows in intensity to reflect the changes in the original dataset.

[Drone Sonification](/OtherSon.mp3)

Soundscape recordings were gathered from sources in Middle Eastern countries and Europe. Further sound design elements included material taken from TV and Radio broadcasts about the crisis, which were edited into a collage and soundscapes designed to evoke a sense off empty space.

[Radio Collage 1](/Radio1.mp3)

#### Visual Design
We chose a clean and minimalistic approach to the design of the visuals components for the app. I created some visual elements for the landing page and re-processed (glitched) as series of images representing the different environments. The app was reactive to the users location so rather than touching or swiping it was responsive to their movement throughout the physical space and virtual environments.

<img src="images/app/about.png?raw=true"/><br/>
About Page
<img src="images/app/hold.png?raw=true"/><br/>
Holding Page
<img src="images/app/page4.png?raw=true"/><br/>
Location 4
<img src="images/app/page5.png?raw=true"/><br/>
Location 5

#### Experience Design

Each installation had a number of distinct environments each with their own soundscape and associated imagery. As you move through the physical space you can explores these different environments. Three of these environments are tied to specific places. One environment is comprised of soundscapes from Syria, another consists of the Mediterranean sea sonifications and a third is comprised of soundscapes from around Europe. The remaining three are more abstract sonic landscapes. One sonic landscape is designed to sound like an idealised empty space or void.  A second is comprised of relevant media material from TV and radio broadcasts and a third is comprised of the sonification of the Syrian emigration rate described previously.
Mobile technologies played an [important role in helping people navigate their way out of Syria and into Europe at the onset of the Syrian Civil War.](https://www.wired.com/2015/12/smartphone-syrian-refugee-crisis/) The Zones project was designed with this phenomenon in mind allowing the audience members to navigate through an analogous series of environments using their own mobile devices.

#### Installations & Iterations
The first iteration of Zones was installed at the the Craft Village in Derry where it was open to public audiences for three days as part of the 2016 Irish Sound Science and Technology Festival. The installation was well received and covered on local radio.

<img src="images/craft_village.jpg?raw=true"/><br/>

[Zones 1 Example](/Standing at Edge.mp3)

We were invited to install a second iteration of Zones indoors at the International Workshop on Digital Empathy in The Great Hall at Ulster University's Magee Campus in Derry.
The second iteration of Zones was a sizeable improvement over the first. Additional sonification and audio elements were introduced to account for the new location and a new soundscape elements were designed punctuate this new experience. The environment that had previously comprised of a sonification of Syrian emigration data was now populated with droning tones created using wavetable synthesis methods.

[2](/Standing in Center.mp3)
[Son 2](/Standing at Edge.mp3)

[Moving through the Center](/Standing in Center.mp3)
[Moving around Edge 4](/Standing at Edge.mp3)
[Approaching Dronescape from Edge 2](/Standing at Edge.mp3)
