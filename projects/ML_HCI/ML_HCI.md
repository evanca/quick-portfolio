### Deep Learning for Music and Human Computer Interaction

#### Overview

This project is ongoing as part of my current Postdoctoral research work at the Department of Electrical and Electronic Engineering in Trinity College Dublin. The project aims to integrate machine learning techniques into human-computer interaction and music technology contexts.  

#### Phase 1: Machine Learning for Music Generation
The initial portions of phase 1 involved building machine learning models to generate musical materials offline. This was carried out with Tensorflow and the Keras library in Python. My approach involved the use of LSTM networks to learn features from sets of MIDI data so that I could generate new musical sequences from those models. This approach built on previous work carried out by [Sigurður Skúli Sigurgeirsson](https://github.com/Skuldur). This process involved acquiring a large number of MIDI files from a range of online sources across multiple musical styles. The MIDI files were cleaned to remove unwanted instrumentation etc. and prepared by mapping MIDI data (extracted with MIT's [Music21 toolkit](https://web.mit.edu/music21/)) to integers and one-hot encoding the results.
Training a neural network on a homogenous musical corpus results in outputs which iterate on a normative generalisation of the samples in the original data. More interesting outputs can be obtained by varying the input data set, the model architecture and the hyperparameters of the model.

<img src="images/model_def_py.png?raw=true"/><br/>

I also explored some of the ML tools created by Google's [Magenta Project](https://magenta.tensorflow.org/) and became fascinated with the creative potential of ML technologies beyond the generation of simple musical patterns. As a result I became increasingly focused on the application of ML techniques in online and real-time human-computer interaction (HCI) contexts, an area where I believe ML techniques will have a major impact in the near future.
You can read more about these projects here:

- [Signal to Noise Loops](https://stephenroddy.github.io/projects/s2nl/s2nl_project)
- [Indices Online](https://stephenroddy.github.io/projects/indices/indices_audio)

#### Phase 2: Computer Vision and Machine Learning for Gestural control of Unmanned Aerial Vehicles
The second phase of the project explored the application of machine learning techniques to real-time human-computer interaction contexts. My colleagues and I at the department of Electrical and Electronic Engineering TCD, designed and built a gestural control interface which could be used to control the flight of a an unmanned aerial vehicle (drone).
The hardware required to communicate with the drone was designed and built by a colleague. I built the system gestural interface system HTML, Javascript and Node.js and used the p5.js and ml5.js libraries. I worked with another colleague to integrate the interface with hardware.
The system allowed users to control the flight path of a drone through their hand movements. The users hand-movements are captured via camera/webcam and analysed using the ml5js [Posenet](https://medium.com/tensorflow/real-time-human-pose-estimation-in-the-browser-with-tensorflow-js-7dd0bc881cd5) implementation. These hand movements are then mapped to control the drone. The system was opened to the members of the public during the 2019 Trinity College Dublin Open Day.

<img src="images/Drone Project.gif?raw=true"/><br/>
- [More on youtube](https://youtu.be/nK5spkN2TOA)

#### Phase 3: Gestural Control of Sound Synthesis
Phase 3 of this project is still ongoing. It aims to integrate work carried out in the first two phases of the project. I have adapted the gestural control system I designed during phase 2 to control the parameters of different sound synthesis routines. While phase 1 of the project was exploratory in nature and phase 2 was centred around developing a workable application, I have adopted a standard iterative development style in phase 3. This return to a structured HCI style research and development model is resulting in the production and refinement of a series or prototypes for the gestural control of sound synthesis parameters.

You can experience a stable prototype of these here.
To use the prototypes stand in front of your webcam and move your hands to control sonic and visual parameters:

- [Prototype 2: Gestural Control of Sound Synthesis](https://stephenroddy.github.io/projects/ML_HCI/web_apps/Gesture_Synthesis/index.html)
- [Prototype 1: Animated Drone](https://stephenroddy.github.io/projects/ML_HCI/web_apps/Gesture_Drone/index.html)

#### Phase 4: 30 Epoch Opus

30 Epoch Opus, is a 3 track EP. It features 3 musical works in diverse styles. The harmonic materials (melodies and harmonies) for each piece were composed using a deep learning model with an LSTM-based architecture. The instruments and timbres chosen to synthesise (or sound out) these materials were not provided by the model. Instead, 3 distinct approaches to texture and timbre were employed each involving the manipulation of samples to some degree. The result is 3 pieces with markedly different sonic palettes spanning electronic, noise, and pseudo-contemporary styles.
In order to create interesting harmonic/melodic results, the model is left partially underfit and uses highly novel input data chosen for its originality. This underfitting allows some features present in the original data to “shine through” but prevents the material from becoming an overly generalised representation of the inputs. This leaves space for an element of chance and surprise in the output. The model architecture and hyperparameters have been selected to support this approach.

<iframe style="border: 0; width: 350px; height: 470px;" src="https://bandcamp.com/EmbeddedPlayer/album=951154666/size=large/bgcol=ffffff/linkcol=0687f5/tracklist=false/transparent=true/" seamless><a href="https://stephenroddy.bandcamp.com/album/30-epoch-opus">30 Epoch Opus by Stephen Roddy</a></iframe>


### Creative Skills
Music Compostion. Sound Design. Creative Computing. HCI & Interaction Design. UX Design. Visual Design. Interface Design.

### Technical & Research Skills
HTML/CSS/Javascript. Python. Computer Vision. Machine Learning. Deep Learning. Keras. Music21. MIDI. Sound & Music Computing. Serial. Data Analysis. Audio Engineering. Audio DSP. Sound Synthesis. Data Analysis. User Evaluation.

### Tags
Human-computer Interaction. Gestural Interfaces. Machine Learning. Music. Embodied Cognition. Stephen Roddy.


<!--
<iframe src="https://editor.p5js.org/roddyst/embed/3LK9dABOj"></iframe>

[Link: https://editor.p5js.org/roddyst/present/3LK9dABOj](https://editor.p5js.org/roddyst/present/3LK9dABOj)

<iframe src="https://editor.p5js.org/roddyst/embed/sAdryDYz1"></iframe>

//Notes:


1. Talk about the original designs.
  - Show the screen shots.
  - Talk about how they were designed for the wrong interaction type.
    w/buttons etc.
  - Introduce the final prototype idea.
  - Demonstrate the working prototype for the multiple synthesis types I've already created it for.


1. Upload the Interface for AM Synthesis.
2. Upload the Interface for FM Synthesis.

1. Talk about the original project elements with the machine learning training for musical models that I did.
2. Then talk about the pivot over to controlling Drones.
3. Then cover the movement from drones to sound synthesis.
-->
