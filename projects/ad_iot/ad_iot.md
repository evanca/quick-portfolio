**Project description:**

Auditory Display for Large Scale IoT Networks was a Postdoctoral project I undertook at CONNECT, the Science Foundation Ireland Research Centre for Future Networks headquartered at Trinity College Dublin. The project was funded by an Irish Research Council Government of Ireland Postdoctoral Research Fellowship.

### Research Process

This project was driven by the overarching research question: Can auditory display solutions present complex information in an intuitive manner in the context of IoT network monitoring tasks?. To answer this I began by talking to users who work with IoT networks, experts in the fields of IoT and Auditory Display and I also consulted the academic literature more generally.I broke the research question into smaller pieces: How can we best represent complex IoT data with sound? How useful can sound be for understanding data of this nature? What sounds should be used for different IoT data types and in what contexts? etc.
I used standard HCI methodologies to answer these questions. This was an iterative development process in which I would create a prototype solution, evaluate the solution, then iteration on the prototype taking the results of evaluation into account.

### Phase 1: Individual Network Specific Data Types.

Phase 1 of the project involved working with data from the Pervasive Nation a Low Powered Wide Area Network (LPWAN) infrastructure operated as an Internet of Things testbed by CONNECT, in Trinity College Dublin.

This phase involved the development of mapping strategies for representing network specific datatypes with sound. I determined a few sets of useful mapping strategies for representing IoT data in different use contexts and task scenarios.

### Data, Sound and Code.

Code was written in Python to retrieve network data from the server, analyse it, structure it and translate using the Open Sound Control (OSC) protocol so that it was ready to be sent to a synthesiser and mapped to sound parameters.
A wide range of scripts were written in Csound to represent different network behaviours and map specific datatypes to sound. Patches for mapping the data to sound were also developed in Reaktor 5.

[Picture of the code]

You can hear some examples of individual datatypes here:

[data 1]
[data 2]
[data 3]

### Phase 2: Full Networks and Multiple Data Streams.

I then shifted focus to the creation of auditory displays comprised of multiple streams of IoT network data. Mapping strategies that work well in isolation do not necessarily work well in unison. I developed new mapping strategies for representing multiple streams of IoT data.

[historical son 1]
[example from date range]

### Phase 3: Refine the Data to Sound Mapping Strategies
The third phase of the project involved the refinement of the mapping strategies developed in the first two phases.


### Phase 4: Smart Cities Data and Machine Learning Techniques
Phase four of the project involved the introduction of new data sources.

[CSMC Paper]
[Smart Cities Research]
