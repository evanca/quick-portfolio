### Poster and Demos for ICAD Paper

#### Poster Object
<a href="images/Poster 1080p.png">
<img src="images/Poster 1080p.png?raw=true"/><br/>
</a>

* [PDF Version of Poster](papers/poster_icad.pdf)

#### Smart Cities Data

This final phase of the project also involved the development of a framework for Smart Cities data. Rather than dealing with data at the level of the network, this phase investigated the use of sensor level data. The framework uses traffic data from open APIs around Dublin including Noise level data (Sonitus Systems API), number of public bikes available at stands and number of Free Parking Spaces in multi-storey car parks (Dublin City Council API), Travel Times on key routes around the city (Transport Infrastructure Ireland).
It also uses weather data from the OpenWeather Maps API including rainfall, windspeed and temperature levels. Theoretical frameworks from Embodied Cognitive Science and music theory were once again used to guide the initial design of the framework. The framework is comprised of the same four component layers involved in the previous framework and represented in the figure above. The output consists of three data-driven sound objects presented in sequence. The first object represents weather data the second represents traffic data and the third represents the number of available bikes at city bike stands. When attended to in sequence, the sonification is intended to give an overall sense of the state of the city in terms of these three categories.

<img src="images/Model_3_Smart_City.png?raw=true"/><br/>

A number of strategies to mapping data to sound were adopted here.
Traditional approaches to mapping data to sound (parameter mapping sonification) were employed alongside approaches that involve machine learning techniques. For example in the generative engine the highest point in the dataset is represented with a unique musical pattern and the lowest point is represented with another. By blending these motifs together using MusicVAE new musical patterns are generated to represent values between these two points. Essentially, the high point of the data is represented with one musical motif and the low point with another one. All data points in between are then represented as blends of these two motifs. This is a refinement of the target states approach I used for the previous framework.


Data are mapped across the generative, sound synthesis and post-processing layers for each data object.

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
- [Low Temperature](/audio/smart_city/Temperature/tempLow.m4a)

Windspeed is mapped to control the cycle frequency of an automatic filter at the FX layer.

- [High Windspeed](/audio/smart_city/Windspeed/HiWind.m4a)

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

- [Low Traffic & High Noise](/audio/smart_city/Bikes/NoiseTrafLo.mp3)
- [High Traffic & High Noise](/audio/smart_city/Bikes/NoiseTrafHi.mp3)

- [High Noise & Few Parking Spaces](/audio/smart_city/Bikes/FewSpacesMuchNoise.mp3)
- [No Noise & Few Parking Spaces](/audio/smart_city/Bikes/FewSpacesMuchNoise.mp3)

In the following example the high traffic motif transforms into the low traffic motif:

- [High Traffic to Low Traffic](/audio/smart_city/Traffic/fullTraffic20.mp3)


#### Bike Data Object:
<img src="images/BikeMap.png?raw=true"/><br/>

The bike data object consists of a pink noise generator and a ping pong delay. In a ping pong delay the echo swaps back and over between left and right channels each time it is heard. I mapped the data from the number of available bikes in the city to control the rate at which this takes place.

- [High number of Bikes](/audio/smart_city/Bikes/bikesHi.mp3)
- [Low number of Bikes](/audio/smart_city/Bikes/bikesLow.mp3)


The following is an example sonification with this framework. It represents good weather slight chance of rain above average traffic and few free bikes:

- [Full framework sonification](/audio/smart_city/Full Son/Smart City ML Sonification.mp3)
