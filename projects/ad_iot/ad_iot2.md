## Auditory Display for Large-scale Internet of Things (IoT) Networks.

### Project at a Glance

Auditory Display for Large Scale IoT Networks was a Postdoctoral project I undertook at CONNECT, the Science Foundation Ireland Research Centre for Future Networks headquartered at Trinity College Dublin. The project was funded by an Irish Research Council Government of Ireland Postdoctoral Research Fellowship.


### Design Goal:
Overarching question: Can auditory display solutions present complex information in an intuitive manner in the context of IoT network monitoring tasks?

### Research Questions:
1. How can we best represent complex IoT data with sound?
2. How useful can sound be for understanding data of this nature?
3. What sounds should be used for different IoT data types and in what contexts?

### Research Methodology
After an initial literature review I used stakeholder interviews and surveys to generate both qualitative and quantitative data describing user needs. This was supplemented with further insights from interviews with external experts before beginning rapid prototyping and employing evaluative research techniques to drive an iterative design process.

<img src="images/Gantt.png?raw=true"/><br/>

### Results: Key Insights
- A. System should present an overview of the systems 'health'.
- B. Should be intuitive and unobtrusive.
- C. Use a mixture of sound and music.
- D. Be heavily automated.

### Results: Design Impact
A: System should present an overview of the systems 'health'.
- A1. Later prototypes allow users to highlight problem areas in the network quickly. Visual graphs can be used  to examine details later.

- A2. Early prototypes prototype was very detailed and hard to interpret.

B: Should be intuitive and unobtrusive.
- B1. Later prototypes designed for passive listening with intuitive design principles.
- B2. Early prototypes designed for active listening and require greater user training.

C: Use a mixture of sound and music.
- C1. Later prototypes integrate both musical and non-musical sounds.
- C2. Early prototypes were purely non-musical.

D: Be heavily automated.
- D1. Final prototypes integrated automation and used machine-learning principles.
- D2. Early prototypes required more user attention and interaction.


### Detailed Overview
#### Research Process.

This project was driven by the overarching research question: Can auditory display solutions present complex information in an intuitive manner in the context of IoT network monitoring tasks?. To answer this I began by talking to users who work with IoT networks, experts in the fields of IoT and Auditory Display and I also consulted the academic literature more generally.I broke the research question into smaller pieces: How can we best represent complex IoT data with sound? How useful can sound be for understanding data of this nature? What sounds should be used for different IoT data types and in what contexts? etc.
I used theoretical frameworks from the field of Embodied Cognitive Science that apply to meaning-making and music cognition to ground the work in a meaningful context and I applied standard HCI methodologies to answer these questions posed above. This involved an iterative development process in which I would create a prototype solution based on the Embodied Cognition literature, evaluate the efficacy of the solution with users and then repeatedly iterate upon the design of the prototype taking the results of each successive evaluation into account.

<img src="images/PN_Son_Data Handling.png?raw=true"/><br/>

#### Phase 1: Individual Network Specific Data Types.

Phase 1 of the project involved working with data from the Pervasive Nation a Low Powered Wide Area Network (LPWAN) infrastructure operated as an Internet of Things testbed by CONNECT, in Trinity College Dublin.

This phase involved the development of mapping strategies for representing network specific datatypes with sound. Beginning from principles in the field of embodied cognitive science and utilising user testing methods, I identified sets of useful mapping strategies for representing IoT data in different use contexts and task scenarios.

During Phase 1 I wrote code was in Python to retrieve network data from the server with http requests, analysed and structured using pandas and then translated to the Open Sound Control (OSC) protocol using OSC.py. At this point it was ready to be sent to a synthesiser and mapped to sound parameters.
A wide range of scripts were written in Csound to represent different network behaviours and map specific datatypes to sound. Patches for mapping the data to sound were also developed in Reaktor 5.

<img src="images/PNSON Prototype.png?raw=true"/><br/>

The following examples all represent messages with bad MIC's (message integrity codes) sent across the network in the 24 hour period between 6pm on Mar 9th and 6pm Mar 10th 2016. In example 3 the bell marks the passage of time

- [Bad MIC 1](/audio/PN Sonifications/1.mp3)
- [Bad MIC 2](/audio/PN Sonifications/2.mp3)
- [Bad MIC 3](/audio/PN Sonifications/3.mp3)

The next examples show the use of different datasets with the same synthesis techniques. The first represents the RSSI strength of active network devices from March 10th to March 11th and the second represents the number of UL messages (uploads) during that timeframe.

- [RSSI Strength](/audio/PN Sonifications/RSSI.mp3)
- [UL Messages](/audio/PN Sonifications/UL.mp3)


#### Phase 2: Full Networks, Multiple Data Streams.

I then shifted focus to the creation of auditory displays comprised of multiple streams of IoT network data. Mapping strategies that work well in isolation do not necessarily work well in unison. I developed new mapping strategies for representing multiple streams of IoT data. this also required the development of new methods for acquiring, cleaning organising and mapping  multiple data streams to OSC and MIDI in Python.

These sonifications represent an aggregate of 3 data types (device, gate and upload messages) sent across the network from 10th to 15th of July 2016. The increase in activity on the network is clearly apparent. The oscillating pitch tone represents the passage of times with one full trough-peak-trough cycle equal to 24hrs. The other sounds are mapped to the represent activity on the network:

- [Sonification 1](/audio/PN Sonifications/A/PN1 Sonification_10-15.7.16_1d.m4a)
- [Sonification 2](/audio/PN Sonifications/B/PN2 Sonification_10-15.7.16_1c.m4a)

The following sonification represents the same data (device gateway and upload messages) from Jun 22nd to July 15th 2016. The data to sound mapping strategy is much richer than the previous examples.

- [Sonification 3](/audio/pn_son/Historical Son.mp3)

The end result of this phase was an auditory display framework for representing multiple streams of network data at once. It represented both aggregates of network data  and continuous streams of data. Users could interact with the system via GUI to focus on specific streams of data and attenuate others.

<img src="images/Network_GUI.png?raw=true"/><br/>

- [Network Sonification Example 4](/audio/Son 3.mp3)


#### Phase 3: Refine the Data to Sound Mapping Strategies and Development of Design Principles.

The third phase of the project involved the refinement of the mapping strategies developed in the first two phases and the extension of the approach to represent even more data. Approaches that worked were further developed and expanded upon while those that didn't were discarded. This phase resulted in the creation of a new framework for sonifying IoT Network data and the creation of a number of design guidelines for future framework. The design guidelines and auditory display framework are presented in the Journal of Sonic Studies.

- [Example of Strong RSSI](/audio/framework/Mp3s/RSSI Strong.mp3)
- [Example of High Signal to Noise Ratio](/audio/framework/Mp3s/SNR Hi.mp3)
- [Example of Gateway Reboot](/audio/framework/Mp3s/GWReboot.mp3)

- [Sonification of Healthy Network Activity](/audio/framework/Mp3s/Good Network.mp3)
- [Sonification of Standard Network Activity](/audio/framework/Mp3s/Standard Network.mp3)
- [Sonification of Unhealthy Network Activity](/audio/framework/Mp3s/Bad Network.mp3)

- [Link to JSS Paper](https://www.researchcatalogue.net/view/515156/515157)

#### Phase 4: Market Data, Smart Cities, Evolutionary Computing & Machine Learning Techniques.

Having finalised the design of a framework for representing IoT Network Traffic Data and put forward a set of guidelines for developing frameworks of this type, phase four of the project shifted focus again to consider a broader range of data sources. In the original funding application this phase of the project was intended to explore more creative/artistic applications of auditory display.
During phase 4 I focused on writing functional code that could to be easily deployed to the web. The two frameworks designed during this phase are designed to run client-side with the standard HTML/Javascript/CSS stack and sound is synthesised using the tone.js library. In introduced Machine Learning (MuiscVAE, a javascript based variational autoencoder implementation created for musical data by the Google Magenta team) and Evolutionary Computing techniques (mostly genetic algorithms) to aid in the process of mapping data to sound. First, I created an ambient auditory display solution for monitoring financial markets. The data was from the from highly volatile 2018 cryptocurrency markets. It represented the live dollar values of different cryptocurrencies, retrieved via the Coinbase Pro API (originally GDAX). I created multiple mapping strategies for this data, some to generative musical pieces that would represent the overall state of the data in a more stimulating and creative manner and others to more straightforward sound parameters similar to auditory graphs. The framework makes use Evolutionary Computing and Machine Learning techniques. It was presented at the 2018 conference on the Computer Simulation of Musical Creativity.


<iframe frameborder="0"  src="https://drive.google.com/file/d/1oPZuZ2_x340rgC9gYP1iBps0DFnUYmDn/preview" style="height: 500px; width: 600px;"></iframe>
<br/>
- [Link to CSMC Paper](/papers/Roddy.pdf)

This framework works around the idea of target states. Target states of interest in the market data are associated with unique musical structures. As the data tends towards these target states the audio tends towards the musical motif. This way the listener can gauge how close the market is to the target state by listening to how much the musical motif differ from the target state pattern.

This is implemented at the generative level using Genetic Algorithms (GA):

- [GA Original State](/audio/mp3s and m4as/GEN_Original.mp3)
- [GA Target State](/audio/mp3s and m4as/GEN_Target.mp3)
- [GA Blended State](/audio/mp3s and m4as/GEN_Blended.mp3)

and Variational Autoencoders (VAE):

- [VAE Original State](/audio/mp3s and m4as/ML_Original.mp3)
- [VAE Target State](/audio/mp3s and m4as/ML_Target.mp3)
- [VAE Blended State](/audio/mp3s and m4as/ML_Blended.mp3)

It is implemented at the sound synthesis level by defining target timbral qualities for each audio stream.
This results in a scales of timbral changes that can be used to represent the data, in relation to the target states described above.

- [Scale 1](/audio/mp3s and m4as/NoteConvergence_scale.m4a)
- [Scale 2](/audio/mp3s and m4as/NotetoNoise_scale.m4a)
- [Scale 3](/audio/mp3s and m4as/SynthWash_scale.m4a)

Bringing these steams together results in musical systems which are representative of the difference between target data states defined by a user, and the current state of the market:

- [Example Sonification](/audio/mp3s and m4as/LiveSystem.mp3)

#### Smart Cities Data

This final phase of the project also involved the development of a framework for Smart Cities data. Rather than dealing with data at the level of the network, this phase investigated the use of sensor level data. The framework uses traffic data from open APIs around Dublin including Noise level data (Sonitus Systems API), number of public bikes available at stands and number of Free Parking Spaces in multi-storey car parks (Dublin City Council API), Travel Times on key routes around the city (Transport Infrastructure Ireland).
It also uses weather data from the OpenWeather Maps API including rainfall, windspeed and temperature levels. Theoretical frameworks from Embodied Cognitive Science and music theory were once again used to guide the initial design of the framework. The framework is comprised of the same four component layers involved in the previous framework and represented in the figure above. The output consists of three data-driven sound objects presented in sequence. The first object represents weather data the second represents traffic data and the third represents the number of available bikes at city bike stands. When attended to in sequence, the sonification is intended to give an overall sense of the state of the city in terms of these three categories.

<img src="images/Model_3_Smart_City.png?raw=true"/><br/>

A number of strategies to mapping data to sound were adopted here.
Traditional approaches to mapping data to sound (parameter mapping sonification) were employed alongside approaches that involve machine learning techniques. For example in the generative engine the highest point in the dataset is represented with a unique musical pattern and the lowest point is represented with another. By blending these motifs together using MusicVAE new musical patterns are generated to represent values between these two points. Essentially, the high point of the data is represented with one musical motif and the low point with another one. All data points in between are then represented as blends of these two motifs. This is a refinement of the target states approach I used for the previous framework.


Data is mapped across the generative, sound synthesis and post-processing layers for each data object.

#### Weather Data Object:

Data | Sound | Layer
---- | ----- | -----
Rainfall | Motif Blending | Generative
Degree Temperature | Harmonicity Ratio | Sound Synthesis
Degree Temperature | Chorusing | Post-processing
Windspeed | Panner Freq & Filter Freq | Post-processing

Synthesis Method: Two Sine wave Generators w/amplitude envelopes + one filter & filter envelope each.

Rainfall data is mapped to control the blending of the Rain motif into the Shine motif. With higher rainfall values the musical pattern sound closer to the Rain motif with lower values it sounds closer to the Shine motif. The motif is synthesised using two monophonic synths

- [Rain motif](/audio/smart_city/MotifLevel/rainMotif.mp3)
- [Shine motif](/audio/smart_city/MotifLevel/shineMotif.mp3)

In the following example the rain motif transforms into the shine motif.

- [Rain to Shine Blend](/audio/smart_city/MotifLevel/RainShineMotif.m4a)

At the sound synthesis level Temperature data is mapped to control the harmonicity ratio between two monophonic synthesisers and at the post processing level it is mapped to control a chorusing effect.

- [High Temperature](/audio/smart_city/Temperature/tempHi.m4a)
- [Low Temperature](/audio/smart_city/Temperature/tempLo.m4a)

Windspeed is mapped to control the cycle frequency of an automatic filter at the FX layer.

- [High WindSpeed](/audio/smart_city/Windspeed/HiWInd.m4a)

#### Traffic Data Object:

Data | Sound | Layer
---- | ----- | -----
Traffic Times | Motif Blending | Generative
Noise Data | Distortion | Post-processing
Noise Data | Reverb | Post-processing
Parking Spaces | Low Pass Filter | Post-processing

Synthesis Method: AM Synthesis.

Average travel time data for the motorways feeding Dublin is mapped to control the blend between the low traffic motif and the high traffic motif in the generative engine.
Noise level data is mapped to control the addition fo distortion and reverb to the signal. The number of free carpark spaces in the city is mapped to control the cutoff frequencey of a lowpass filter.

- [Low Traffic & High Noise](/audio/smart_city/Traffic/NoiseTrafLo.mp3)
- [High Traffic & High Noise](/audio/smart_city/Traffic/NoiseHi.mp3)

- [High Noise & Few Parking Spaces](/audio/smart_city/Traffic/FewSpacesMuchNoise.m4a)
- [No Noise & Few Parking Spaces](/audio/smart_city/Traffic/fewSpacesNoNoise.m4a)

In the following example the high traffic motif transforms into the low traffic motif:

- [High Traffic to Low Traffic](/audio/smart_city/Traffic/fullTraffic20.m4a)


#### Bike Data Object:
<img src="images/BikeMap.png?raw=true"/><br/>

The bike data object consists of a pink noise generator and a ping pong delay. In a ping pong delay the echo swaps back and over between left and right channels each time it is heard. I mapped the data from the number of available bikes in the city to control the rate at which this takes place.

- [High number of Bikes](/audio/smart_city/Bikes/bikesHi.mp3)
- [Low number of Bikes](/audio/smart_city/Bikes/bikesLow.mp3)


The following is an example sonification with this framework. It represents good weather slight chance of rain above average traffic and few free bikes:

- [Full framework sonification](/audio/smart_city/Full Son/Smart City ML Sonification.mp3)

### The Outputs
This project resulted in a large body of outputs across a range of disciplines. Some of these explored the [technical](/papers/Roddy.pdf) aspects of the frameworks created while others considered the [aesthetic](http://www.ucd.ie/mustwork2016/t4media/MusTWork_2016_Proceedings.pdf), [theoretical](https://link.springer.com/chapter/10.1007/978-3-319-73374-6_12) and [social](https://impakter.com/technology-trends-transforming-the-world/) dimensions involved this research project.

You can read our recent ICAD 2021 paper here:

<iframe frameborder="0" src="https://drive.google.com/file/d/1uL_GeuWMenjJnn2SgdbKfVwvD0_n5Hgm/preview" style="height: 500px; width: 600px;"></iframe>




#### Book Chapter
- [Roddy S., Bridges B. (2018) Sound, Ecological Affordances and Embodied Mappings in Auditory Display. In: Filimowicz M., Tzankova V. (eds) New Directions in Third Wave Human-Computer Interaction: Volume 2 - Methodologies. Human–Computer Interaction Series. Springer, Cham.](https://link.springer.com/chapter/10.1007/978-3-319-73374-6_12)

#### Journal Article
- [Roddy S., & Bridges B. (2018) Addressing the Mapping Problem in Sonic Information Design through Embodied Image Schemata, Conceptual Metaphors and Conceptual Blending. The Journal of Sonic Studies. 17.](https://www.researchcatalogue.net/view/515156/515157)

#### Conference Papers
- [Roddy S., & Bridges B. (2021) The Design of a Smart City Sonification System Using a Concpetual Blending and Musical Framework, Web Audio and Deep Learning Techniques @ The International Conference on Auditory Display 2021](https://www.researchgate.net/publication/352737562_The_Design_of_a_Smart_City_Sonification_System_using_a_Conceptual_Blending_and_Musical_Framework_Web_Audio_and_Deep_Learning_Techniques)
- [Roddy, S. (2018) Ambient Data Monitoring w/Generative Music Systems using Evolutionary Computing & Machine Learning Techniques. CSMC 2018, Dublin, August 2018.](/papers/Roddy.pdf)
- [Roddy, S. (2017) Absolute Nothingness: The Kyoto School and Soundart Practice. In Proceedings of Invisible Places 2017.](https://www.researchgate.net/publication/318115471_Absolute_Nothingness_The_Kyoto_School_and_Sound_Art_Practice)
- [Sounding Human with Data: The Role of Embodied Conceptual Metaphors and Aesthetics in Representing and Exploring Data Sets @ Music Technology Workshop 2016, Michael Smurfit Business School, University College Dublin, June 10th 2016](http://www.ucd.ie/mustwork2016/t4media/MusTWork_2016_Proceedings.pdf)

#### Science Communication Article
- [Technology Trends Transforming the World' for Impakter January 2019](https://impakter.com/technology-trends-transforming-the-world/)

#### Conference Presentation
- [IoT and AI-Driven Audio in the Smart City: A Rhythmanalysis inspired approach. ISSTA 2018, Derry](https://drive.google.com/file/d/1XsfvVcSOV8eOTL1HJto_b3DV3w0S30y0/view)

#### Invited Talks
- ["Whose Music?": Panel Discussion on AI in Music Composition at Music Current 2019, CMC Dublin](https://www.facebook.com/events/2480204325324203/)
- [Data-driven Sound for Raising Awareness, Public Outreach and Insight Generation in Complex Data Sets @ I.NY Creative Education Symposium, Irish World Academy, University of Limerick, October 11th 2017](https://thisisiny.com/2017-2/symposium/)
- [Sonification, Sound Art & IOT @ The Arts and Technology Research Lab, Trinity College Dublin, December 12th 2016](https://www.tcd.ie/creative-arts/atrl/)
- [Embodied Sonification @ D.A.T.A: Dublin Arts and Technology Association, The Connect Centre, November 3rd 2016.](http://www.data.ie/?p=2565)
- [Sonification @ The Connect Centre for Future Networks and Communications, Trinity College Dublin, August 2016](https://connectcentre.ie/)
- [Sounding Human with Data. @ The International Digital Empathy Workshop, Ulster University, October 31st 2016](https://www.ulster.ac.uk/conference/digital-empathy)



### Creative Skills
HCI Design. Interaction Design. UX Design. Sound Design. Music Composition. Data Sonification. Data Visualisation.

### Technical & Research Skills
HTML/CSS/Javascript. Python. Csound. OSC& MIDI. Programming. Data Analysis. Audio Engineering. Recording. Data Analysis. Data Sonification. Data Visualisation. User Evaluations. A/B Testing. Experimental Design. Distributed User Testing.



### Tags
Internet of Things Networks, Embodied Cognition. Sonification. Auditory Display. Stephen Roddy.
