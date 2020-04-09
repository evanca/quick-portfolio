## Embodied Sonification

### Project Overview
Sonification is the representation of data with sound and Auditory Display is the use of audio to present information to a listener. In certain contexts and for certain types of data sound can be an effective means of representation and communication. This project involved the development of Sonification and Auditory Display systems based on human-centered design principles derived from embodied cognition an area of cognitive science that is critical to our understanding of meaning-making in cognition. The research and development portions of the project were carried out in fulfillment of a PhD degree at the Department of Electronic and Electrical Engineering in Trinity College Dublin under the supervision of Dr. Dermot Furlong. Throughout the project music composition and sound design practices informed by the embodied cognition literature were employed as exploratory research methods. This helped to identify exciting new possibilities for mapping data to sound. These possibilities were then empirically tested to confirm their efficacy for sonification tasks. A number of data-driven musical works were created as a byproduct of the research process.

### Coding & Technology
The majority of the project was coded in Csound a programming language for audio written in C. Many of the stimuli used experiments and evaluations were also produced in Csound. Additional sounds and stimuli were produced in Native Instruments Reaktor 5 and production work was carried out int the Logic Pro X DAW. Rapid prototyping platforms were developed in Csound and used to prototype new ideas in an efficient manner. The two prototyping platforms below were developed using fof (fonction d'onde formantique') synthesis methods and generate simulated vocal gestures.

[Prototyping Platform 1](code/Prototyping_Model1_Vocal_Gesture2015) | [Prototyping Platform 2](code/Prototyping_Model2_Vocal_Gestures2015)

<img src="images/CsoundCode.png?raw=true"/>

### Data to Sound
The project involved the development of new techniques and systems for mapping a range of data types to sound in order to represent changes in the original data set.
Physical and spatial datatypes like temperature, distance, height, weight, speed, amount, texture, etc. were used in the project.
Weather data was also used. As the project progressed the focus fell increasingly on socio-economic data

The first phases of the project dealt with the concept of 'polarity'. This asks what counts as an increase and what counts as a decrease when mapping data to sound. The pitch and tempo of pure sine tones from 'numerical data', data that is a count of some specific thing like population, chemical concentration, RPM, etc., and attribute data, data that describes some attribute of a thing like size, depth, mass, etc.

Pure Sine Tone Examples:
[Increasing Frequency](audio/Ch2/Experiment C Pitch.mp3) | [Decreasing Frequency](audio/Ch2/Experiment B Pitch.mp3) | [Increasing Tempo](audio/Ch2/Experiment C rhythm.mp3) | [Decreasing Tempo](audio/Ch2/Experiment B rhythm.mp3)

The second phase explored the kinds of data that can be best represented with simulated vocal gestures. This phase made use of the vocal gesture prototyping platforms

Effective Vocal Gesture Examples:
[Texture](audio/Ch3/Rough Smooth.mp3) | [Amount](audio/Ch3/Amount.mp3) | [Speed](projects/embodied_sonification/audio/Ch3/Speed.mp3) | [Size](audio/Ch3/Size.mp3) [Spatial Extent](audio/Ch3/Spatial.mp3) | [Tension](audio/Ch3/Vowel Tension.mp3) | [Anger](audio/Ch3/Anger.mp3)

The third phase examined how soundscapes can be used to represent data. Initial soundscape elements were synthesised and mapped to data using prototyping platforms in Csound but this approach was abandoned in favour of soundscape recordings that could be manipulated and mapped to data. This section explored how the concepts of conceptual metaphor and blending can be applied to design better soundscape sonifications.

Soundscape Sonification:
[Sonification of Irish GDP from 1979 to 2013](audio/Ch4/Sonification.mp3) | [Emigration Low](audio/Ch4/Emigration Place Lo.mp3) | [Emigration High](audio/Ch4/Emigration Place Hi.mp3) | [Poverty Low](audio/Ch4/Poverty Meta Lo.mp3) | [Poverty High](audio/Ch4/Poverty Meta Hi.mp3)

The final phase explored how doppler shifting can be used to add a sense of temporal context to a sonification:

Temporospatial Motion Framework:
[Original Framework](audio/Ch5/Example of Original Framework.mp3) | [Refined Framework](audio/Ch5/Example of Refined Framework .mp3)

### Research Methods
The project applied empirical research methods and involved many rounds of evaluation collecting and analysing both quantitative and qualitative data. It involved both user-centric HCI methods (e.g. user evaluations, A/B testing, surveys etc.) and more traditional psychological experiments designed to gauge users judgements of stimuli. Some pilot testing was done in with small in person groups but the majority of the testing was carried out online in order to sample from a large international group of users.

### Findings
Overall the project found that designing sonifications on the basis of principles from the field of embodied cognition generally leads to more effective solutions. The project resulted in the Embodied Sonification Listening Model, which reconciles embodied cognition principles with the task of "sonification listening": listening to a sound in order to extract information about the dataset it represents. For a more detailed description of findings see the finished document.

<img src="images/page2.png?raw=true"/>

### Research Outputs
This project resulted in a number of conference presentations.

[Roddy,  S., & Furlong, D. (2015). Embodied Auditory Display Affordances. In  Proceedings of the 12th Sound and Music Computing Conference: National  University of Ireland Maynooth (pp. 477-484).](papers/EmbodiedAffordancesinAuditoryDisplayRoddyFurlong.pdf)

[Roddy,  S., & Furlong, D. (2015). Sonification Listening: An Empirical  Embodied Approach. In Proceedings of The 21st International Conference on Auditory Display (ICAD 2015) July 8–10, 2015, Graz, Austria.  (pp.181-187).](papers/SonificationListeningAnempiricalEmbodiedApproachRoddyandFurlong2015.pdf)

[Roddy,  S., & Furlong, D. (2013). Embodied cognition in auditory display.  In Proceedings Of the 19th International Conference on Auditory Display,  July 6-10 Łódź, Poland ( pp. 127-134).](papers/SonificationListeningAnempiricalEmbodiedApproachRoddyandFurlong2015.pdf)

[Roddy,  S., & Furlong, D. (2013). Rethinking the Transmission Medium in  Live Computer Music Performance. Presented at the Irish Sound Science and Technology Convocation, Dún Laoghaire Institute of Art, Design and Technology.](papers/ISSTC2013RODDY.pdf)

It also resulted in a number of journal articles including an article in [Organised Sound](papers/Organised Sound - Embodied Aesthetics in Auditory Display.pdf)


### Creative Technology and Multimedia Outputs
Data-driven music composition and sound design techniques were used to aid in the design of sonification mapping strategies. These approaches allowed me to find novel and interesting sonic parameters for mapping data.  This practice resulted in the production of a number of data-driven sound works in the course of the research project.

These have been gathered into a collection entitled 'The Human Cost', named for the socioeconomic data from the 2008 financial crash represented in the pieces and are available ffrom the usual streaming services online:

[Spotify](https://open.spotify.com/artist/6FZOlLhsey17jwrTGBV07c) | [Apple Music](https://music.apple.com/ie/album/the-human-cost/1278676607)

<iframe style="border: 0; width: 350px; height: 470px;" src="https://bandcamp.com/EmbeddedPlayer/album=2888609678/size=large/bgcol=ffffff/linkcol=0687f5/tracklist=false/transparent=true/" seamless><a href="http://stephenroddy.bandcamp.com/album/the-human-cost-sonification-and-irelands-economic-crash">The Human Cost: Sonification and Ireland&#39;s Economic Crash by Stephen Roddy</a></iframe>


A number of these pieces have been performed live at academic conferences and cultural events at national and international levels including:

[The Irish Sound Science and Technology Convocation 2014](https://s3images.coroflot.com/user_files/individual_files/711451_7SZ94dIf0s3EopLGzawCUcKWt.pdf).

[The CMC's 2015 Salon Series in the National Concert Hall Dublin](https://www.cmc.ie/content/contemporary-music-centres-salon-series-opens-eclectic-electro-acoustic-program).

[The International Conference on Auditory Display Concert 2015](https://iem.kug.ac.at/icad15/icad15/schedule/concerts-installations.html).

[The Sound and Music Computing Conference 2015](https://www.maynoothuniversity.ie/smc15/concert1.html).

[The Irish Sound Science and Technology Conference 2015](https://1.bp.blogspot.com/-ijiHIylZ-i0/XoyVxt_f-sI/AAAAAAAAGis/l86mwHCqqyUxJk-1xY-ISM3EwFUyJ3yMACLcBGAsYHQ/s1600/Issta2015%2Bcopy.jpg).

[The International Conference on Auditory Display 2017](https://www.icad.org/icad2017/program-2/concert.html).
[Audio Mostly 2017](https://audiomostly.com/2017/program/music-program/).

<img src="images/Issta2015 copy.jpg?raw=true"/>


### Embodied Sonification PhD Thesis
<iframe height="842" src="https://drive.google.com/file/d/0BwMBM58DHm2balNPRERtbEJYNHM/preview" width="592"></iframe><br/>

[Digital Appendices](https://www.dropbox.com/sh/byilxk53kzkdr8b/AADpZQZO3iv0hRL7rU72Pk-ha?dl=0)<br/>
[Link to thesis in Trinity College Dublin Repository](http://www.tara.tcd.ie/handle/2262/80506)<br/>


### Press
[CMC Salon Series Press Release](https://www.cmc.ie/content/contemporary-music-centres-salon-series-opens-eclectic-electro-acoustic-program)<br/>
[The Offaly Express](https://www.offalyexpress.ie/news/home/265639/offaly-man-prepares-for-unique-musical-performance-in-london.html)<br/>
[Glór Mundo 29th September 2017](https://www.facebook.com/GlorMundO/posts/868313836667030)<br/>
[Glór Mundo 27th September 2017](https://www.facebook.com/glormundo/posts/868313836667030)<br/>


### Creative Skills
HCI Design. Interaction Design. UX Design. Sound Design. Music Composition. Data Sonification. Data Visualisation.

### Technical & Research Skills
Programming. Data Analysis. Audio Engineering. Recording. Data Analysis. Data Sonification. Data Visualisation. User Evaluations. A/B Testing. Experimental Design. Distributed User Testing.

### Tags
Embodied Cognition. Sonification. Auditory Display. Stephen Roddy.
