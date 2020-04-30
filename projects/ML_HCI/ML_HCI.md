### Machine Learning Applications for HCI & Music

#### Overview

This project is ongoing as part of my current Postdoctoral research work at the Department of Electrical and Electronic Engineering in Trinity College Dublin. The project aims to integrate machine learning techniques into human-computer interaction and music technology contexts.  

#### Phase 1: Machine Learning for Music Generation
The initial portions of phase 1 involved building machine learning models to generate musical materials offline. This was carried out with the Keras library in Python where I used LSTM networks to learn to learn features from sets of MIDI data and generate new musical sequences using those models and built on previous work by [Sigurður Skúli Sigurgeirsson](https://github.com/Skuldur). During this initial portion of the project it became obvious ML technologies have creative sonic potentials beyond the generation of musical patterns and I became increasingly focused on the application of ML techniques in online and real-time contexts. I found the generation of musical patterns to be quite a limited approach as at best it removes much of what I find fun about the processes of making and playing music.

<img src="images/model_def_py.png?raw=true"/><br/>

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

- [Current Gestural Interaction Prototype](https://editor.p5js.org/roddyst/present/l46Zsp63H)
- [Previous Drone Animation Prototype](https://editor.p5js.org/roddyst/present/6A5YgZa21)

### Creative Skills
HCI Design. Interaction Design. UX Design. Visual Design. Interface Design. Sound Design.

### Technical & Research Skills
HTML/CSS/Javascript. Python. Computer Vision. Machine Learning. Keras. Music21. MIDI. Sound & Music Computing. Serial. Data Analysis. Audio Engineering. Audio DSP. Sound Synthesis. Data Analysis. User Evaluation.

### Tags
Human-computer Interaction. Gestural Interfaces. Machine Learning. Embodied Cognition. Stephen Roddy.


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
