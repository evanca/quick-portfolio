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

/****USER DEFINED OPCODES****/

opcode	vowgen2,	a, kkkkkki

kfund,kmorf,koct,imode,kris,kdur,kdec xin  ;Opcode extended by Stephen Roddy to accept grain params

imorf	ftgentmp 0, 0, 16, 10, 1; must be 16 elements long because vowels are in tables of length 16
ifenv	ftgentmp 0, 0, 4096, 19, .5, .5, 270, .5
ivib	ftgentmp 0, 0, 4096, 10, 1
if imode == 0 igoto bass
if imode == 1 igoto tenor
if imode == 2 igoto countertenor
if imode == 3 igoto alto
if imode == 4 igoto soprano
bass:
ia	ftgentmp 0, 0, 16, -2, 600, 1040, 2250, 2450, 2750, 0, -7, -9, -9, -20, 60, 70, 110, 120, 130
ie	ftgentmp 0, 0, 16, -2, 400, 1620, 2400, 2800, 3100, 0, -12, -9, -12, -18, 40, 80, 100, 120, 120
ii	ftgentmp 0, 0, 16, -2, 350, 1700, 2700, 3700, 4950, 0, -20, -30, -22, -28, 60, 90, 100, 120, 120
io	ftgentmp 0, 0, 16, -2, 450, 800, 2830, 3500, 4950, 0, -11, -21, -20, -40, 40, 80, 100, 120, 120
iu	ftgentmp 0, 0, 16, -2, 325, 700, 2530, 3500, 4950, 0, -20, -32, -28, -36, 40, 80, 100, 120, 120
igoto ind
tenor:
ia	ftgentmp 0, 0, 16, -2, 650, 1080, 2650, 2900, 3250, 0, -6, -7, -8, -22, 80, 90, 120, 130, 140	
ie	ftgentmp 0, 0, 16, -2, 400, 1700, 2600, 3200, 3580, 0, -14, -12, -14, -20, 70, 80, 100, 120, 120	
ii	ftgentmp 0, 0, 16, -2, 290, 1870, 2800, 3250, 3540, 0, -15, -18, -20, -30, 40, 90, 100, 120, 120	
io	ftgentmp 0, 0, 16, -2, 400, 800, 2600, 2800, 3000, 0, -10, -12, -12, -26, 70, 80, 100, 130, 135	
iu	ftgentmp 0, 0, 16, -2, 350, 600, 2700, 2900, 3300, 0, -20, -17, -14, -26, 40, 60, 100, 120, 120
igoto ind
countertenor:
ia	ftgentmp 990, 0, 16, -2, 660, 1120, 2750, 3000, 3350, 0, -6, -23, -24, -38, 80, 90, 120, 130, 140	
ie	ftgentmp 991, 0, 16, -2, 440, 1800, 2700, 3000, 3300, 0, -14, -18, -20, -20, 70, 80, 100, 120, 120	
ii	ftgentmp 992, 0, 16, -2, 270, 1850, 2900, 3350, 3590, 0, -24, -24, -36, -36, 40, 90, 100, 120, 120	
io	ftgentmp 993, 0, 16, -2, 430, 820, 2700, 3000, 3300, 0, -10, -26, -22, -34, 40, 80, 100, 120, 120	
iu	ftgentmp 994, 0, 16, -2, 370, 630, 2750, 3000, 3400, 0, -20, -23, -30, -34, 40, 60, 100, 120, 120
igoto ind
alto:
ia	ftgentmp 0, 0, 16, -2, 800, 1150, 2800, 3500, 4950, 0, -4, -20, -36, -60, 80, 90, 120, 130, 140
ie	ftgentmp 0, 0, 16, -2, 400, 1600, 2700, 3300, 4950, 0, -24, -30, -35, -60, 60, 80, 120, 150, 200
ii	ftgentmp 0, 0, 16, -2, 350, 1700, 2700, 3700, 4950, 0, -20, -30, -36, -60, 50, 100, 120, 150, 200
io	ftgentmp 0, 0, 16, -2, 450, 800, 2830, 3500, 4950, 0, -9, -16, -28, -55, 70, 80, 100, 130, 135
iu	ftgentmp 0, 0, 16, -2, 325, 700, 2530, 3500, 4950, 0, -12, -30, -40, -64, 50, 60, 170, 180, 200
igoto ind
soprano:
ia	ftgentmp 0, 0, 16, -2, 800, 1150, 2900, 3900, 4950, 0, -6, -32, -20, -50, 80, 90, 120, 130, 140	
ie	ftgentmp 0, 0, 16, -2, 350, 2000, 2800, 3600, 4950, 0, -20, -15, -40, -56, 60, 100, 120, 150, 200	
ii	ftgentmp 0, 0, 16, -2, 270, 2140, 2950, 3900, 4950, 0, -12, -26, -26, -44, 60, 90, 100, 120, 120	
io	ftgentmp 0, 0, 16, -2, 450, 800, 2830, 3800, 4950, 0, -11, -22, -22, -50, 40, 80, 100, 120, 120	
iu	ftgentmp 0, 0, 16, -2, 325, 700, 2700, 3800, 4950, 0, -16, -35, -40, -60, 50, 60, 170, 180, 200
igoto ind

ind:
index	ftgentmp 0, 0, 16, -2, ia, ie, ii, ia, io, iu, ie, io, ii, iu, ia, io, ia, ia, ia, ia, ia


	ftmorf	kmorf, index, imorf

kfx	=	0
kform1	table	kfx,  imorf
kform2	table	kfx+1, imorf
kform3	table	kfx+2, imorf
kform4	table	kfx+3, imorf
kform5	table	kfx+4, imorf
kamp1	table	kfx+5, imorf
kamp2	table	kfx+6, imorf
kamp3	table	kfx+7, imorf
kamp4	table	kfx+8, imorf
kamp5	table	kfx+9, imorf
kbw1	table	kfx+10,imorf
kbw2	table	kfx+11,imorf
kbw3	table	kfx+12, imorf
kbw4	table	kfx+13, imorf
kbw5	table	kfx+14, imorf

iolaps	=	100
a1	fof	ampdbfs(kamp1), kfund, kform1, koct, kbw1, kris,  kdur,  kdec, iolaps, ivib, ifenv, p3
a2	fof	ampdbfs(kamp2), kfund, kform2, koct, kbw2, kris,  kdur,  kdec, iolaps, ivib, ifenv, p3
a3	fof	ampdbfs(kamp3), kfund, kform3, koct, kbw3, kris,  kdur,  kdec, iolaps, ivib, ifenv, p3
a4	fof	ampdbfs(kamp4), kfund, kform4, koct, kbw4, kris,  kdur,  kdec, iolaps, ivib, ifenv, p3
a5	fof	ampdbfs(kamp5), kfund, kform5, koct, kbw5, kris,  kdur,  kdec, iolaps, ivib, ifenv, p3
asig	=	a1+a2+a3+a4+a5

	xout	asig
endop
	
/****USER DEFINED OPCODES****/
	

/************************DATA-SET STORAGE************************/ 	


;DATA-SET INPUT	
							  ;Gross National Product from 2007-2012 by quarter 	
	giGNP ftgen 0, 0, -24, -2, 37283,36546,37108,37091,37448,36956,35934,34948,34127,33147,32506,32227,32367,32894,33574,33887,32820,32749,32716,32360,32597,33958,33094,33339,33339

  
;DATA					  ;Avg. Unemployment Rate from 2007-2012 by quarter 	
	 giUER ftgen 0, 0, -24, -2,       4.5, 4.66, 4.63,4.86, 5.06, 5.7, 6.86, 8.13, 10.2, 11.96, 12.66, 13.03, 13.1, 13.66, 14, 14.63, 14.43,14.43, 14.73, 14.9, 15, 14.76, 14.63, 14.23, 14.23	


;DATA					  ;Avg. Emigration Rate from 2007-2012 in thousands

  giEMI ftgen 0, 0, -6, -2,          46.3, 49.2, 72.0, 69.2, 80.6, 87.1	, 87.1


;DATA
							  ;Data	
		giTEMP ftgen 0, 0, -14, -2,     8.5,8.0,8.9,12.6,15.1,19.3,22.1,19.4,18.7,20,22,25,31

instr 1 
 
gkfund =148 ;GLOBAL FUNDAMENTAL VARIABLE

 
 /***************DATA PROCESSING*****************/
 
iDatHi = 37448
iDatLo = 32227

	iDatReadRate = p3
	iDatLen ftlen giGNP     
	kDatRead line 0, iDatReadRate, iDatLen 	        
	kDatIn tablei kDatRead,  giGNP
	;**DATA SCALING**
	ky = (((1)*(kDatIn - iDatLo))/(iDatHi - iDatLo) ); 0-1

 /*****************PROSODY**********************/
 
	;Basic Carrier Lfo defines phrase/prosody shape
kSlfo =10

kSpeed = 2
k2 	randh 1, 3   ;Randomisation to emulation phrasing and prosody
kScps = kSpeed*k2
aPhrase  lfo kSlfo, kScps, 0



	;Up Lfo models + rate
kUlfo =5  ;Control the Amount of LFO applied to the signal here 

kUSpeed = .5
kU2 	randh 1, .3   ;Randomisation to emulation phrasing and prosody
kUcps = kUSpeed*kU2
aUp  lfo kUlfo, kUcps, 4



	;Down Lfo models - rate
kDlfo =5  ;Control the Amount of LFO applied to the signal here 

kDSpeed = .5
kD2 	randh 1, .3   ;Randomisation to emulation phrasing and prosody
kDcps = kDSpeed*kD2
aDn  lfo kDlfo, kDcps, 5

/*****************PausingModel**********************/

	;Square Wave LFO models pauses
kPlfo =1  ;Control the Amount of LFO applied to the signal here 
kPSpeed random .25,2
   ;Randomisation to emulation phrasing and prosody

kPR2 	randh 1, .25   

kP2 randomh .0625,10,.5


kPcps = kPSpeed*kPR2


aPs  lfo kPlfo, kPcps, 3


	;Add Up and Down Signal to Phrase Signal Signals Together
aProsody = (aPhrase + aUp + aDn)

koct =0
;printk 0,ky
/*****************AMBIENT VOICE PROCESSIG*****************/
kmorf1= 7-(4*ky) ; the polarity is switched because GNP is a falling value

;0 1 2 3 4 5 6 7 8 9 10 11 12 
; a e i a o u e o i u a o a 

/*****************PROCESS VOCAL TIMBRAL PARAMATERS*****************/

kris =.003
kdur = .002
kdec = .007 


ktone = 1.25*ky
kRndLfoTim randomi 1,6,3

kFLfo lfo 1,kRndLfoTim
kFLfo = kFLfo + 2
kBaseFund = gkfund*ktone
kminfund = 60

kfund = kBaseFund ;+ kFLfo

kfund = (kminfund +kfund+aProsody); * aPs


/************************VOWGEN AREA*****************************/
 ;asig vowgen kfreq,  kmorf, koct, kris, kdur, kdec, imode
 aVox1 vowgen2 kfund, kmorf1, koct, kris, kdur, kdec,  3         
 aVox2 vowgen2 kfund, kmorf1, koct, kris, kdur, kdec,  4         
 aVox3 vowgen2 kfund, kmorf1, koct, kris, kdur, kdec,  5         

 aVox = (aVox1+aVox2+aVox3)/3 ;Keep the Avox Signal Useable

 /********************************************************************/
	
  aVox butterlp aVox, 3000

 asigl= aVox
 asigr= aVox

;aoutL, aoutR freeverb ainL, ainR, kRoomSize, kHFDamp[, iSRate[, iSkip]] 


aL,   aR freeverb asigl, asigr,  .01,   .1, sr 
  
  /* Post-Processing**/
  
  
  asigl= asigl*.15
  asigr= asigr*.15
  
  aoutL = asigl+aL 
  aoutR= asigr+aR

  aL1, aR1 pan2 aoutL, 1-ky,0
  aL2, aR2 pan2 aoutR, 1-ky,0
  
  aleft = aL1+aL2
  aright = aR1+aR2
  
  outs aleft, aright
   endin

/***************************************************************/

instr 2 ;UNEMPLOYMENT
 gkfund =148
 
/* IN ORDER TO SONIFY THE DATA MUST FIRST ANALYSE IT FOR HIGH AND LOW POINTS |AND ENTER HERE*/
/****************************************************************/

	;DATA PROCESSING
iDatHi = 15
iDatLo = 4.5

	iDatReadRate = p3
	iDatLen ftlen giUER   
	kDatRead line 0, iDatReadRate, iDatLen 	    
	kDatIn tablei kDatRead, giUER
	
	
	;**DATA SCALING**
	ky = (((1)*(kDatIn - iDatLo))/(iDatHi - iDatLo)); 0-1
	
	
	
	
	printk 0,ky
/****************************************************************/
 
/***************** CHOIR MODELLING *****************/
;0 1 2 3 4 5 6 7 8 9 10 11 12 
;a e i a o u e o i u a o a 

koct =0

/*****************AMBIENT VOICE PROCESSIG*****************/
kmorf1= 4+(2.25*ky) ; starts at 3(a) and moves signal up another 3 to reach 6(e)

;0 1 2 3 4 5 6 7 8 9 10 11 12 
; a e i a o u e o i u a o a 

/***************** PROCESS VOCAL TIMRAL PARAMATERS*****************/
kris =.003
kdur = .002
kdec = .007 

kRndLfoTim randomi 1,6,3

ktone = .25*ky

kFLfo lfo 1,kRndLfoTim
kFLfo = kFLfo + 2
kBaseFund = (gkfund)*ktone ;Keeps the Fundamental frequencies relative to one another!
kfund = kBaseFund + kFLfo

/***************** PROCESS VOCAL TIMRAL PARAMATERS*****************/


/************************VOWGEN AREA*****************************/
 ;asig vowgen kfreq,  kmorf, koct, kris, kdur, kdec, imode
 
 aVox1 vowgen2 60+kfund, kmorf1, koct, kris, kdur, kdec,  0         
 aVox2 vowgen2 60+kfund, kmorf1, koct, kris, kdur, kdec, 1         
 aVox3 vowgen2 60+kfund, kmorf1, koct, kris, kdur, kdec, 2         


 aVox =(aVox1+aVox2+aVox3)/3 ;Keep the Avox Signal Useable
 /***********************************************************************/
	
  aVox butterlp aVox, 3000

 asigl= aVox
 asigr= aVox

/********************************REVERB*********************************/
;aoutL, aoutR freeverb ainL, ainR, kRoomSize, kHFDamp[, iSRate[, iSkip]] 
aL,   aR freeverb asigl, asigr,  .01,   .1, sr 
  
  /* Post-Processing**/
  
 
  asigl= asigl*.1
  asigr= asigr*.1
  
  aoutL = asigl+aL 
  aoutR= asigr+aR

  aL1, aR1 pan2 aoutL, 1-ky,0
  aL2, aR2 pan2 aoutR, 1-ky,0
  
  aleft = aL1+aL2
  aright = aR1+aR2
  
  outs aleft, aright
 /**********************************************************************/
   
   endin

 /**********************************************************************/

instr 3 ;EMIGRATION
 
 ;GLOBAL VARIABLES
 gkfund =148

/* IN ORDER TO SONIFY THE DATA MUST FIRST ANALYSE IT FOR HIGH AND LOW POINTS |AND ENTER HERE*/
/*********************************************************************/

	;DATA PROCESSING
iDatHi = 87.1
iDatLo = 46.3

	iDatReadRate = p3
	iDatLen ftlen giEMI   
	kDatRead line 0, iDatReadRate, iDatLen 	    
	kDatIn tablei kDatRead, giEMI
	;**DATA SCALING**
	
	
	
	ky = ((1)*(kDatIn - iDatLo))/(iDatHi - iDatLo) ; 0-1
	
printk 0,ky
 /**********************************************************************/

 
/************************CHOIR MODELLING************************/
;0 1 2 3 4 5 6 7 8 9 10 11 12 
;a e i a o u e o i u a o a 

koct =0

/************************AMBIENT VOICE PROCESSIG*************************/ 
kmorf1= (1*ky) ; starts at 3(a) and moves signal up another 3 to reach 6(e)

;0 1 2 3 4 5 6 7 8 9 10 11 12 
; a e i a o u e o i u a o a 

/************************PROCESS VOCAL TIMRAL PARAMATERS************************/
kris =.003
kdur = .002
kdec = .007 

kRndLfoTim randomi 1,6,3

ktone = .125*ky

kFLfo lfo 1,kRndLfoTim
kFLfo = kFLfo + 2
kBAseFund = (gkfund)*ktone ;Keeps the Fundamental frequencies relative to one another!
kfund = kBAseFund + kFLfo
/************************ PROCESS VOCAL TIMRAL PARAMATERS************************/


/************************VOWGEN AREA************************/
 ;asig vowgen kfreq,  kmorf, koct, kris, kdur, kdec, imode
 
 aVox1 vowgen2 60+kfund, kmorf1, koct, kris, kdur, kdec,  0         
 aVox2 vowgen2 60+kfund, kmorf1, koct, kris, kdur, kdec, 1         
 aVox3 vowgen2 60+kfund, kmorf1, koct, kris, kdur, kdec, 2         


 aVox =(aVox1+aVox2+aVox3)/3 ;Keep the Avox Signal Useable
 /***********************************************************************/
	
  aVox butterlp aVox, 3000

 asigl= aVox
 asigr= aVox

;aoutL, aoutR freeverb ainL, ainR, kRoomSize, kHFDamp[, iSRate[, iSkip]] 
aL,   aR freeverb asigl, asigr,  .01,   .1, sr 
  
/************************ Post-Processing ************************/
  
 
  asigl= asigl*.1
  asigr= asigr*.1
  
  aoutL = asigl+aL 
  aoutR= asigr+aR

  aL1, aR1 pan2 aoutL, .5+(.5*ky),0
  aL2, aR2 pan2 aoutR, .5-+(.5*ky),0
  
  aleft = aL1+aL2
  aright = aR1+aR2
  
  outs aleft, aright
    
   endin

/************************************************/


</CsInstruments>
<CsScore>
; sine wave
f 1 0 4096 10 1
; sigmoid wave
f 2 0 1024 19 0.5 0.5 270 0.5


i1 0 30
i2 0 30
i3 0 30

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
