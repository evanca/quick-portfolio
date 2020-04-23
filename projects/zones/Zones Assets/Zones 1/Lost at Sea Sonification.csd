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

;DATA					    ;Syrian Emiration Rate Statistics for Migrants Lost at Sea from 01/10/2015 to 24/08/2016

   giSRIAEMI ftgen 1, 0, -32, -2,112,255,661,844,1388,1875,2860,3618,4555,4862,5047,5262,5493.25,5958.5,6157.75,7435,7820.25,7944.5,8268.75,9132,9625.25,10252.5,10491.75,10857,11410,11623,12078,12778,14100,14619,14954,15025

/********************************************************************************************************************************/

instr 1  ; Midi Note Transmission

/**********************DATA INTAKE**************************/
iDatHi = 15025
iDatLo = 0 

	iDatReadRate = p3
	iDatLen ftlen giSRIAEMI         
	kDatRead line 0, iDatReadRate, iDatLen 	                
	kDatIn tablei kDatRead,    giSRIAEMI
	
	
kData = ((127)*(kDatIn - iDatLo))/(iDatHi - iDatLo) ; 0-127
	
	

moscil 7, kData, kData, .005, .005  
;moscil 11, kData, kData, .005, .005  
;moscil 14, kData, kData, .005, .005  
;moscil 15, kData, kData, .005, .005  


/****************Note Control*****************/
	;midion kchn, knum, kvel
	midion    1,      1,     90 			                    ; Creates a G note on channel 1 with a velocity of kData 

/*************** CC Control*****************/
	;midiout kstatus, kchan, kdata1, kdata2
  	 midiout  176,       7,         7,   kData 
							
	;kData1 = CC Number. 7 is the expression controller
	; kdata2 is the midi scale data for the actual message	

/*
moscil 1, kData, kData, .005, .005  
moscil 2, kData, kData, .005, .005  
moscil 3, kData, kData, .005, .005  
moscil 4, kData, kData, .005, .005  
moscil 5, kData, kData, .005, .005  
moscil 6, kData, kData, .005, .005  
moscil 7, kData, kData, .005, .005  
moscil 8, kData, kData, .005, .005  
moscil 9, kData, kData, .005, .005  
moscil 10, kData, kData, .005, .005  
moscil 11, kData, kData, .005, .005  
moscil 12, kData, kData, .005, .005  
moscil 13, kData, kData, .005, .005  
moscil 14, kData, kData, .005, .005  
moscil 15, kData, kData, .005, .005  
moscil 16, kData, kData, .005, .005 
*/

printk 0,kData
 


endin
</CsInstruments>
<CsScore>

i1 0 30


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
