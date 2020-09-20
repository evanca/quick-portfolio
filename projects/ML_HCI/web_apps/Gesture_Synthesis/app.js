let fr = 30; //set global frameRate
let video;
let poseNet;
let poses = [];

let leftX = 0;
let leftY = 0;
let rightX = 0;
let rightY = 0;

let fft;
// Sound Synthesis setup
let carrier; // this is the oscillator we will hear
let modulator; // this oscillator will modulate the frequency of the carrier
// the carrier frequency pre-modulation
let carrierBaseFreq = 220;
// min/max ranges for modulator
let modMaxFreq = 112;
let modMinFreq = 0;
let modMaxDepth = 150;
let modMinDepth = -150;

  // Framerate & Delay control
//let fr = 24;
let delay = .5;

function preload() {
bck = loadImage('scrnFlip.png');
}


function setup() {
//Visuals
let canvas = createCanvas(1000, 1000);
frameRate(fr);
angleMode(DEGREES);
background(bck);


//FFT
fft = new p5.FFT(0.9, 128);
fft.setInput(soundOut);

//Video & Posenet
video = createCapture(VIDEO);
video.size(width, height);

poseNetStart();
synth_start();
video.hide(); // hide the video element.

}

function poseNetStart(){
  // Create a new poseNet method with a single detection
poseNet = ml5.poseNet(video, modelReady);
// This sets up an event that fills the global variable "poses"
// with an array every time new poses are detected
poseNet.on('pose', function(results) {
poses = results;
});
poseNet.on('pose', gotPoses);
}

function gotPoses(poses) {
// console.log(poses);
if (poses.length > 0) {
// catches the left and right wrists
let lhX = poses[0].pose.keypoints[9].position.x;
let lhY = poses[0].pose.keypoints[9].position.y;
let rhX = poses[0].pose.keypoints[10].position.x;
let rhY = poses[0].pose.keypoints[10].position.y;

leftX = lerp(leftX, lhX, 0.25); //lerp = linear interpolation
leftY = lerp(leftY, lhY, 0.25);
rightX = lerp(rightX, rhX, 0.25);
rightY = lerp(rightY, rhY, 0.25);
  }
}

function modelReady() {
select('#status').html('Model Loaded');
console.log('model ready');
}

function drawHands(){
//Line Between Hands
stroke('white');
strokeWeight(1);
line(rightX, rightY+12, leftX, leftY+12);

//Hand Traingles
stroke('white');
strokeWeight(2);
fill('black');
let rightHand= triangle(rightX, rightY, rightX+25,rightY+35, rightX-25,rightY+35);
let leftHand = triangle(leftX, leftY, leftX+25,leftY+35, leftX-25,leftY+35);

}

function spectrumWriter(){

  var spectrum = fft.analyze();
   //console.log(spectrum);
   //stroke(255);
   noStroke();
   translate(width / 2, height / 2);


   for (let i = 0; i< spectrum.length; i++){

       let amp = spectrum[i];
       let r = map(amp, 0, 256, 0, 350);
       stroke(r, r, r);
       let x = map(i, 0, spectrum.length, 0, width);
       let h = (map(spectrum[i], 0, 255, 0, height*.25))*-1;
       rect(x, height-height, width / spectrum.length, h )

   }
}


function synth_start(){


  //Setup up for audio elements
    carrier = new p5.Oscillator('sine');
    carrier.amp(.05); // set amplitude
    carrier.freq(carrierBaseFreq); // set frequency
    carrier.start(); // start oscillating

    // try changing the type to 'square', 'sine' or 'triangle'
    modulator = new p5.Oscillator('sawtooth');
    modulator.start();

    // add the modulator's output to modulate the carrier's frequency
    modulator.disconnect();
    carrier.freq(modulator);

}

function draw() {

translate(video.width, 0);
//then scale it by -1 in the x-axis
//to flip the image
scale(-1, 1);
background(bck);
//drawKeypoints();
//drawSkeleton();
drawHands();
spectrumWriter();

let carFreq = map(leftY, height, 0, carrierBaseFreq, carrierBaseFreq*5);
  carrier.freq(carFreq);

let modFreq = map(rightY, height, 0, modMinFreq, modMaxFreq);
  modulator.freq(modFreq);

let modDepth = map(rightX, 0, width, modMinDepth, modMaxDepth);
  modulator.amp(modDepth);


}
