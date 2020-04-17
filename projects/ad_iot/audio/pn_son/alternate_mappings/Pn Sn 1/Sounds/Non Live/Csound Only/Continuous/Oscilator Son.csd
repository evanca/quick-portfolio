

<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o oscil.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;DATA-SET STORAGE;;;;; 	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




giPN ftgen 0, 0, -120, -2,      0, 147, 125, 130, 121, 125, 133, 126, 127, 137, 122, 117, 136, 108, 127, 108, 106, 141, 131, 128, 116, 116, 120, 119, 113, 116, 112, 125, 127, 111, 109, 114, 122, 115, 123, 118, 108, 134, 106, 125, 107, 107, 134, 111, 120, 110, 126, 112, 108, 122, 119, 133, 113, 108, 120, 132, 205, 121, 128, 137, 135, 139, 117, 105, 118, 135, 115, 124, 126, 127, 123, 134, 135, 138, 145, 130, 137, 133, 159, 138, 143, 140, 146, 143, 137, 138, 153, 137, 136, 125, 116, 134, 256, 225, 229, 213, 295, 242, 237, 778, 1047, 1081, 1070, 1048, 852, 1014, 651, 232, 236, 231, 206, 143, 131, 143, 130, 166, 208, 171, 119, 134, 125





instr 1 ; Continuous and Discrete Data Processing
 
iDatHi = 1081
iDatLo = 105

	iDatReadRate = p3
	iDatLen ftlen giPN         
	kDatRead line 0, iDatReadRate, iDatLen 	                
	kDatIn tablei kDatRead,    giPN
	
	
kData = ((127)*(kDatIn - iDatLo))/(iDatHi - iDatLo) ; 0-127
	


kamp = .6
kcps = 440
ifn  = p4



 
  kloop loopseg kData, 0, .5, 0, 0.5, .5,5

  
asig oscil kloop, kcps, ifn
     outs asig,asig

endin
</CsInstruments>
<CsScore>
f1 0 16384 10 1                                          ; Sine
f2 0 16384 10 1 0.5 0.3 0.25 0.2 0.167 0.14 0.125 .111   ; Sawtooth
f3 0 16384 10 1 0   0.3 0    0.2 0     0.14 0     .111   ; Square
f4 0 16384 10 1 1   1   1    0.7 0.5   0.3  0.1          ; Pulse

i 1 0 15 2


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
