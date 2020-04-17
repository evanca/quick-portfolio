**Project description:**

Auditory Display for Large Scale IoT Networks was a Postdoctoral project I undertook at CONNECT, the Science Foundation Ireland Research Centre for Future Networks headquartered at Trinity College Dublin. The project was funded by an Irish Research Council Government of Ireland Postdoctoral Research Fellowship.

### Research Process

This project was driven by the overarching research question: Can auditory display solutions present complex information in an intuitive manner in the context of IoT network monitoring tasks?. To answer this I began by talking to users who work with IoT networks, experts in the fields of IoT and Auditory Display and I also consulted the academic literature more generally.I broke the research question into smaller pieces: How can we best represent complex IoT data with sound? How useful can sound be for understanding data of this nature? What sounds should be used for different IoT data types and in what contexts? etc.
I used theoretical frameworks from the field of Embodied Cognitive Science that apply to meaning-making and music cognition to ground the work in a meaningful context and I applied standard HCI methodologies to answer these questions posed above. This involved an iterative development process in which I would create a prototype solution based on the Embodied Cognition literature, evaluate the efficacy of the solution with users and then repeatedly iterate upon the design of the prototype taking the results of each successive evaluation into account.

### Phase 1: Individual Network Specific Data Types.

Phase 1 of the project involved working with data from the Pervasive Nation a Low Powered Wide Area Network (LPWAN) infrastructure operated as an Internet of Things testbed by CONNECT, in Trinity College Dublin.

This phase involved the development of mapping strategies for representing network specific datatypes with sound. Beginning from principles in the field of embodied cognitive science and utilising user testing methods, I identified sets of useful mapping strategies for representing IoT data in different use contexts and task scenarios.

During Phase 1 I wrote code was in Python to retrieve network data from the server with http requests, analysed and structured using pandas and then translated to the Open Sound Control (OSC) protocol using OSC.py. At this point it was ready to be sent to a synthesiser and mapped to sound parameters.
A wide range of scripts were written in Csound to represent different network behaviours and map specific datatypes to sound. Patches for mapping the data to sound were also developed in Reaktor 5.

[Picture of the code]

You can hear some examples of individual datatypes here:

[data 1]
[data 2]
[data 3]

### Phase 2: Full Networks, Multiple Data Streams .

I then shifted focus to the creation of auditory displays comprised of multiple streams of IoT network data. Mapping strategies that work well in isolation do not necessarily work well in unison. I developed new mapping strategies for representing multiple streams of IoT data.

[historical son 1]
[example from date range]

### Phase 3: Refine the Data to Sound Mapping Strategies and Development of Design Principles

The third phase of the project involved the refinement of the mapping strategies developed in the first two phases. Approaches that worked were further developed and expanded upon while those that didn't were discarded. This phase resulted in the creation of a new system for sonifying IoT Network data and the creation of a number of design guidelines for future systems. The design guidelines and auditory display system are presented in the Journal of Sonic Studies.

[Link to Sonifications]
[Link to Sonifications]
[Link to Sonifications]

[Link to Paper in Sound Studies Journal]

### Phase 4: Market Data, Smart Cities, Evolutionary Computing & Machine Learning Techniques

Having finalised the design of a system for representing IoT Network Traffic Data and put forward a set of guidelines for developing systems of this type, phase four of the project shifted focus again to consider a broader range of data sources. In the original funding application this phase of the project was intended to explore more creative/artistic applications of auditory display.
During phase 4 I focused on writing functional code that could to be easily deployed to the web. The two systems designed during this phase are designed to run client-side with the standard HTML/Javascript/CSS stack. In introduced Machine Learning (MuiscVAE, a javascript based variational autoencoder implementation created for musical data by the Google Magenta team) and Evolutionary Computing techniques (mostly genetic algorithms) to aid in the process of mapping data to sound. First, I created an ambient auditory display solution for monitoring financial markets. The data was from the from highly volatile 2018 cryptocurrency markets. It represented the live dollar values of different cryptocurrencies, retrieved via the Coinbase Pro API (originally GDAX). I created multiple mapping strategies for this data, some to generative musical pieces that would represent the overall state of the data in a more stimulating and creative manner and others to more straightforward sound parameters similar to auditory graphs. The system makes use Evolutionary Computing and Machine Learning techniques. It was presented at the 2018 conference on the Computer Simulation of Musical Creativity.

[CSMC Paper]

[CSMC] Example Sonifications
[CSMC APP Interface Design from Figma]

This final phase of the project also involved the development of a system for Smart Cities data.The system uses traffic data from open APIs around Dublin including Noise level data (Sonitus Systems API), number of public bikes available at stands and number of Free Parking Spaces in multi-storey car parks (Dublin City Council API), Travel Times on key routes around the city (Transport Infrastructure Ireland).
It also uses weather data from the OpenWeather Maps API including rainfall, windspeed and temperature levels. Theoretical frameworks from Embodied Cognitive Science and music theory were once again used to guide the initial design of the system. The system is comprised of four component layers: Data Acquisition & Processing, the Generative Engine,  Sound Synthesis Engine, and Post Processing. The output consists of three data-driven sound objects presented in sequence. The first object represents weather data the second represents traffic data and the third represents the number of available bikes at city bike stands. When attended to in sequence, the sonification is intended to give an overall sense of the state of the city in terms of these three categories.

Traditional approaches to mapping data to sound (parameter mapping sonification) were employed alongside approaches that involve machine learning techniques.


Machine learning techniques used in the mappings strategy. For example a variational autoencoder implementation was used to blend together musical motifs.






Resources:

SON work
Historical SON
PN_SON
International Dub  Pres Son

References to speaking engagement outputs.
