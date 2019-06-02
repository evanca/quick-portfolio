---
layout: default
---

# Portfolio

## [CV](https://github.com/hw16471/hw16471.github.io/blob/master/pdf/Harry%20Waugh%20-%20Jan%202019.pdf)
The lastest version of my CV can be downloaded [here](https://github.com/hw16471/hw16471.github.io/blob/master/pdf/Harry%20Waugh%20-%20Jan%202019.pdf).

## [Computer Graphics Raytracer](https://github.com/ainsleyrutterford/UOB_Raytracer)
<div style="width:100%;height:0px;position:relative;padding-bottom:58.044%;">
  <iframe src="https://streamable.com/s/rn875/wxuqhg" frameborder="0" width="100%" height="100%" allowfullscreen style="width:100%;height:100%;position:absolute;left:0px;top:0px;overflow:hidden;">
  </iframe>
</div>
<br>
### Overview
This project involved building a Real-Time Raytracer from scratch using OpenCL, GLM and SDL. As can be seen above, this raytracer was used to render the [Cornell Box](https://en.wikipedia.org/wiki/Cornell_box) where phenomena such as reflection and refraction have been showcased. The realism of the rendered image was improved further using anti-aliasing and soft shadows. Other Cornell Box scenes are shown in the images below:
* [scene1](https://streamable.com/1mugn)
* [scene2](https://streamable.com/kwoa2)
* [scene3](https://streamable.com/phfs2)

### Technologies 
* C
* OpenCL
* OpenGL Mathematics (GLM)
* Simple DirectMedia Layer (SDL2)


### Compile and Run
```bash
git clone git@github.com:ainsleyrutterford/UOB_Raytracer
cd UOB_Raytracer
source clean_build.sh
```
Requirements: A GPU, OpenCL, GLM, and SDL2

---
## [Parallel Optimisations of a Lattice Boltzmann Code (Using the BlueCrystal Supercomputer)](https://github.com/hw16471/UOB_OpenCL_LBM)
<img src="images/final_state.png" width="450">
### Overview
This project was all about learning how to exploit different hardware to improve the runtime of a Lattice Boltzmann code, which is widely used for simulating fluid dynamics. Popular programming platforms like MPI, OpenMP and OpenCL were each implmented and tested in various different combinations. The most efficient of these was OpenCL or MPI+OpenCL, which utilised one or more GPUs. If you want know more about this, please read the [article](https://github.com/hw16471/UOB_OpenCL_LBM/blob/master/submission/report.pdf) I wrote. 

### Technologies 
* C
* OpenCL
* MPI
* OpenMP

### Compile and Run
```bash
git clone git@github.com:hw16471/UOB_OpenCL_LBM
cd UOB_OpenCL_LBM/submission
make
./d2q9-bgk ../input_128x128.params ../obstacles_128x128.dat
```
Requirements: A GPU, OpenCL

---

## [Disseration: Using Sensor Fusion and Deep Learning to Improve Activity Tracking](https://github.com/hw16471/ActivityTrackingWithSensorFusion)
<img src="images/rnn-kal-map.png" width="450">
### Overview
I wrote my dissertation for my Computer Science degree on whether the accuracy of GPS tracking for sports activities (running, cycling, walking) could be improved using additional sensors found in a smartphone. Initially, I implemented a Kalman Filter to fuse the readings of each sensor, this was written in python and used popular libraries like NumPy. I then researched and taught myself the theory behind Recurrent Neural Networks (RNNs) in order to implement them using tensorflow and keras. This project was supported by the Oracle Innovation Accelerator program, who generously gave me access to a cloud compute instance.

[Link to Dissertation](https://github.com/hw16471/ActivityTrackingWithSensorFusion/blob/last-working/Using_Sensor_Fusion_and_Deep_Learning_to_Improve_Activity_Tracking.pdf)

### Technologies 
* Python
* NumPy, SciPy and Pandas
* Tensorflow
* Keras

### Compile and Run
To train model with test data:
```bash
git clone git@github.com:hw16471/ActivityTrackingWithSensorFusion
cd ActivityTrackingWithSensorFusion
python deep_learning.py
```
Requirements: A GPGPU, Python, Tensorflow_GPU, NumPy, Keras

---
## [Web Technologies](https://github.com/hw16471/UOB_Web_Tech_CW)
<img src="images/web-tech-showcase.png" width="450">
### Overview
This project involved creating a website for a University of Bristol games project, Khaos Kitchen. The website showcased a range of different technologies, each used with respect to web standards and compatability. A working forum was set up using a NodeJS server and an SQLite3 embedded database. The forum was created dynamically using templating engine 'pug.js', and requested different parts of the forum 'on the fly' as the user needed them.

### Technologies 
* HTML ( Dynamically created using Pug.js )
* Javascript ( JQuery, Ajax )
* CSS 
* NodeJS Server with embedded SQLite3 database

### Compile and Run
```bash
git clone git@github.com:hw16471/UOB_Web_Tech_CW
cd UOB_Web_Tech_CW/site
node server.js
```
Requirements: NodeJS and Packages found in packages.json

---



## [Applied Security - DPA Attacks](https://github.com/hw16471/AppliedSecurity)
<img src="images/labelled_trace.png" width="450">
### Overview
This project developed my understanding of how AES encryption works and the different 'trade offs' between speed, memory usage and ultimately, security. An AES implementation was first developed to run a scale-board from the University of Bristol, this device has severe hardware limitations and thus any implementation must be efficient. One of the ways this was done was to pre-compute the sbox function. A Differential Power Attack (DPA) was then created in python to interact with the board in order to gather power traces. These recorded traces could then be compared to hypothetical power consumption values for a chosen message in order to recover the key, using approximately 125 traces. A counter-measure for this style of attack was implemented called masking, this carefully used 6 masks throughout the encryption process to prevent information leaking from the CPU. This prevented key recovery for 'first order' DPA style attacks. 

### Technologies 
* C
* Python
* Multiprocessing and NumPy packages

### Compile and Run
Attacks require a scale-board, or dat file containing it's traces. If this can be obtained, 
attacks can be run with:
```bash
git clone git@github.com:hw16471/AppliedSecurity
cd AppliedSecurity/39824/scope
make parallel_attack.py
```
Requirements: A scale-board.


---

## [Detecting Dartboards](https://github.com/hw16471/UOB_DartboardDetector)
<img src="images/everythingdart14.jpg" width="450">
### Overview
This project looked at the Viola-Jones classifier and transforming images into the Hough space. Using the Hough space, line and circle detection was combined to identify dartboards within images.

### Technologies 
* C++ 
* OpenCV

### Compile and Run
```bash
git clone git@github.com:hw16471/UOB_DartboardDetector
cd UOB_DartboardDetector/finalversion
make all
./output
```
Requirements: CPP and OpenCV

---


Text can be **bold**, _italic_, or ~~strikethrough~~.

[Link to another page](./another-page.html).

There should be whitespace between paragraphs.

There should be whitespace between paragraphs. We recommend including a README, or a file with information about your project.

# Header 1

This is a normal paragraph following a header. GitHub is a code hosting platform for version control and collaboration. It lets you and others work together on projects from anywhere.

## Header 2

> This is a blockquote following a header.
>
> When something is important enough, you do it even if the odds are not in your favor.

### Header 3

```js
// Javascript code with syntax highlighting.
var fun = function lang(l) {
  dateformat.i18n = require('./lang/' + l)
  return true;
}
```

```ruby
# Ruby code with syntax highlighting
GitHubPages::Dependencies.gems.each do |gem, version|
  s.add_dependency(gem, "= #{version}")
end
```

#### Header 4

*   This is an unordered list following a header.
*   This is an unordered list following a header.
*   This is an unordered list following a header.

##### Header 5

1.  This is an ordered list following a header.
2.  This is an ordered list following a header.
3.  This is an ordered list following a header.

###### Header 6

| head1        | head two          | three |
|:-------------|:------------------|:------|
| ok           | good swedish fish | nice  |
| out of stock | good and plenty   | nice  |
| ok           | good `oreos`      | hmm   |
| ok           | good `zoute` drop | yumm  |

### There's a horizontal rule below this.

* * *

### Here is an unordered list:

*   Item foo
*   Item bar
*   Item baz
*   Item zip

### And an ordered list:

1.  Item one
1.  Item two
1.  Item three
1.  Item four

### And a nested list:

- level 1 item
  - level 2 item
  - level 2 item
    - level 3 item
    - level 3 item
- level 1 item
  - level 2 item
  - level 2 item
  - level 2 item
- level 1 item
  - level 2 item
  - level 2 item
- level 1 item

### Small image

![Octocat](https://github.githubassets.com/images/icons/emoji/octocat.png)

### Large image

![Branching](https://guides.github.com/activities/hello-world/branching.png)


### Definition lists can be used with HTML syntax.

<dl>
<dt>Name</dt>
<dd>Godzilla</dd>
<dt>Born</dt>
<dd>1952</dd>
<dt>Birthplace</dt>
<dd>Japan</dd>
<dt>Color</dt>
<dd>Green</dd>
</dl>

```
Long, single-line code blocks should not wrap. They should horizontally scroll if they are too long. This line should be long enough to demonstrate this.
```

```
The final element.
```
