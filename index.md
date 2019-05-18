# Portfolio

## [CV](https://github.com/hw16471/hw16471.github.io/blob/master/pdf/Harry%20Waugh%20-%20Jan%202019.pdf)
The lastest version of my CV can be downloaded [here](https://github.com/hw16471/hw16471.github.io/blob/master/pdf/Harry%20Waugh%20-%20Jan%202019.pdf).

## [Computer Graphics Raytracer](https://github.com/ainsleyrutterford/UOB_Raytracer)
<img src="images/showcase1.png" width="450">
### Overview

### Compile and Run
```bash
git clone git@github.com:ainsleyrutterford/UOB_Raytracer
cd UOB_Raytracer
source clean_build.sh
```
Requirements: A GPU, OpenCL, GLM, and SDL2

### Technologies 
* C
* OpenCL
* OpenGL Mathematics (GLM)
* Simple DirectMedia Layer (SDL2)

---
## [Parallel Optimisations of a Lattice Boltzmann Code](https://github.com/hw16471/UOB_OpenCL_LBM)
<img src="images/final_state.png" width="450">
### Overview

### Compile and Run
```bash
git clone git@github.com:hw16471/UOB_OpenCL_LBM
cd UOB_OpenCL_LBM/submission
make
./d2q9-bgk ../input_128x128.params ../obstacles_128x128.dat
```
Requirements: A GPU, OpenCL

### Technologies 
* C
* OpenCL

---
## [Web Technologies](https://github.com/hw16471/UOB_Web_Tech_CW)
<img src="images/web-tech-showcase.png" width="450">
### Overview

### Compile and Run
```bash
git clone git@github.com:hw16471/UOB_Web_Tech_CW
cd UOB_Web_Tech_CW/site
node server.js
```
Requirements: NodeJS and Packages found in packages.json

### Technologies 
* HTML ( Dynamically created using Pug.js )
* Javascript ( JQuery, Ajax )
* CSS 
* NodeJS Server with embedded SQLite3 database

---

## [Thesis: Using Sensor Fusion and Deep Learning to Improve Activity Tracking](https://github.com/hw16471/ActivityTrackingWithSensorFusion)
<img src="images/rnn-kal-map.png" width="450">
### Overview

### Compile and Run
To train model with test data:
```bash
git clone git@github.com:hw16471/ActivityTrackingWithSensorFusion
cd ActivityTrackingWithSensorFusion
python deep_learning.py
```
Requirements: A GPGPU, Python, Tensorflow_GPU, NumPy, Keras

### Technologies 
* Python
* NumPy, SciPy and Pandas
* Tensorflow
* Keras

---

## [Detecting Dartboards](https://github.com/hw16471/UOB_DartboardDetector)
<img src="images/everythingdart14.jpg" width="450">
### Overview

### Compile and Run
```bash
git clone git@github.com:hw16471/UOB_DartboardDetector
cd UOB_DartboardDetector/finalversion
make all
./output
```
Requirements: CPP and OpenCV

### Technologies 
* C++ 
* OpenCV

---


## [Applied Security](https://github.com/hw16471/AppliedSecurity)
<img src="images/labelled_trace.png" width="450">
### Overview

### Compile and Run
Attacks require a scale-board, or dat file containing it's traces. If this can be obtained, 
attacks can be run with:
```bash
git clone git@github.com:hw16471/AppliedSecurity
cd AppliedSecurity/39824/scope
make parallel_attack.py
```
Requirements: A scale-board.


### Technologies 
* C
* Python
* Multiprocessing and NumPy packages

---
