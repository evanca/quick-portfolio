

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



;DATA-SET INPUT	 FOR INSTRUMENT 1
/********************************************************************************************************************************/

;DATA					    ;Syrian Emiration Rate 2007-2014

   giSRIAEMI ftgen 0, 0, -7, -2,                    0, 2.95,5.9,8.85,11.18,27.82,17.89,113.51,113.51

/********************************************************************************************************************************/

instr 1  ; Midi Note Transmission

/**********************DATA INTAKE**************************/
iDatHi = 113.51
iDatLo = 0

	iDatReadRate = p3
	iDatLen ftlen giSRIAEMI         
	kDatRead line 0, iDatReadRate, iDatLen 	                
	kDatIn tablei kDatRead,    giSRIAEMI
	
	
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
