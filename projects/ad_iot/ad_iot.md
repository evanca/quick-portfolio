### Project description.

Auditory Display for Large Scale IoT Networks was a Postdoctoral project I undertook at CONNECT, the Science Foundation Ireland Research Centre for Future Networks headquartered at Trinity College Dublin. The project was funded by an Irish Research Council Government of Ireland Postdoctoral Research Fellowship.

### Research Process.

This project was driven by the overarching research question: Can auditory display solutions present complex information in an intuitive manner in the context of IoT network monitoring tasks?. To answer this I began by talking to users who work with IoT networks, experts in the fields of IoT and Auditory Display and I also consulted the academic literature more generally.I broke the research question into smaller pieces: How can we best represent complex IoT data with sound? How useful can sound be for understanding data of this nature? What sounds should be used for different IoT data types and in what contexts? etc.
I used theoretical frameworks from the field of Embodied Cognitive Science that apply to meaning-making and music cognition to ground the work in a meaningful context and I applied standard HCI methodologies to answer these questions posed above. This involved an iterative development process in which I would create a prototype solution based on the Embodied Cognition literature, evaluate the efficacy of the solution with users and then repeatedly iterate upon the design of the prototype taking the results of each successive evaluation into account.

<img src="images/PN_Son_Data Handling.png?raw=true"/><br/>

### Phase 1: Individual Network Specific Data Types.

Phase 1 of the project involved working with data from the Pervasive Nation a Low Powered Wide Area Network (LPWAN) infrastructure operated as an Internet of Things testbed by CONNECT, in Trinity College Dublin.

This phase involved the development of mapping strategies for representing network specific datatypes with sound. Beginning from principles in the field of embodied cognitive science and utilising user testing methods, I identified sets of useful mapping strategies for representing IoT data in different use contexts and task scenarios.

During Phase 1 I wrote code was in Python to retrieve network data from the server with http requests, analysed and structured using pandas and then translated to the Open Sound Control (OSC) protocol using OSC.py. At this point it was ready to be sent to a synthesiser and mapped to sound parameters.
A wide range of scripts were written in Csound to represent different network behaviours and map specific datatypes to sound. Patches for mapping the data to sound were also developed in Reaktor 5.

<img src="images/PNSON Prototype.png?raw=true"/><br/>

The following examples all represent messages with bad MIC's (message integrity codes) sent across the network in the 24 hour period between 6pm on Mar 9th and 6pm Mar 10th 2016. In example 3 the bell marks the passage of time

[Bad MIC 1](/audio/PN Sonifications/1.mp3)
[Bad MIC 2](/audio/PN Sonifications/2.mp3)
[Bad MIC 3](/audio/PN Sonifications/3.mp3)

The next examples show the use of different datasets with the same synthesis techniques. The first represents the RSSI strength of active network devices from March 10th to March 11th and the second represents the number of UL messages (uploads) during that timeframe.

[RSSI Strength](/audio/PN Sonifications/RSSI.mp3)
[UL Messages](/audio/PN Sonifications/UL.mp3)


### Phase 2: Full Networks, Multiple Data Streams.

I then shifted focus to the creation of auditory displays comprised of multiple streams of IoT network data. Mapping strategies that work well in isolation do not necessarily work well in unison. I developed new mapping strategies for representing multiple streams of IoT data. this also required the development of new methods for acquiring, cleaning organising and mapping  multiple data streams to OSC and MIDI in Python.

These sonifications represent an aggregate of 3 data types (device, gate and upload messages) sent across the network from 10th to 15th of July 2016. The increase in activity on the network is clearly apparent. The oscillating pitch tone represents the passage of times with one full trough-peak-trough cycle equal to 24hrs. The other sounds are mapped to the represent activity on the network:

[Sonification 1](/audio/PN Sonifications/A/PN1 Sonification_10-15.7.16_1d.m4a)
[Sonification 2](/audio/PN Sonifications/B/PN2 Sonification_10-15.7.16_1c.m4a)

The following sonification represents the same data (device gateway and upload messages) from Jun 22nd to July 15th 2016. The data to sound mapping strategy is much richer than the previous examples.

[Sonification 3](/audio/pn_son/Historical Son.mp3)


[example from date range 2]
[example from date range 3]

The end result of this phase was an auditory display system for representing multiple streams of network data at once. It represented both aggregates of network data  and continuous streams of data. Users could interact with the system via GUI to focus on specific streams of data and attenutate others.

<img src="images/Network_GUI.png?raw=true"/><br/>

[Network Sonification Example 4](/audio/Son 3.mp3)


### Phase 3: Refine the Data to Sound Mapping Strategies and Development of Design Principles.

The third phase of the project involved the refinement of the mapping strategies developed in the first two phases and the extension of the approach to represent even more data. Approaches that worked were further developed and expanded upon while those that didn't were discarded. This phase resulted in the creation of a new system for sonifying IoT Network data and the creation of a number of design guidelines for future systems. The design guidelines and auditory display system are presented in the Journal of Sonic Studies.

[Example of Strong RSSI](/audio/fullsystem/Mp3s/RSSI Strong.mp3)
[Example of High Signal to Noise Ratio](/audio/fullsystem/Mp3s/SNR Hi.mp3)
[Example of Gateway Reboot](/audio/fullsystem/Mp3s/GWReboot.mp3)

[Sonification of Healthy Network Activity](/audio/fullsystem/Mp3s/Good Network.mp3)
[Sonification of Standard Network Activity](/audio/fullsystem/Mp3s/Standard Network.mp3)
[Sonification of Unhealthy Network Activity](/audio/fullsystem/Mp3s/Bad Network.mp3)

[Link to JSS Paper](https://www.researchcatalogue.net/view/515156/515157)

### Phase 4: Market Data, Smart Cities, Evolutionary Computing & Machine Learning Techniques.

Having finalised the design of a system for representing IoT Network Traffic Data and put forward a set of guidelines for developing systems of this type, phase four of the project shifted focus again to consider a broader range of data sources. In the original funding application this phase of the project was intended to explore more creative/artistic applications of auditory display.
During phase 4 I focused on writing functional code that could to be easily deployed to the web. The two systems designed during this phase are designed to run client-side with the standard HTML/Javascript/CSS stack and sound is synthesised using the tone.js library. In introduced Machine Learning (MuiscVAE, a javascript based variational autoencoder implementation created for musical data by the Google Magenta team) and Evolutionary Computing techniques (mostly genetic algorithms) to aid in the process of mapping data to sound. First, I created an ambient auditory display solution for monitoring financial markets. The data was from the from highly volatile 2018 cryptocurrency markets. It represented the live dollar values of different cryptocurrencies, retrieved via the Coinbase Pro API (originally GDAX). I created multiple mapping strategies for this data, some to generative musical pieces that would represent the overall state of the data in a more stimulating and creative manner and others to more straightforward sound parameters similar to auditory graphs. The system makes use Evolutionary Computing and Machine Learning techniques. It was presented at the 2018 conference on the Computer Simulation of Musical Creativity.


<iframe height="842" src="https://stephenroddy.github.io/projects/ad_iot/papers/Roddy.pdf" width="592"></iframe><br/>
[Link to CSMC Paper](/papers/Roddy.pdf)


This system works around the idea of target states. Target states of interest in the market data are associated with unique musical structures. As the data tends towards these target states the audio tends towards the musical motif. This way the listener can gauge how close the market is to the target state by listening to how much the musical motif differ from the target state pattern.

This is implemented at the generative level using Genetic Algorithms (GA):

[GA Original State](/audio/mp3s and m4as/GEN_Original.mp3)
[GA Target State](/audio/mp3s and m4as/GEN_Target.mp3)
[GA Blended State](/audio/mp3s and m4as/GEN_Blended.mp3)

and Variational Autoencoders (VAE):

[VAE Original State](/audio/mp3s and m4as/ML_Original.mp3)
[VAE Target State](/audio/mp3s and m4as/ML_Target.mp3)
[VAE Blended State](/audio/mp3s and m4as/ML_Blended.mp3)

It is implemented at the sound synthesis level by defining target timbral qualities for each audio stream.
This results in a scales of timbral changes that can be used to represent the data, in relation to the target states described above.

[Scale 1](/audio/mp3s and m4as/NoteConvergence_scale.m4a)
[Scale 2](/audio/mp3s and m4as/NotetoNoise_scale.m4a)
[Scale 2](/audio/mp3s and m4as/SynthWash.m4a)

Bringing these steams together results in musical systems which are representative of the difference between target data states defined by a user, and the current state of the market:

[Example Sonification](/audio/mp3s and m4as/LiveSystem.mp3)

This final phase of the project also involved the development of a system for Smart Cities data. Rather than dealing with data at the level of the network, this phase investigated the use of sensor level data. The system uses traffic data from open APIs around Dublin including Noise level data (Sonitus Systems API), number of public bikes available at stands and number of Free Parking Spaces in multi-storey car parks (Dublin City Council API), Travel Times on key routes around the city (Transport Infrastructure Ireland).
It also uses weather data from the OpenWeather Maps API including rainfall, windspeed and temperature levels. Theoretical frameworks from Embodied Cognitive Science and music theory were once again used to guide the initial design of the system. The system is comprised of the same four component layers involved in the previous system and represented in the figure above. The output consists of three data-driven sound objects presented in sequence. The first object represents weather data the second represents traffic data and the third represents the number of available bikes at city bike stands. When attended to in sequence, the sonification is intended to give an overall sense of the state of the city in terms of these three categories.

<img src="images/Model2.png?raw=true"/><br/>

A number of strategies to mapping data to sound were adopted here.
Traditional approaches to mapping data to sound (parameter mapping sonification) were employed alongside approaches that involve machine learning techniques. For example in the generative engine the highest point in the dataset is represented with a unique musical pattern and the lowest point is represented with another. By blending these motifs together using MusicVAE new musical patterns are generated to represent values between these two points. Essentially, the high point of the data is represented with one musical motif and the low point with another one. All data points in between are then represented as blends of these two motifs.
This is a refinement of the target states approach I used for the previous system.

[Rain motif](/audio/smart_city/MotifLevel/rainMotif.mp3)
[Shine motif](/audio/smart_city/MotifLevel/shineMotif.mp3)

[Rain to Shine Blend](/audio/smart_city/MotifLevel/RainShineMotif.m4a)

In the sound synthesis engine, data can be mapped directly a wide range of sound synthesis parameters. For example The bike sound object is created using a pink noise generator and a delay.

<img src="images/BikeDone.tif?raw=true"/><br/>

[High number of Bikes](/audio/smart_city/Bikes/bikesHi.mp3)
[Low number of Bikes](/audio/smart_city/Bikes/bikesLow.mp3)

Data can also be mapped in more complex ways to change the timbre of the musical patterns playing at multiple layers. At the synthesis layer temperature data is mapped to control the harmonicity of the Duo Synth instrument that synthesises the motif patterns. At the FX layer it is mapped control the intensity of a chorusing effect.

[High Temperature](/audio/smart_city/Temperature/tempHi.mp3)
[Low Temperature](/audio/smart_city/Temperature/tempLow.mp3)


### Creative Skills
HCI Design. Interaction Design. UX Design. Sound Design. Music Composition. Data Sonification. Data Visualisation.

### Technical & Research Skills
Programming. Data Analysis. Audio Engineering. Recording. Data Analysis. Data Sonification. Data Visualisation. User Evaluations. A/B Testing. Experimental Design. Distributed User Testing.

### Tags
Embodied Cognition. Sonification. Auditory Display. Stephen Roddy.



Resources:

SON work
Historical SON
PN_SON
International Dub  Pres Son

References to speaking engagement outputs.
