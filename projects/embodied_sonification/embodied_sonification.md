## Embodied Sonification

### Project Overview
Sonification is the representation of data with sound and Auditory Display is the use of audio to present information to a listener. In certain contexts and for certain types of data sound can be an effective means of representation and communication. This project involved the development of Sonification and Auditory Display frameworks based on human-centered design principles derived from embodied cognition an area of cognitive science that is critical to our understanding of meaning-making in cognition. The research and development portions of the project were carried out in fulfillment of a PhD degree at the Department of Electronic and Electrical Engineering in Trinity College Dublin under the supervision of Dr. Dermot Furlong. Throughout the project music composition and sound design practices informed by the embodied cognition literature were employed as exploratory research methods. This helped to identify exciting new possibilities for mapping data to sound. These possibilities were then empirically tested to confirm their efficacy for sonification tasks. A number of data-driven musical works were created as a byproduct of the research process.

### Coding & Technology
The majority of the project was coded in Csound a programming language for audio written in C. Many of the stimuli used experiments and evaluations were also produced in Csound. Additional sounds and stimuli were produced in Native Instruments Reaktor 5 and production work was carried out int the Logic Pro X DAW. Rapid prototyping platforms were developed in Csound and used to prototype new ideas in an efficient manner. The two prototyping platforms below were developed using fof (fonction d'onde formantique') synthesis methods and generate simulated vocal gestures.

* [Prototyping Platform 1](code/Prototyping_Model1_Vocal_Gesture2015)<br/>
* [Prototyping Platform 2](code/Prototyping_Model2_Vocal_Gestures2015)<br/>

<img src="images/CsoundCode.png?raw=true"/><br/>

### Data to Sound
The project involved the development of new techniques and frameworks for mapping a range of datatypes to sound in order to represent changes in the original data set.
Physical and spatial datatypes like temperature, distance, height, weight, speed, amount, texture, etc. were used in the project.Weather data was also used. As the project progressed the focus fell increasingly on socio-economic data

The first phases of the project dealt with the concept of 'polarity'. It examined whether listeners interpret increases in a sonic dimension (e.g. pitch, tempo) to increases in the data represented or decreases in the data represented. I investigated how this operated for 'numerical data', (i.e. data that is a count of some specific thing like population, chemical concentration, RPM, etc.), and attribute data, (i.e. data that describes some attribute of a thing like size, depth, mass, etc.). <br/>

**Pure Sine Tone Examples:**<br/>
[Increasing Frequency](audio/Ch2/Experiment C Pitch.mp3) | [Decreasing Frequency](audio/Ch2/Experiment B Pitch.mp3) | [Increasing Tempo](audio/Ch2/Experiment C rhythm.mp3) | [Decreasing Tempo](audio/Ch2/Experiment B rhythm.mp3)

The second phase explored the kinds of data that can be best represented with simulated vocal gestures. This phase made use of the vocal gesture prototyping platforms.

**Effective Vocal Gesture Examples:**<br/>
[Texture](audio/Ch3/Rough Smooth.mp3) | [Amount](audio/Ch3/Amount.mp3) | [Speed](projects/embodied_sonification/audio/Ch3/Speed.mp3) | [Size](audio/Ch3/Size.mp3) [Spatial Extent](audio/Ch3/Spatial.mp3) | [Tension](audio/Ch3/Vowel Tension.mp3) | [Anger](audio/Ch3/Anger.mp3)

The third phase examined how soundscapes can be used to represent data. Initial soundscape elements were synthesised and mapped to data using prototyping platforms in Csound but this approach was abandoned in favour of soundscape recordings that could be manipulated and mapped to data. This section explored how the concepts of conceptual metaphor and blending can be applied to design better soundscape sonifications.

**Soundscape Sonification:**<br/>
[Sonification of Irish GDP from 1979 to 2013](audio/Ch4/Sonification.mp3) | [Emigration Low](audio/Ch4/Emigration Place Lo.mp3) | [Emigration High](audio/Ch4/Emigration Place Hi.mp3) | [Poverty Low](audio/Ch4/Poverty Meta Lo.mp3) | [Poverty High](audio/Ch4/Poverty Meta Hi.mp3)

The final phase explored how doppler shifting can be used to add a sense of temporal context to a sonification:

**Temporospatial Motion Framework:**<br/>
[Original Framework](audio/Ch5/Example of Original Framework.mp3) | [Refined Framework](audio/Ch5/Example of Refined Framework .mp3)

### Research Methods
The project applied empirical research methods and involved many rounds of evaluation collecting and analysing both quantitative and qualitative data. It involved both user-centric HCI methods (e.g. user evaluations, A/B testing, surveys etc.) and more traditional psychological experiments designed to gauge users judgements of stimuli. Some pilot testing was done in with small in person groups but the majority of the testing was carried out online in order to sample from a large international group of users.

### Findings
Overall the project found that designing sonifications on the basis of principles from the field of embodied cognition generally leads to more effective solutions. The project resulted in the Embodied Sonification Listening Model, which reconciles embodied cognition principles with the task of "sonification listening": listening to a sound in order to extract information about the dataset it represents. For a more detailed description of findings see the finished document.

<img src="images/page2.png?raw=true"/><br/>

### Research Outputs
This project resulted in a number of conference presentations.

* [Roddy,  S., & Furlong, D. (2015). Embodied Auditory Display Affordances. In  Proceedings of the 12th Sound and Music Computing Conference: National  University of Ireland Maynooth (pp. 477-484).](papers/EmbodiedAffordancesinAuditoryDisplayRoddyFurlong.pdf)<br/>
* [Roddy,  S., & Furlong, D. (2015). Sonification Listening: An Empirical  Embodied Approach. In Proceedings of The 21st International Conference on Auditory Display (ICAD 2015) July 8–10, 2015, Graz, Austria.  (pp.181-187).](papers/SonificationListeningAnempiricalEmbodiedApproachRoddyandFurlong2015.pdf)<br/>
* [Roddy,  S., & Furlong, D. (2013). Embodied cognition in auditory display.  In Proceedings Of the 19th International Conference on Auditory Display,  July 6-10 Łódź, Poland ( pp. 127-134).](papers/SonificationListeningAnempiricalEmbodiedApproachRoddyandFurlong2015.pdf)<br/>
* [Roddy,  S., & Furlong, D. (2013). Rethinking the Transmission Medium in  Live Computer Music Performance. Presented at the Irish Sound Science and Technology Convocation, Dún Laoghaire Institute of Art, Design and Technology.](papers/ISSTC2013RODDY.pdf)<br/>

It also resulted in a number of journal articles including an article in [Organised Sound](papers/Organised Sound - Embodied Aesthetics in Auditory Display.pdf)<br/>
* [Organised Sound Paper](papers/Organised Sound - Embodied Aesthetics in Auditory Display.pdf)<br/>

### Creative Technology and Multimedia Outputs
Data-driven music composition and sound design techniques were used to aid in the design of sonification mapping strategies. These approaches allowed me to find novel and interesting sonic parameters for mapping data.  This practice resulted in the production of a number of data-driven sound works in the course of the research project.

These have been gathered into a collection entitled 'The Human Cost', named for the socioeconomic data from the 2008 financial crash represented in the pieces and are available from the usual streaming services online:

[Spotify](https://open.spotify.com/artist/6FZOlLhsey17jwrTGBV07c) | [Apple Music](https://music.apple.com/ie/album/the-human-cost/1278676607)

<iframe style="border: 0; width: 350px; height: 470px;" src="https://bandcamp.com/EmbeddedPlayer/album=2888609678/size=large/bgcol=ffffff/linkcol=0687f5/tracklist=false/transparent=true/" seamless><a href="http://stephenroddy.bandcamp.com/album/the-human-cost-sonification-and-irelands-economic-crash">The Human Cost: Sonification and Ireland&#39;s Economic Crash by Stephen Roddy</a></iframe>

You can learn more about  these compositions here:
[The Human Cost Sonifications](../human_cost/human_cost)

Idle Hands features on the album 'Tides - An ISSTA Anthology'. It was released on the [Stolen Mirror label](http://stolenmirror.com() and collects a many important pieces that were performed during the first 10 years of the Irish Sound Science and Technology Association's existence. You can learn more about the album and purchase it here: [http://stolenmirror.com/2021d01-tides.html](http://stolenmirror.com/2021d01-tides.html)


A number of these pieces have been performed live at academic conferences and cultural events at national and international levels including:<br/>
* [The Irish Sound Science and Technology Convocation 2014](https://s3images.coroflot.com/user_files/individual_files/711451_7SZ94dIf0s3EopLGzawCUcKWt.pdf)<br/>
* [The CMC's 2015 Salon Series in the National Concert Hall Dublin](https://www.cmc.ie/content/contemporary-music-centres-salon-series-opens-eclectic-electro-acoustic-program)<br/>
* [The International Conference on Auditory Display Concert 2015](https://iem.kug.ac.at/icad15/icad15/schedule/concerts-installations.html)<br/>
* [The Sound and Music Computing Conference 2015](https://www.maynoothuniversity.ie/smc15/concert1.html)<br/>
* [The Irish Sound Science and Technology Conference 2015](https://1.bp.blogspot.com/-ijiHIylZ-i0/XoyVxt_f-sI/AAAAAAAAGis/l86mwHCqqyUxJk-1xY-ISM3EwFUyJ3yMACLcBGAsYHQ/s1600/Issta2015%2Bcopy.jpg)<br/>
* [The International Conference on Auditory Display 2017](https://www.icad.org/icad2017/program-2/concert.html)<br/>
* [Audio Mostly 2017](https://audiomostly.com/2017/program/music-program/)

<img src="images/Issta2015 copy.jpg?raw=true"/>

### Embodied Sonification PhD Thesis
<iframe height="842" src="https://drive.google.com/file/d/0BwMBM58DHm2balNPRERtbEJYNHM/preview" width="592"></iframe><br/>

* [Digital Appendices](https://www.dropbox.com/sh/byilxk53kzkdr8b/AADpZQZO3iv0hRL7rU72Pk-ha?dl=0)<br/>
* [Link to thesis in Trinity College Dublin Repository](http://www.tara.tcd.ie/handle/2262/80506)

### Press
* [CMC Salon Series Press Release](https://www.cmc.ie/content/contemporary-music-centres-salon-series-opens-eclectic-electro-acoustic-program)<br/>
* [The Offaly Express](https://www.offalyexpress.ie/news/home/265639/offaly-man-prepares-for-unique-musical-performance-in-london.html)<br/>
* [Glór Mundo 29th September 2017](https://www.facebook.com/GlorMundO/posts/868313836667030)<br/>
* [Glór Mundo 27th September 2017](https://www.facebook.com/glormundo/posts/868313836667030)

### Outputs
This was a multidisciplinary project that resulted in a number of outputs across a broad range of disciplines.

#### Journal Articles
- [Roddy, S. (2020) Using Conceptual Metaphors to Represent Temporal Context in Time-Series Data Sonification. Interacting with Computers](https://academic.oup.com/iwc/article-abstract/doi/10.1093/iwc/iwz036/5670599)
- [Roddy, S., & Furlong, D. (2014). Embodied Aesthetics in Auditory Display. Organised Sound, 19(01), 70-77](https://www.cambridge.org/core/journals/organised-sound/article/embodied-aesthetics-in-auditory-display/65EC753E1FA165ADAB7E1034FEAE6576)

#### Conference Papers
- [Roddy, S. & Furlong, D. (2018) Vowel Formant Profiles and Image Schemata in Auditory Display. In Proceedings of HCI 2018 4-6 July 2018, Belfast](https://www.researchgate.net/publication/326572938_Vowel_Formant_Profiles_and_Image_Schemata_in_Auditory_Display)
- [Roddy, S. (2017) Composing The Good Ship Hibernia and the Hole in the Bottom of the World. In Proceedings of Audio Mostly 2017 23-26 August 2017](https://www.researchgate.net/publication/319332093_Composing_The_Good_Ship_Hibernia_and_the_Hole_in_the_Bottom_of_the_World)
- [Roddy, S., & Furlong, D. (2015). Embodied Auditory Display Affordances. In Proceedings of the 12th Sound and Music Computing Conference: National University of Ireland Maynooth (pp. 477-484)](https://www.researchgate.net/publication/280641643_Embodied_Auditory_Display_Affordances)
- [Roddy, S., & Furlong, D. (2015). Sonification Listening: An Empirical Embodied Approach. In Proceedings of The 21st International Conference on Auditory Display (ICAD 2015) July 8–10, 2015, Graz, Austria. (pp.181-187)](https://smartech.gatech.edu/bitstream/handle/1853/54125/ICAD%20Proceedings%2015-Roddy.pdf?sequence=1&isAllowed=y)
- [Roddy, S., & Furlong, D. (2013). Embodied cognition in auditory display. In Proceedings Of the 19th International Conference on Auditory Display, July 6-10 Łódź, Poland ( pp. 127-134)](https://smartech.gatech.edu/handle/1853/51657)
- [Roddy, S., & Furlong, D. (2013). Rethinking the Transmission Medium in Live Computer Music Performance. Presented at the Irish Sound Science and Technology Convocation, Dún Laoghaire Institute of Art, Design and Technology](http://issta.ie/wp-content/uploads/ISSTC-2013-RODDY.pdf)

#### Performances and installations
- [The Good Ship Hibernia @ Audio Mostly Queen Mary University London 23-26 August 2017](https://audiomostly.com/2017/)
- [The Good Ship Hibernia @ The 2017 ICAD Concert, Playhouse Theatre, Pennsylvania State University, PA, USA 20-23 June 2017](https://www.icad.org/icad2017/program-2/concert.html)
- [Doom & Gloom @ Irish sound Science & Technology Convocation, UL & MIC, Limerick, Ireland August 12-13 2015](http://issta.ie/isstc-2015/)
- [Doom & Gloom @ Sound and Music Computing Concert, NUI Maynooth, Ireland: July 30th -August 1st, 2015](https://www.maynoothuniversity.ie/smc15/concert1.html)
- [Doom & Gloom @ International Community for Auditory Display Concert, Forum Stadtpark, Graz, Austria: 8-10 July 2015](http://www.forumstadtpark.at/index.php?idcatside=999)
- [Extensive Structure no 1, The Human Cost, Doom & Gloom @ Contemporary Music Centre Spring Salon Series,  National Concert Hall, Kevin Barry Room March 24th 2015](https://www.cmc.ie/news/200315/cmcs-salon-series-returns-24-march-eclectic-programme-electro-acoustic-works)
- [Idle Hands- A 31-Part Exploration Of Irish Unemployment From 1983 - 2014 In G Major @ Irish Sound Signal and Technology Convocation @ NUI Maynooth, Ireland August 2014](http://issta.ie/isstc/isstc-2014/)
- [Symmetric Relations and Hidden Rotations @ Irish Sound Science and Technology Convocation @ Ulster University September 7th-9th 2016](http://issta.ie/isstc-2016/)
- [Symmetric Relations and Hidden Rotations @ Sonorities Festival of Contemporary Music @ Belfast November 24-26 2016](http://www.sonoritiesfestival.co.uk/images/Sonorities2016_Programme.pdf)

#### Presentations
- [Data Listening @ Discover Research Dublin 2015, Trinity College Dublin](https://discoverresearchdublin.com/)
- [Sonification and the Digital Divide @ Digital Material Conference, National University of Ireland Galway, May 21st 2015](https://irishhumanities.com/events/digital-material-conference/)

#### Press & Radio
- [Newspaper Article "Offaly man prepares for 'unique' musical performance in London". The Offaly Express, 17 August 2017.](https://www.offalyexpress.ie/news/home/265639/offaly-man-prepares-for-unique-musical-performance-in-london.html)
- [Symmetric Relations and Hidden Rotations - Nova Sunday 13 September 2015 - Nova RTÉ lyric fm](https://www.rte.ie/lyricfm/nova/programmes/2015/0913/727619-nova-sunday-13-september-2015/)


### Creative Skills
HCI Design. Interaction Design. UX Design. Sound Design. Music Composition. Data Sonification. Data Visualisation.

### Research & Technical Skills
User Evaluations. A/B Testing. Perceptual Testing. Experimental Design. Distributed User Testing. Programming. Data Analysis. Audio Engineering. Recording. Data Analysis. Data Sonification. Data Visualisation. 

### Tags
Embodied Cognition. Sonification. Auditory Display. Stephen Roddy.
