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
 
iDatHi = 1500
iDatLo = 0

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


instr 2 

kcps = 440
kcar = 1
kmod = .1;*gkSon
kndx =  20*gkSon 	;intensivy sidebands

asig foscil .5, kcps, kcar, kmod, kndx, 1
     outs asig, asig
     

endin



   
</CsInstruments>
<CsScore>
; sine wave
f1 0 16384 10 1
; sigmoid wave
f2 0 1024 19 0.5 0.5 270 0.5

; Buzzsaw
f3 0 16384 10 1 0.5 0.3 0.25 0.2 0.167 0.14 0.125 .111 

; Hanning window 

f5  0 512  20 2 


i1 0 10
i2 0 10 


;i2 0 60

;i2 0  9 .01	;vibrato
;i2 10 .  1
;i2 20 . 1.414	;gong-ish
;i2 30 5 2.05	;with "beat"
e
 

;i10 0 2 .2  5 5  0
;i10 15 2 .2  5 5  .25
;i10 30 2 .2  5 5  .5
;i10 45 2 .2  5 5  .75
;i10 60 2 .2  5 5  1




;i10 0 2 .2  5 5  0
;i10 15 2 .2  5 5  .25
;i10 30 2 .2  5 5  .5
;i10 45 2 .2  5 5  .75
;i10 60 2 .2  5 5  1

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
