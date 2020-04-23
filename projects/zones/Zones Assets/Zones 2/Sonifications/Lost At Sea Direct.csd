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

;DATA					    ;Syrian Emigration Rate Statistics for Migrnts Lost at Sea from  01/10/2015 to 24/08/2016

   giSRIAEMI2 ftgen 0, 0, -345, -2, 28214,27966,37849,32559,39664,40180,38206,38573,43671,37018,42788,47708,37659,38475,36894,45403,38980,43465,38117,48626,59914,52433,52441,55672,57774,46002,45319,49469,51347,52754,53205,52744,47409,35572,41912,29756,36753,38754,42613,51861,51265,52233,50933,44089,42619,47988,40224,37295,38721,30887,36742,27970,31677,19809,26868,19839,18576,17797,19523,21950,25113,19545,23398,16329,19056,18515,29613,31186,25764,25946,21404,21310,24985,20153,25867,19940,21686,21879,18842,19764,25353,19403,18715,19121,23087,23762,24550,23591,24791,27118,20186,10130,15659,20400,19972,15744,16045,16102,11721,13362,14520,10946,11042,9165,13166,16235,18956,12404,12732,9780,11253,8428,11217,15342,10825,11926,12949,14224,16969,16910,15024,13556,13607,11098,8808,15337,11570,11708,12657,15424,16488,19734,13692,15482,11483,11176,8629,4277,6136,9613,11149,6678,12912,8488,9641,6826,6802,6764,5208,5547,8395,3834,3221,6488,5048,2554,3733,4684,2501,2258,4719,2458,1307,4300,2580,1328,1149,2618,2746,2122,2994,6205,2468,1084,677,722,532,259,516,640,1913,3388,1094,1582,768,618,586440,470,933,760,596,447,493,2805,2430,1576,932,481,945,936,734,787,840,491,582,467,789,1705627,948,845,354,1141,566,468,515,479,1290,2019,361,502,648,498,382,1443,461,475,423,1372,1312,403,482,529,389,766,2565,3657,3227,616,4428,2278,1504,612,406,602,389,726,801,758,452,686,991,2299,677,1423,2797,891,1283,904,1329,552,751,589,636,741,764,3385,2380,3917,817,4270,1814,2067,1352,1109,991,684,1119,3177,2912,1196,617,693,805,807,693,1464,1022,844,570,548,675,3212,2029,1313,1986,2429,942,580,1319,861,1180,2561,2230,2177,3274,1353,1087,634,1200,704,1179,543,523,1067,1211,465,403,439,505,687,917,584,1174,1514,904,1344,689,689
   
   
   
;DATA					    ;Syrian Emiration Rate Statistics for Migrnts Lost at Sea from  01/10/2015 to 24/08/2016

   giSRIAEMI ftgen 1, 0, -32, -2,112,255,661,844,1388,1875,2860,3618,4555,4862,5047,5262,5493.25,5958.5,6157.75,7435,7820.25,7944.5,8268.75,9132,9625.25,10252.5,10491.75,10857,11410,11623,12078,12778,14100,14619,14954,15025

/********************************************************************************************************************************/


instr 1  ; Midi Note Transmission

/**********************DATA INTAKE**************************/
iDatHi = 15025
iDatLo = 0 

iDatHi2 = 59914
iDatLo2 = 0  ;259

	iDatReadRate = p3
	iDatLen ftlen giSRIAEMI         
	kDatRead line 0, iDatReadRate, iDatLen 	                
	kDatIn tablei kDatRead,    giSRIAEMI
	
	
kData = ((127)*(kDatIn - iDatLo))/(iDatHi - iDatLo) ; 0-127
	
	

moscil 6, kData, kData, .005, .005  
;moscil 11, kData, kData, .005, .005  
;moscil 14, kData, kData, .005, .005  
;moscil 15, kData, kData, .005, .005  


/****************Note Control*****************/
	;midion kchn, knum, kvel
;	midion    1,      1,     90 			                    ; Creates a G note on channel 1 with a velocity of kData 

/*************** CC Control*****************/
	;midiout kstatus, kchan, kdata1, kdata2
  ;	 midiout  176,       1,         7,   kData 
							
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

i1 0 15


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
