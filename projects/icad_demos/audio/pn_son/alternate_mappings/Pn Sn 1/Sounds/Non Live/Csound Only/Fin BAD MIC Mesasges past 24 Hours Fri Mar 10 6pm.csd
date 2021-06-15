<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac   ;;;RT audio out
;-iadc  ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o comb.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1


/****
This sonification represents all messages with bad MIC codes sent across the network in the 24 hour period between 6pm on Thursday Mar 9th and 6pm Thursday Mar 10th. 
It is one minute long and created using granular synthesis techniques. It is comprised of 120 bursts of sound called grain clouds. Each burst represents 12 minutes of time.  Th number relative number of bad MIC messages is represented by the complexity/activity of the grain cloud. 
Time is further denoted in the sonification by the tone of a bell which sounds every 6 hours. 
****/


giPN ftgen 0, 0, -120, -2,      0, 147, 125, 130, 121, 125, 133, 126, 127, 137, 122, 117, 136, 108, 127, 108, 106, 141, 131, 128, 116, 116, 120, 119, 113, 116, 112, 125, 127, 111, 109, 114, 122, 115, 123, 118, 108, 134, 106, 125, 107, 107, 134, 111, 120, 110, 126, 112, 108, 122, 119, 133, 113, 108, 120, 132, 205, 121, 128, 137, 135, 139, 117, 105, 118, 135, 115, 124, 126, 127, 123, 134, 135, 138, 145, 130, 137, 133, 159, 138, 143, 140, 146, 143, 137, 138, 153, 137, 136, 125, 116, 134, 256, 225, 229, 213, 295, 242, 237, 778, 1047, 1081, 1070, 1048, 852, 1014, 651, 232, 236, 231, 206, 143, 131, 143, 130, 166, 208, 171, 119, 134, 125


/****GLOBAL PARAMS****/
;Synthesis
ginsnd   = 1 
gimaxgdur =  .5 

;Timekeeping  
gicount init 0
giplay = 60
girest =.5




instr 1 ; Continuous and Discrete Data Processing
 
iDatHi = 1081
iDatLo = 105

	iDatReadRate = p3
	iDatLen ftlen giPN     
	kDatRead line 0, iDatReadRate, iDatLen 
	
	/**Continuous Processing***/	        
	kDatIn tablei kDatRead,  giPN
	;**DATA SCALING**
	gkSonC = (((1)*(kDatIn - iDatLo))/(iDatHi - iDatLo) ); 0-1
	
	/**Discrete Processing **/
	;kDatIn table kDatRead,  giPN
	;**DATA SCALING**
	gkSonD = (((1)*(kDatIn - iDatLo))/(iDatHi - iDatLo) ); 0-1

/******DETERMINE HERE IF gkSon is CONTINUOUS OR DISCRETE*****/
	gkSon = gkSonD  
	
	;tester
	;gkSon line 0,p3,1
	;gkSon lfo 1,.5
endin


instr 2 ; Event Scheduler

gkclock metro 2

 gkdur = .5 ;length of instrument play
 gidur = .5 ; Used ro control amplitude envelopes making them the same as the note length

  if(gkclock =1) then
  ;event "i", 3, 0, gkdur
  event "i",3,0,.25
  event "i",4,0,.25
  event "i",5,0,.25


  endif

endin


instr 3 ; Grain Sonifier 1

/*****Synthesis Control Parameters*****/

/*****First Grain Instrument*****/

/***AMPLITUDE***/
gkamp1 =10
gkaoff1 = 5

/***DENSITY***/
gkdbase1 =5; density base level 1 
gkdhi1     =1000 ; density hi level 1
gkdlo1     =200;density lo level 1
gkdcyc1 = 100 ;cycles per second 

/***PITCH***/

gkpbase1 = 220 
gkplo1 = 220
gkphi1 = 2500
gkpitch1 = 440
gkpcyc1 = 75

/***DURATION***/

gkbsedur1 = .002
gkdurchng1 = .00188


/****GENERATOR 1  -SONIFICATION MAPPINGS****/

;Amplitude Mapping
gkaoff1 = gkaoff1 *gkSon

;Density Mapping
gkdlo1 = gkdlo1*gkSon
gkdhi1 = gkdhi1*gkSon
gkdcyc1 = gkdcyc1*gkSon

;Pitch Mapping
gkplo1 = gkplo1*gkSon
gkphi1 = gkphi1*gkSon
gkpcyc1 = gkpcyc1*gkSon

;Duration Mapping
gkdurchng1 = gkdurchng1* gkSon

/*******Processing***********/

;Density Processing
gkdens1 randomi gkdbase1+gkdlo1,gkdhi1, gkdcyc1

;Pitch Processing
gkpoff1 randomi gkpbase1+gkplo1,gkphi1, gkpcyc1

;Duration Modelling
gkgdur1 = gkbsedur1 + gkdurchng1



/*******Synthesis***********/

aSon  grain gkamp1, gkpitch1, gkdens1, gkaoff1, gkpoff1, gkgdur1, ginsnd, 5, gimaxgdur, 0.0 


 /*****Post Processing****/


; Reverb
aoutL, aoutR freeverb aSon, aSon, .01, .2
aLeft= aSon+aoutL
aRight = aSon+aoutR

;Amplitude Envelope
kenv linseg 0, gidur*.2, 1, gidur*.6, 1, gidur*.2,0

aLeft = aLeft*kenv
aRight = aRight*kenv

;Output
aLeft=aLeft*.01
aRight=aRight*.01

   
outs aLeft,aRight
   endin

instr 4 ; Grain Sonifier 2

/*****Synthesis Control Parameters*****/

/*****First Grain Instrument*****/

/***AMPLITUDE***/
gkamp2 =11
gkaoff2 = 6

/***DENSITY***/
gkdbase2 =3; density base level 1 
gkdhi2     =750 ; density hi level 1
gkdlo2     =100;density lo level 1
gkdcyc2 = 50 ;cycles per second 

/***PITCH***/

gkpbase2 = 187 
gkplo2 = 359
gkphi2 = 1760
gkpitch2 = 543
gkpcyc2 = 57

/***DURATION***/

gkbsedur2 = .00525
gkdurchng2 = .005


/****GENERATOR 1  -SONIFICATION MAPPINGS****/

;Amplitude Mapping
gkaoff2 = gkaoff2 *gkSon

;Density Mapping
gkdlo2 = gkdlo2*gkSon
gkdhi2 = gkdhi2*gkSon
gkdcyc2 = gkdcyc2*gkSon

;Pitch Mapping
gkplo2 = gkplo2*gkSon
gkphi2 = gkphi2*gkSon
gkpcyc2 = gkpcyc2*gkSon

;Duration Mapping
gkdurchng2 = gkdurchng2* gkSon

/*******Processing***********/

;Density Processing
gkdens2 randomi gkdbase2+gkdlo2,gkdhi2, gkdcyc2

;Pitch Processing
gkpoff2 randomi gkpbase2+gkplo2,gkphi2, gkpcyc2

;Duration Modelling
gkgdur2 = gkbsedur2 + gkdurchng2



/*******Synthesis***********/

aSon  grain gkamp2, gkpitch2, gkdens2, gkaoff2, gkpoff2, gkgdur2, ginsnd, 5, gimaxgdur, 0.0 


  /*****Post Processing****/


; Reverb
aoutL, aoutR freeverb aSon, aSon, .01, .2
;aLeft= aSon+aoutL
aRight = aSon+aoutR

;Amplitude Envelope
kenv linseg 0, gidur*.2, 1, gidur*.6, 1, gidur*.2,0

;aLeft = aLeft*kenv
aRight = aRight*kenv

;Output

aLeft=0
aRight=aRight*.01


outs aLeft,aRight
   endin

instr 5 ; Grain Sonifier 3

/*****Synthesis Control Parameters*****/

/*****First Grain Instrument*****/

/***AMPLITUDE***/
gkamp3 =15
gkaoff3 = 10

/***DENSITY***/
gkdbase3 =1; density base level 1 
gkdhi3     =4000 ; density hi level 1
gkdlo3     =300;density lo level 1
gkdcyc3 = 25 ;cycles per second 

/***PITCH***/

gkpbase3 = 111 
gkplo3 = 50
gkphi3 = 500
gkpitch3 = 769
gkpcyc3 = 750

/***DURATION***/

gkbsedur3 = .008
gkdurchng3 = .011


/****GENERATOR 1  -SONIFICATION MAPPINGS****/

;Amplitude Mapping
gkaoff3 = gkaoff3 *gkSon

;Density Mapping
gkdlo3 = gkdlo3*gkSon
gkdhi3 = gkdhi3*gkSon
gkdcyc3 = gkdcyc3*gkSon

;Pitch Mapping
gkplo3 = gkplo3*gkSon
gkphi3 = gkphi3*gkSon
gkpcyc3 = gkpcyc3*gkSon

;Duration Mapping
gkdurchng3 = gkdurchng3* gkSon

/*******Processing***********/

;Density Processing
gkdens3 randomi gkdbase3+gkdlo3,gkdhi3, gkdcyc3

;Pitch Processing
gkpoff3 randomi gkpbase3+gkplo3,gkphi3, gkpcyc3

;Duration Modelling
gkgdur3 = gkbsedur3 + gkdurchng3



/*******Synthesis***********/

aSon  grain gkamp3, gkpitch3, gkdens3, gkaoff3, gkpoff3, gkgdur3, ginsnd, 5, gimaxgdur, 0.0 


 /*****Post Processing****/


; Reverb
aoutL, aoutR freeverb aSon, aSon, .01, .2
aLeft= aSon+aoutL
;aRight = aSon+aoutR

;Amplitude Envelope
kenv linseg 0, gidur*.2, 1, gidur*.6, 1, gidur*.2,0

aLeft = aLeft*kenv
;aRight = aRight*kenv

;Output

aRight = 0
aLeft=aLeft*.01


outs aLeft,aRight


   endin

instr 10; Bell

ipan = p7

/* Read in and convert i statement p fields to k statements to control panning*/
if (ipan == 0) then
	kpan = 0
elseif (ipan == .25) then
	kpan = .25
elseif (ipan == .5) then
	kpan =.5
elseif (ipan == .75) then
	kpan = .75
elseif (ipan == 1) then
	kpan = 1  
  endif
/* Read in and convert i statement p fields to k statements to control panning*/


  
kamp = p4
kfreq = 880
kc1 = p5
kc2 = p6
kvdepth = 0.005
kvrate = 6

asig fmbell kamp, kfreq, kc1, kc2, kvdepth, kvrate

kline linseg 1,p3*.75,1,p3*.25,0
asig = asig*kline
asig = asig*.025


a1, a2 pan2 asig, kpan 
     outs a1,a2

endin


   
</CsInstruments>
<CsScore>
; sine wave
f1 0 4096 10 1
; sigmoid wave
f2 0 1024 19 0.5 0.5 270 0.5

; Buzzsaw
f3 0 16384 10 1 0.5 0.3 0.25 0.2 0.167 0.14 0.125 .111 

; Hanning window 

f5  0 512  20 2 


i1 0 60
i2 0 60


i10 0 2 .2  5 5  0
i10 15 2 .2  5 5  .25
i10 30 2 .2  5 5  .5
i10 45 2 .2  5 5  .75
i10 60 2 .2  5 5  1

e

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
