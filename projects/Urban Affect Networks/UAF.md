## Urban Affect Networks<br/>

#### Project Overview<br/>
Urban Affect Networks emerged from a broader project entitled 'Auditory Display for Large-scale IoT Networks' carried out at the CONNECT Centre Trinity College Dublin. The Urban Affect Networks project links live electronic music performance, IoT Network Data and Artificial Intelligence techniques. Each performance draws data from networks of IoT devices placed around Dublin City. Network traffic data is mapped to control parameters of the live performance. How this takes place is mediated by a rule-based AI system called PerformIOT. The mood or affective state of the AI system is determined by the state of Dublin city, as represented through the IoT sensor data. The systems mood in turn determines the musical choices it makes while improvising alongside a human performer. Each performance with the system is unique as it represents a complex array of data relations which describe the state of Dublin City and any given time. The project involved the iterative development of the system with each performance acting as an evaluation after which the system would be expanded and further refined. <br />

#### Iterative Development through Live Performance<br/>
The first iteration of 'PerformIoT' was a rule-based AI system that employed the traditional approaches that were pioneered during the era of Good Old Fashioned AI but have more recently fallen from favour in of machine learning driven approaches. The bulk of the functional code is written in Python and it is used to extend the capabilities of the Ableton Live 10 suite to leverage IoT data in live electronic music performance contexts. This early version of the PerformIoT AI system grew out of work undertaken to sonify IoT network data from a number of sources at CONNECT, the Science Foundation Ireland Research Centre for Future Networks headquartered at Trinity College Dublin. This iteration of the PerformIoT AI system retrieves data from the relevant APIs and maps it to OSC for use in a live performance setting.

#### Sonic Dreams 2017<br/>
The first use for the framework was for the piece 'Noise Loops for Laptop, Improvised Electric Guitar and Dublin City Noise Data'. This was performed at the 2017 Sonic Dreams Festival. In this piece IoT data from sensors measuring ambient noise levels around Dublin city was mapped to control performance parameters of a live electric guitar improvisation. The data was mapped to control the timbre of the guitar utilizing a multiband distortion to morph the sound. The data was also mapped to control advanced buffer, delay and filtering processing of the performance and that also controlled the synthesis of percussive elements within the performance. In this iteration the system was mapped to control live DSP process which mashed up and remixed the performance in realtime on the basis of the IoT data <br />
<br />

<img src="images/SonicDreams.jpg?raw=true"/>
* [Sonic Dreams 2017 Poster](images/SonicDreams.jpg)


<iframe seamless="" src="https://bandcamp.com/EmbeddedPlayer/album=793201642/size=large/bgcol=ffffff/linkcol=0687f5/tracklist=false/artwork=small/track=2969131966/transparent=true/" style="border: 0; height: 120px; width: 100%;"><a href="http://stephenroddy.bandcamp.com/album/home-part-2-silence-ep">Home Part 2: Silence EP by Stephen Roddy</a></iframe>

<br />
<div style="text-align: center;">
<span style="font-weight: normal;">
Dublin City Noise Loops&nbsp;</span></div>
<div style="text-align: center;">
<br /></div>

#### xCoAx 2018<br/>
The next performance with the system titled 'Signal to Noise Loops i++'' took place at xCoAx in Madrid in 2018. This performance involved a more refined version of the the AI-driven PerformIOT system which had been further developed after the SAW festival performance. The system was updated to generate music alongside the human performer. Machine listening techniques were employed whereby the system would listen to what the human performer played and then make decisions about what it wanted to play as well as whether or not it wanted to intervene in the human’s performance. I gave a talk describing how this iteration of the system worked at the conference and took part in a broader artists panel also.<br />

* [xCoAx Performance](images/xcoaxPerformance.jpg)
* [xCoAx Artist Talk](images/xcoax1.jpg)
* [xCoAx Artists Panel](images/xcoax5.jpg)

<img src="images/PosterXcoax.jpg?raw=true"/><br/>
* [xCoAx Poster](images/PosterXcoax.jpg)

#### ISSTA & CSMC 2018<br/>
A third performance with an updated system took place at ISSTA 2018 in Derry/Londonderry and incorporated genetic algorithms into the PerformIoT system. A fourth performance with a newer version of the system also took place at CSMC 2018 in Dublin. Signal to Noise Loops i++ employed liine’s Lemur app for iOS to control the synthesis of audio materials in Native Instrument’s Reaktor. Reaktor also ran patches employing a mixture of additive and subtractive synthesis techniques to generate audio materials. In this performance traffic data from IoT devices around Dublin was mapped to control synthesis, timbral and performance parameters of the piece. <br />
The current Submission <i>Urban Affect Networks</i> represents a further development of the system. The Ai-driven PerformIOT module has been updated to allow it even more control. Alongside generating its own musical material it now treats the material performed by the human player as ‘optional’. It listens to the material played by the human and decides what it likes and what it does not like, keeping and sometimes embellishing what it likes and completely re-writing what it does not like on the fly.<br />
The system makes these decision based on the ‘mood’ or ‘affective state’ of Dublin city. The AI system accesses the IoT data and reads noise levels, pollution levels, traffic flows (pedestrian and vehicle), emergency warnings and weather data. These data points define the affective state or mood of the AI. <br />
When the data represents a healthy and functioning city the AI is in a good mood and collaborates better with the human performer coordinating its music-making with that of the human. When the city is in a sub-optimal state, the AI has a negative affective state or mood and begins to overwrite the human performer and make more independent musical decisions that are reflective of the state of the city.<br />

<img src="images/csmc2018_concert_performers.jpg.webp?raw=true"/><br/>
* [CSMC2018 Concert Performance](/images/csmc2018_concert_performers.jpg.webp)

* [ISSTA 2018 Programme](/files/ISSTA programme.pdf)
* [CSMC 2018 Concert](files/Concert – CSMC2018.pdf)

<br />
<div style="text-align: center;">
<iframe seamless="" src="https://bandcamp.com/EmbeddedPlayer/album=793201642/size=large/bgcol=ffffff/linkcol=0687f5/tracklist=false/artwork=small/track=3477147735/transparent=true/" style="border: 0; height: 120px; width: 100%;"><a href="http://stephenroddy.bandcamp.com/album/home-part-2-silence-ep">Home Part 2: Silence EP by Stephen Roddy</a></iframe>Signal to Noise Loops i++ </div>
<br />
The point of mapping data to sound, and more specifically IoT data is to leverage some of the interesting patterns that present themselves across data streams/sets of this manner. Data-driven music is different from sonification where the point is to faithfully communicate or represent the data to the listener. Data-driven music is closer in many ways to algorithmic music composition than it is to sonification because of its focus on finding patterns in the data that might be interesting when mapped to sonic and musical parameters. My previous data-driven music work has employed algorithmic composition techniques and dealt with used from the global financial crash. More recently I have begun to work with IoT data as I believe that the kinds of data we choose to measure and our reasons for measuring them say a lot about what a society values, cares about and finds interesting while the specific data measurements chronicle the complex interactions between people, the technologies they create and the worlds in which those people and technologies are situated. <br />
<br />
While these explicit points of information may not be directly represented in a performance the rich interleaved patterns of interaction between people, place and technology are transposed into the sonic realm in each performance. While more abstract and implicit in nature it is the aesthetic dimensionality of these interlocked patterns, which is of interest to me. <br />
<br />
<h4>
Paper on earlier iteration of system:</h4>
<br />
<iframe frameborder="0" src="https://drive.google.com/file/d/1awK-N8_hdNML3_gH56VgX2g1jtuekjO6/preview" style="height: 500px; width: 600px;"></iframe>

<br />

### Outputs & Activities

### Performances:
- [Signal to Noise Loops 3++ @ ISSTA 2018, Derry, September 2018](http://issta.ie/call-2018/)
- [Signal to Noise Loops i2+: Noise Water Dirt @ CSMC 2018, Dublin, August 2018](https://csmc2018.wordpress.com/)
- [Signal to Noise Loops i++ Live @ xCoAx 2018, Madrid](https://2018.xcoax.org/#perf04)
- [Noise Loops for Laptop, Improvised Electric Guitar and Dublin City Noise Level Data @ Sonic Dreams 2017, Sonic Arts Waterford, September 30th 2017](https://1.bp.blogspot.com/-HhZc6oL93Og/W0yMNH4jnVI/AAAAAAAAGFE/VlxW3bOMTlono3rkqbBMtE4XAxElOOgAQCLcBGAs/s1600/Sonic-Dreams-Festival-2017-final-poster-2.jpg)

### Recordings
Link to Performances with earlier iterations of the System:</h4>
Dublin City Noise Loops<br />
<a href="https://open.spotify.com/track/63x9Nav3h61MNbcV6uycCX">https://open.spotify.com/track/63x9Nav3h61MNbcV6uycCX</a><br />
<a href="https://music.apple.com/us/album/dublin-city-noise-loops/1450892433?i=1450892435">https://music.apple.com/us/album/dublin-city-noise-loops/1450892433?i=1450892435</a><br />
<a href="https://stephenroddy.bandcamp.com/track/dublin-city-noise-loops">https://stephenroddy.bandcamp.com/track/dublin-city-noise-loops</a><br />
<br />
Signal to Noise Loops i++<br />
<a href="https://open.spotify.com/track/5B4bh4fpgR9mFqv3OgKDRs">https://open.spotify.com/track/5B4bh4fpgR9mFqv3OgKDRs</a><br />
<a href="https://music.apple.com/us/album/signal-to-noise-loops-i/1450892433?i=1450892434">https://music.apple.com/us/album/signal-to-noise-loops-i/1450892433?i=1450892434</a><br />
<a href="https://stephenroddy.bandcamp.com/track/signal-to-noise-loops-i">https://stephenroddy.bandcamp.com/track/signal-to-noise-loops-i</a><br />
<br />

### Creative Skills
Sound Design. Music Composition. Live Electronic Music performance. Instrumental Guitar Performance.  Audio Sound Art. Visual Design.

### Technical
IoT Networks. Statistical Data Analytic. Python. HTTP, OSC & MIDI protocols. GOFAI. Evolutionary Computing. Audio DSP. Creative Coding. HTTP. HCI. Auditory Display & Sonification. Audio Engineering.

### Tags
Urban Affect Networks. Music. Data. GOFAI.
