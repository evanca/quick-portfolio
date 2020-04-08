## Prototyoing_Model1_Vocal_Gesture 2015
**Prototyoing_Model1_Vocal_Gesture 2015**
```Csound
<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-+rtaudio
-iadc0 -odac0 -B512 -b128

; For Non-realtime ouput leave only the line below:
; -o fof.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>


sr = 44100
;kr = 4800
ksmps = 32 ;64  
nchnls = 2
0dbfs = 32767
 	 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;STEREO SPACE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 	
 	
 ;================================================
/* Explanation of Original Room Dimensions from Istvan Varga

		1= enable wall, 
		2= distance from lsitener, 
		3= randomisation of wall distance,
		4= Reflection Level,(-1 to 1)
		5= Para Eq Freq in HZ
		6= Para EQ level (1.0 = no filtering)
		7= Para EQ Q
		8= Para EQ Mode


	     ;1	;2  ;3   ;4     ;5    ;6    ;7  ;8
		1, 21.982, 0.05, 0.87, 4000.0, 0.6, 0.7, 2, /* ceil  */

itmp    ftgen   7, 0, 64, -2,                                           \
		/* depth1, depth2, max delay, IR length, idist, seed */ \
		1, 48, -1, 0.01, 0.25, 123,                          \
		1, 21.982, 0.05, 0.97, 4000.0, 0.6, 0.7, 2, /* ceil  */ \
		1,  6.753, 0.05, 0.97, 3500.0, 0.5, 0.7, 2, /* floor */ \
		1, 15.220, 0.05, 0.97, 5000.0, 0.8, 0.7, 2, /* front */ \
		1,  9.317, 0.05, 0.97, 5000.0, 0.8, 0.7, 2, /* back  */ \
		1, 17.545, 0.05, 0.97, 5000.0, 0.8, 0.7, 0, /* right */ \
		1, 12.156, 0.05, 0.97, 5000.0, 0.8, 0.7, 0  /* left  */

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;STEREO SPACE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 	
 	
 	
;;;;;;;;;;;;;;;;;;;;;;
;;;;VOCAL TIMBRES;;;;; 	
;;;;;;;;;;;;;;;;;;;;;;

;BASS                           
	giBssFrqA ftgen 5, 0, -5, -2, 600, 1040, 2250, 2450, 2750    ;A
	giBssFrqE ftgen 6, 0, -5, -2, 400, 1620, 2400, 2800, 3100    ;E
	giBssFrqI ftgen 7, 0, -5, -2, 250, 1750, 2600, 3050, 3340
	giBssFrqO ftgen 8, 0, -5, -2, 400,   750, 2400, 2600, 2900
	giBssFrqU ftgen 9, 0, -5, -2, 350,   600, 2400, 2675, 2950

 ; -5 declares the size of the table. 5places
 ; -2 Prevents Csound from normalising number			
			
	giBssAmpA ftgen 10, 0, -5, -2,   0,   -7,   -9,   -9, -20     ;A
	giBssAmpE ftgen 11, 0, -5, -2,   0, -12,  -9,  -12, -18     ;E
	giBssAmpI ftgen 12, 0, -5, -2,   0, -30, -16, -22, -28      ;I
	giBssAmpO ftgen 13, 0, -5, -2,   0, -11, -21, -20, -40    ;O
	giBssAmpU ftgen 14, 0, -5, -2,   0, -20, -32, -28, -36    ;U


	giBssBndA ftgen 15, 0, -5, -2,  60,  70,  110,  120,  130   ;A
	giBssBndE ftgen 16, 0, -5, -2,  40,  80,  100,  120,  120   ;E
	giBssBndI ftgen 17, 0, -5, -2,  60,  90,  100,  120,  120  ;I
	giBssBndO ftgen 18, 0, -5, -2,  40,  80,  100,  120,  120  ;O
	giBssBndU ftgen 19, 0, -5, -2,  40, 80,   100,  120,  120  ;U

;TENOR
	giTnrFrqA ftgen 20, 0, -5, -2,  650,  1080,  2650,  2900,  3250
	giTnrFrqE ftgen 21, 0, -5, -2,  400,  1700,  2600,  3200,  3580
	giTnrFrqI ftgen 22, 0, -5, -2,  290,  1870,  2800,  3250,  3540
	giTnrFrqO ftgen 23, 0, -5, -2,  400,    800,  2600,  2800,  3000
	giTnrFrqU ftgen 24, 0, -5, -2,  350,    600,  2700,  2900,  3300

	giTnrAmpA ftgen 25, 0, -5, -2,   0,   -6,   -7,   -8,   -22
	giTnrAmpE ftgen 26, 0, -5, -2,   0,  -14, -12, -14,  -20
	giTnrAmpI ftgen 27, 0, -5, -2,   0,  -15, -18, -20,  -30
	giTnrAmpO ftgen 28, 0, -5, -2,   0,  -10, -12, -12,  -26
	giTnrAmpU ftgen 29, 0, -5, -2,   0,  -20, -17, -14,  -26

	giTnrBndA ftgen 30, 0, -5, -2,  80,  90,  120,  130,  140
	giTnrBndE ftgen 31, 0, -5, -2,  70,  80,  100,  120,  120
	giTnrBndI ftgen 32, 0, -5, -2,   40,  90, 100, 120,  120
	giTnrBnDO ftgen 33, 0, -5, -2,   70,   80, 100, 130,  135
	giTnrBndU ftgen 34, 0, -5, -2,   40,   60, 100, 120,  120



;COUNTER TENOR
	giCnTnFA ftgen 35, 0, -5, -2,  660,  1120,  2750, 3000,  3350
	giCnTnFE ftgen 36, 0, -5, -2,  440,  1800,  2700, 3000,  3300
	giCnTnFI ftgen 37, 0, -5, -2,  270,  1850,  2900, 3350,  3590
	giCnTnFO ftgen 38, 0, -5, -2,  430,    820,  2700, 3000,  3300
	giCnTnFU ftgen 39, 0, -5, -2,  370,    630,  2750, 3000,  4950


	giCnTnAmpA ftgen 40, 0, -5, -2,   0,	 -6,  -23,  -24,  -38
	giCnTnAmpE ftgen 41, 0, -5, -2, -6,   -14, -24,  -10,  -20
	giCnTnAmpI ftgen 42, 0, -5, -2,   0,	-24, -24,  -36,  -36
	giCnTnAmpO ftgen 43, 0, -5, -2,   0,	-10, -26,  -22,  -34
	giCnTnAmpU ftgen 44, 0, -5, -2,   0,	-20, -23,  -30,   -34



	giCnTnBndA ftgen 45, 0, -5, -2, 80,	90,	120,	130,	140
	giCnTnBndE ftgen 46, 0, -5, -2, 70,	80,	100,	120,	120
	giCnTnBndI ftgen 47, 0, -5, -2, 40,	90,	100,	120,	120
	giCnTnBndO ftgen 48, 0, -5, -2, 40,	80,	100,	120,	120
	giCnTnBndU ftgen 49, 0, -5, -2, 40,	60,	100,	120,	120

;ALTO
	giAltFA ftgen 50, 0, -5, -2,  800,	1150,	2800,	3500,	4950
	giAltFE ftgen 51, 0, -5, -2, 400,	1600,	2700,	3300,	4950
	giAltFI ftgen 52, 0, -5, -2, 350,	1700,	2700,	3700,	4950
	giAltFO ftgen 53, 0, -5, -2, 450,	800,	2830,	3500,	4950
	giAltFU ftgen 54, 0, -5, -2, 325,	700,	2530,	3500,	4950


	giAltAmpA ftgen 55, 0, -5, -2, 0,	-4,	-20,	-36,	-60
	giAltAmpE ftgen 56, 0, -5, -2, 0,	-24,	-30,	-35,	-60
	giAltAmpI ftgen 57, 0, -5, -2, 0,	-20,	-30,	-36,	-60
	giAltAmpO ftgen 58, 0, -5, -2, 0,	-9,	-16,	-28,	-55
	giAltAmpU ftgen 59, 0, -5, -2, 0,	-12,	-30,	-40,	-64


	giABndA ftgen 60, 0, -5, -2, 80,	90,	120,	130,	140
	giABndE ftgen 61, 0, -5, -2, 60,	80,	120,	150,	200
	giABndI ftgen 62, 0, -5, -2, 50,	100,	120,	150,	200
	giABndO ftgen 63, 0, -5, -2, 70,	80,	100,	130,	135
	giABndU ftgen 64, 0, -5, -2, 50,	60,	170,	180,	200


;SOPRANO
	giSoFrqA ftgen 65, 0, -5, -2, 800,	1150,	2900,	3900,	4950
	giSoFrqE ftgen 66, 0, -5, -2, 350,	2000,	2800,	3600,	4950
	giSoFrqI ftgen 67, 0, -5, -2, 270,	2140,	2950,	3900,	4950
	giSoFrqO ftgen 68, 0, -5, -2, 450,	 800, 2830,	3800,	4950
	giSoFrqU ftgen 69, 0, -5, -2, 325,	 700, 2700,	3800,	4950

	giSoAmpA ftgen 70, 0, -5, -2,   0,	-6,	-32,	-20,	-50
	giSoAmpE ftgen 71, 0, -5, -2,   0,	-20,	-15,	-40,	-56
	giSoAmpI ftgen 72, 0, -5, -2,   0,	-12,	-26,	-26,	-44
	giSoAmpO ftgen 73, 0, -5, -2,   0,	-11,	-22,	-22,	-50
	giSoAmpU ftgen 74, 0, -5, -2,   0,	-16,	-35,	-40,	-60

	giSoBndA ftgen 75, 0, -5, -2,  80,	90,	120,	130,	140
	giSoBndE ftgen 76, 0, -5, -2,  60,	100,	120,	150,	200
	giSoBndI ftgen 77, 0, -5, -2,   60,	90,	100,	120,	120
	giSoBndO ftgen 78, 0, -5, -2,  40,	80,	100,	120,	120
	giSoBndU ftgen 79, 0, -5, -2,  50,	60,	170,	180,	200
 	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;DATA-SET STORAGE;;;;; 	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;DATA-SET INPUT	
							;Data	
		;giPX ftgen 0, 0, -18, -2,          0,0,92,80,42,36,49,43,33,47,110,48,52,23,52,140

;Don't forget to put in the Hi abnd Lo for the Data!


		giPX ftgen 0, 0, -18, -2,          0,0,0,3,2,3977,3435,546,597,647,794,565,517,486,526,610,663,1004,1303


 ; -5 declares the size of the table. 5places
 ; -2 Prevents Csound from normalising number			
 	
 	
 	
 	
 	
instr 1  ; Data Processing

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DATA PROCESSIG MODULE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/* IN ORDER TO SONIFY THE DATA MUST FIRST ANALYSE IT FOR HIGH AND LOW POINTS |AND ENTER HERE*/

giDatHi = 4000
giDatLo = 0


/* Vowel and Extent Options*/
	giVowelA = p6
	giVowelB = p7
	
	gkExMin	 = p8/100
	gkExMax	 = p9/100  
	
	gkExtent = gkExMin-gkExMax
	
	  
	  giVoxA init p11    ;Vocal Types take in from Score
	  giVoxB init p12		


/*_________________________________*/		    
    
    ;;;;;READ IN DATA FROM AN F-TABLE 
    
	giDatReadRate = p3
	
	iDatLen ftlen giPX           ;Takes the length of the data set for use in the data reading line generator. 
	gkDatRead line 0, giDatReadRate, iDatLen 
		                
	gkDatIn tablei gkDatRead,    giPX

	
	
;**************************************************************************************
	;SCALING FUNCTION FOR NON P-FIELD DATA (gkNonPD)
	;Scaling of incoming Data for Mode 1
	
gkDatIn line 0, p3, 4000

giDatHi  = 4000

giDatLo = 0


	gkDataInScaled = ((100)*(gkDatIn))/(giDatHi - giDatLo) ;Scales the data in the range 0-100



printk 0,gkDataInScaled

	if		(p10 == 1) then		; Selects the mapping mode
      	kx = gkDataInScaled ; scaled data represented in model by kx


     elseif 	(p10 == 2) then     
      	kx = gkDatIn ; scaled data represented in model by kx

	endif
	
;data outtake
	gkSpatData    = kx
	gkx 	            = kx

endin

instr 2  ; Vowel Determination Instrument

; data intake
	kx= gkx

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;VOWEL 1;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;
  	
  	  	
  	

if		(giVowelA == 1  &&  giVoxA == 1) then		;U

		
		
		;;U Bass FREQUENEY ;;
	
		kFrqA1 table 0, 9		
		kFrqA2 table 1, 9      
		kFrqA3 table 2, 9	       
		kFrqA4 table 3, 9	        
		kFrqA5 table 4, 9
			
		;;U Bass AMPLITUDE;;
		
		kAmpA1 table 0, 14
		kAmpA2 table 1, 14
		kAmpA3 table 2, 14
		kAmpA4 table 3, 14
		kAmpA5 table 4, 14


		;;U Bass BANDWIDTH ;;

		kBndA1 table 0, 19
		kBndA2 table 1, 19
		kBndA3 table 2, 19
		kBndA4 table 3, 19
		kBndA5 table 4, 19


	elseif (giVowelA == 1 && giVoxA == 2) then		;U

		
		
		;;U Ten FREQUENEY ;;
	
		kFrqA1 table 0, 24		
		kFrqA2 table 1, 24     
		kFrqA3 table 2, 24	       
		kFrqA4 table 3, 24	        
		kFrqA5 table 4, 24
			
		;;U Ten AMPLITUDE;;
		
		kAmpA1 table 0, 29
		kAmpA2 table 1, 29
		kAmpA3 table 2, 29
		kAmpA4 table 3, 29
		kAmpA5 table 4, 29


		;;U Ten BANDWIDTH ;;

		kBndA1 table 0, 34
		kBndA2 table 1, 34
		kBndA3 table 2, 34
		kBndA4 table 3, 34
		kBndA5 table 4, 34

   
   
	elseif	(giVowelA == 1 && giVoxA == 3) then		;U

		
		
		;;U CounTen FREQUENEY ;;
	
		kFrqA1 table 0, 39		
		kFrqA2 table 1, 39     
		kFrqA3 table 2, 39	       
		kFrqA4 table 3, 39	        
		kFrqA5 table 4, 39
			
		;;U CounTen AMPLITUDE;;
		
		kAmpA1 table 0, 44
		kAmpA2 table 1, 44
		kAmpA3 table 2, 44
		kAmpA4 table 3, 44
		kAmpA5 table 4, 44


		;;U CounTen BANDWIDTH ;;

		kBndA1 table 0, 49
		kBndA2 table 1, 49
		kBndA3 table 2, 49
		kBndA4 table 3, 49
		kBndA5 table 4, 49

   
	elseif (giVowelA == 1 && giVoxA == 4) then		;U

		
		
		;;U Alto FREQUENEY ;;
	
		kFrqA1 table 0, 54		
		kFrqA2 table 1, 54     
		kFrqA3 table 2, 54	       
		kFrqA4 table 3, 54	        
		kFrqA5 table 4, 54
			
		;;U Alto AMPLITUDE;;
		
		kAmpA1 table 0, 59
		kAmpA2 table 1, 59
		kAmpA3 table 2, 59
		kAmpA4 table 3, 59
		kAmpA5 table 4, 59


		;;U Alto BANDWIDTH ;;

		kBndA1 table 0, 64
		kBndA2 table 1, 64
		kBndA3 table 2, 64
		kBndA4 table 3, 64
		kBndA5 table 4, 64

   
   
	   elseif (giVowelA == 1 && giVoxA == 5) then		;U

		
		
		;;U Soprano FREQUENEY ;;
	
		kFrqA1 table 0, 69		
		kFrqA2 table 1, 69     
		kFrqA3 table 2, 69	       
		kFrqA4 table 3, 69	        
		kFrqA5 table 4, 69
			
		;;U Soprano AMPLITUDE;;
		
		kAmpA1 table 0, 74
		kAmpA2 table 1, 74
		kAmpA3 table 2, 74
		kAmpA4 table 3, 74
		kAmpA5 table 4, 74


		;;U Soprano BANDWIDTH ;;

		kBndA1 table 0, 79
		kBndA2 table 1, 79
		kBndA3 table 2, 79
		kBndA4 table 3, 79
		kBndA5 table 4, 79
   
           	     

elseif		(giVowelA == 2  &&  giVoxA == 1) then		;A

		
		
		;;A Bass FREQUENEY ;;
	
		kFrqA1 table 0, 5		
		kFrqA2 table 1, 5      
		kFrqA3 table 2, 5	       
		kFrqA4 table 3, 5	        
		kFrqA5 table 4, 5
			
		;;A Bass AMPLITUDE;;
		
		kAmpA1 table 0, 10
		kAmpA2 table 1, 10
		kAmpA3 table 2, 10
		kAmpA4 table 3, 10
		kAmpA5 table 4, 10


		;;A Bass BANDWIDTH ;;

		kBndA1 table 0, 15
		kBndA2 table 1, 15
		kBndA3 table 2, 15
		kBndA4 table 3, 15
		kBndA5 table 4, 15


elseif		(giVowelA == 2 && giVoxA == 2) then		;A

		
		
		;;A Ten FREQUENEY ;;
	
		kFrqA1 table 0, 20	
		kFrqA2 table 1, 20     
		kFrqA3 table 2, 20	       
		kFrqA4 table 3, 20        
		kFrqA5 table 4, 20
			
		;;A Ten AMPLITUDE;;
		
		kAmpA1 table 0, 25
		kAmpA2 table 1, 25
		kAmpA3 table 2, 25
		kAmpA4 table 3, 25
		kAmpA5 table 4, 25


		;;A Ten BANDWIDTH ;;

		kBndA1 table 0, 30
		kBndA2 table 1, 30
		kBndA3 table 2, 30
		kBndA4 table 3, 30
		kBndA5 table 4, 30

   
   
elseif		(giVowelA == 2 && giVoxA == 3) then		;A

		
		
		;;A CounTen FREQUENEY ;;
	
		kFrqA1 table 0, 35	
		kFrqA2 table 1, 35     
		kFrqA3 table 2, 35	       
		kFrqA4 table 3, 35	        
		kFrqA5 table 4, 35
			
		;;A CounTen AMPLITUDE;;
		
		kAmpA1 table 0, 40
		kAmpA2 table 1, 40
		kAmpA3 table 2, 40
		kAmpA4 table 3, 40
		kAmpA5 table 4, 40


		;;A CounTen BANDWIDTH ;;

		kBndA1 table 0, 45
		kBndA2 table 1, 45
		kBndA3 table 2, 45
		kBndA4 table 3, 45
		kBndA5 table 4, 45

   
   elseif		(giVowelA == 2 && giVoxA == 4) then		

		
		
		;;A Alto FREQUENEY ;;
	
		kFrqA1 table 0, 50	
		kFrqA2 table 1, 50    
		kFrqA3 table 2, 50	       
		kFrqA4 table 3, 50	        
		kFrqA5 table 4, 50
			
		;;A Alto AMPLITUDE;;
		
		kAmpA1 table 0, 55
		kAmpA2 table 1, 55
		kAmpA3 table 2, 55
		kAmpA4 table 3, 55
		kAmpA5 table 4, 55


		;;A Alto BANDWIDTH ;;

		kBndA1 table 0, 60
		kBndA2 table 1, 60
		kBndA3 table 2, 60
		kBndA4 table 3, 60
		kBndA5 table 4, 60

   
   
   elseif		(giVowelA == 2 && giVoxA == 5) then		;A

		
		
		;;A Soprano FREQUENEY ;;
	
		kFrqA1 table 0, 65	
		kFrqA2 table 1, 65   
		kFrqA3 table 2, 65	       
		kFrqA4 table 3, 65	        
		kFrqA5 table 4, 65
			
		;;A Soprano AMPLITUDE;;
		
		kAmpA1 table 0, 70
		kAmpA2 table 1, 70
		kAmpA3 table 2, 70
		kAmpA4 table 3, 70
		kAmpA5 table 4, 70


		;;A Soprano BANDWIDTH ;;

		kBndA1 table 0, 75
		kBndA2 table 1, 75
		kBndA3 table 2, 75
		kBndA4 table 3, 75
		kBndA5 table 4, 75
   
;;;FROM HERE 

elseif		(giVowelA == 3  &&  giVoxA == 1) then		;O

		
		
		;;O Bass FREQUENEY ;;
	
		kFrqA1 table 0, 8		
		kFrqA2 table 1, 8      
		kFrqA3 table 2, 8	       
		kFrqA4 table 3, 8	        
		kFrqA5 table 4, 8
			
		;;O Bass AMPLITUDE;;
		
		kAmpA1 table 0, 13
		kAmpA2 table 1, 13
		kAmpA3 table 2, 13
		kAmpA4 table 3, 13
		kAmpA5 table 4, 13


		;;O Bass BANDWIDTH ;;

		kBndA1 table 0, 18
		kBndA2 table 1, 18
		kBndA3 table 2, 18
		kBndA4 table 3, 18
		kBndA5 table 4, 18


	elseif (giVowelA == 3 && giVoxA == 2) then		;O

		
		
		;;O Ten FREQUENEY ;;
	
		kFrqA1 table 0, 23	
		kFrqA2 table 1, 23     
		kFrqA3 table 2, 23	       
		kFrqA4 table 3, 23	        
		kFrqA5 table 4, 23
			
		;;O Ten AMPLITUDE;;
		
		kAmpA1 table 0, 28
		kAmpA2 table 1, 28
		kAmpA3 table 2, 28
		kAmpA4 table 3, 28
		kAmpA5 table 4, 28


		;;O Ten BANDWIDTH ;;

		kBndA1 table 0, 33
		kBndA2 table 1, 33
		kBndA3 table 2, 33
		kBndA4 table 3, 33
		kBndA5 table 4, 33

   
   
	elseif	(giVowelA == 3 && giVoxA == 3) then		;O

		
		
		;;O CounTen FREQUENEY ;;
	
		kFrqA1 table 0, 38	
		kFrqA2 table 1, 38     
		kFrqA3 table 2, 38	       
		kFrqA4 table 3, 38	        
		kFrqA5 table 4, 38
			
		;;O CounTen AMPLITUDE;;
		
		kAmpA1 table 0, 43
		kAmpA2 table 1, 43
		kAmpA3 table 2, 43
		kAmpA4 table 3, 43
		kAmpA5 table 4, 43


		;;O CounTen BANDWIDTH ;;

		kBndA1 table 0, 48
		kBndA2 table 1, 48
		kBndA3 table 2, 48
		kBndA4 table 3, 48
		kBndA5 table 4, 48

   
	elseif (giVowelA == 3 && giVoxA == 4) then		;O

		
		;;O Alto FREQUENEY ;;
	
		kFrqA1 table 0, 53	
		kFrqA2 table 1, 53    
		kFrqA3 table 2, 53	       
		kFrqA4 table 3, 53	        
		kFrqA5 table 4, 53
			
		;;O Alto AMPLITUDE;;
		
		kAmpA1 table 0, 58
		kAmpA2 table 1, 58
		kAmpA3 table 2, 58
		kAmpA4 table 3, 58
		kAmpA5 table 4, 58


		;;O Alto BANDWIDTH ;;

		kBndA1 table 0, 63
		kBndA2 table 1, 63
		kBndA3 table 2, 63
		kBndA4 table 3, 63
		kBndA5 table 4, 63

   
   
	   elseif (giVowelA == 3 && giVoxA == 5) then		;O

		
		
		;;O Soprano FREQUENEY ;;
	
		kFrqA1 table 0, 68	
		kFrqA2 table 1, 68    
		kFrqA3 table 2, 68	       
		kFrqA4 table 3, 68	        
		kFrqA5 table 4, 68
			
		;;O Soprano AMPLITUDE;;
		
		kAmpA1 table 0, 73
		kAmpA2 table 1, 73
		kAmpA3 table 2, 73
		kAmpA4 table 3, 73
		kAmpA5 table 4, 73


		;;O Soprano BANDWIDTH ;;

		kBndA1 table 0, 78
		kBndA2 table 1, 78
		kBndA3 table 2, 78
		kBndA4 table 3, 78
		kBndA5 table 4, 78
   
           	     

elseif		(giVowelA == 4  &&  giVoxA == 1) then		;I

		
		
		;;I Bass FREQUENEY ;;
	
		kFrqA1 table 0, 7		
		kFrqA2 table 1, 7      
		kFrqA3 table 2, 7	       
		kFrqA4 table 3, 7	        
		kFrqA5 table 4, 7
			
		;;I Bass AMPLITUDE;;
		
		kAmpA1 table 0, 12
		kAmpA2 table 1, 12
		kAmpA3 table 2, 12
		kAmpA4 table 3, 12
		kAmpA5 table 4, 12


		;;I Bass BANDWIDTH ;;

		kBndA1 table 0, 17
		kBndA2 table 1, 17
		kBndA3 table 2, 17
		kBndA4 table 3, 17
		kBndA5 table 4, 17


elseif		(giVowelA == 4 && giVoxA == 2) then		;I

		
		
		;;I Ten FREQUENEY ;;
	
		kFrqA1 table 0, 22	
		kFrqA2 table 1, 22     
		kFrqA3 table 2, 22	       
		kFrqA4 table 3, 22        
		kFrqA5 table 4, 22
			
		;;I Ten AMPLITUDE;;
		
		kAmpA1 table 0, 27
		kAmpA2 table 1, 27
		kAmpA3 table 2, 27
		kAmpA4 table 3, 27
		kAmpA5 table 4, 27


		;;I Ten BANDWIDTH ;;

		kBndA1 table 0, 32
		kBndA2 table 1, 32
		kBndA3 table 2, 32
		kBndA4 table 3, 32
		kBndA5 table 4, 32

   
   
elseif		(giVowelA == 4 && giVoxA == 3) then		;I

		
		
		;;I CounTen FREQUENEY ;;
	
		kFrqA1 table 0, 37
		kFrqA2 table 1, 37     
		kFrqA3 table 2, 37	       
		kFrqA4 table 3, 37	        
		kFrqA5 table 4, 37
			
		;;I CounTen AMPLITUDE;;
		
		kAmpA1 table 0, 42
		kAmpA2 table 1, 42
		kAmpA3 table 2, 42
		kAmpA4 table 3, 42
		kAmpA5 table 4, 42


		;;I CounTen BANDWIDTH ;;

		kBndA1 table 0, 47
		kBndA2 table 1, 47
		kBndA3 table 2, 47
		kBndA4 table 3, 47
		kBndA5 table 4, 47

   
   elseif		(giVowelA == 4 && giVoxA == 4) then		

		
		
		;;I Alto FREQUENEY ;;
	
		kFrqA1 table 0, 52
		kFrqA2 table 1, 52    
		kFrqA3 table 2, 52	       
		kFrqA4 table 3, 52	        
		kFrqA5 table 4, 52
			
		;;I Alto AMPLITUDE;;
		
		kAmpA1 table 0, 57
		kAmpA2 table 1, 57
		kAmpA3 table 2, 57
		kAmpA4 table 3, 57
		kAmpA5 table 4, 57


		;;I Alto BANDWIDTH ;;

		kBndA1 table 0, 62
		kBndA2 table 1, 62
		kBndA3 table 2, 62
		kBndA4 table 3, 62
		kBndA5 table 4, 62

   
   
   elseif		(giVowelA == 4 && giVoxA == 5) then		;I

		
		
		;;I Soprano FREQUENEY ;;
	
		kFrqA1 table 0, 67
		kFrqA2 table 1, 67   
		kFrqA3 table 2, 67	       
		kFrqA4 table 3, 67	        
		kFrqA5 table 4, 67
			
		;;I Soprano AMPLITUDE;;
		
		kAmpA1 table 0, 72
		kAmpA2 table 1, 72
		kAmpA3 table 2, 72
		kAmpA4 table 3, 72
		kAmpA5 table 4, 72


		;;I Soprano BANDWIDTH ;;

		kBndA1 table 0, 77
		kBndA2 table 1, 77
		kBndA3 table 2, 77
		kBndA4 table 3, 77
		kBndA5 table 4, 77
   




;;FROM HERE YO!

elseif		(giVowelA == 5  &&  giVoxA == 1) then		;E

		
		
		;;E Bass FREQUENEY ;;
	
		kFrqA1 table 0, 6		
		kFrqA2 table 1, 6      
		kFrqA3 table 2, 6	       
		kFrqA4 table 3, 6	        
		kFrqA5 table 4, 6
			
		;;E Bass AMPLITUDE;;
		
		kAmpA1 table 0, 11
		kAmpA2 table 1, 11
		kAmpA3 table 2, 11
		kAmpA4 table 3, 11
		kAmpA5 table 4, 11


		;;E Bass BANDWIDTH ;;

		kBndA1 table 0, 16
		kBndA2 table 1, 16
		kBndA3 table 2, 16
		kBndA4 table 3, 16
		kBndA5 table 4, 16


elseif		(giVowelA == 5 && giVoxA == 2) then		;E

		
		
		;;E Ten FREQUENEY ;;
	
		kFrqA1 table 0, 21
		kFrqA2 table 1, 21     
		kFrqA3 table 2, 21	       
		kFrqA4 table 3, 21        
		kFrqA5 table 4, 21
			
		;;E Ten AMPLITUDE;;
		
		kAmpA1 table 0, 26
		kAmpA2 table 1, 26
		kAmpA3 table 2, 26
		kAmpA4 table 3, 26
		kAmpA5 table 4, 26


		;;E Ten BANDWIDTH ;;

		kBndA1 table 0, 31
		kBndA2 table 1, 31
		kBndA3 table 2, 31
		kBndA4 table 3, 31
		kBndA5 table 4, 31

   
   
elseif		(giVowelA == 5 && giVoxA == 3) then		;E

		
		
		;;E CounTen FREQUENEY ;;
	
		kFrqA1 table 0, 36
		kFrqA2 table 1, 36     
		kFrqA3 table 2, 36	       
		kFrqA4 table 3, 36	        
		kFrqA5 table 4, 36
			
		;;E CounTen AMPLITUDE;;
		
		kAmpA1 table 0, 41
		kAmpA2 table 1, 41
		kAmpA3 table 2, 41
		kAmpA4 table 3, 41
		kAmpA5 table 4, 41


		;;E CounTen BANDWIDTH ;;

		kBndA1 table 0, 46
		kBndA2 table 1, 46
		kBndA3 table 2, 46
		kBndA4 table 3, 46
		kBndA5 table 4, 46

   
   elseif		(giVowelA == 5 && giVoxA == 4) then		

		
		
		;;E Alto FREQUENEY ;;
	
		kFrqA1 table 0, 51
		kFrqA2 table 1, 51    
		kFrqA3 table 2, 51	       
		kFrqA4 table 3, 51	        
		kFrqA5 table 4, 51
			
		;;E Alto AMPLITUDE;;
		
		kAmpA1 table 0, 56
		kAmpA2 table 1, 56
		kAmpA3 table 2, 56
		kAmpA4 table 3, 56
		kAmpA5 table 4, 56


		;;E Alto BANDWIDTH ;;

		kBndA1 table 0, 61
		kBndA2 table 1, 61
		kBndA3 table 2, 61
		kBndA4 table 3, 61
		kBndA5 table 4, 61
   
   
   elseif		(giVowelA == 5 && giVoxA == 5) then		;E

		
		
		;;E Soprano FREQUENEY ;;
	
		kFrqA1 table 0, 66
		kFrqA2 table 1, 66   
		kFrqA3 table 2, 66	       
		kFrqA4 table 3, 66	        
		kFrqA5 table 4, 66
			
		;;E Soprano AMPLITUDE;;
		
		kAmpA1 table 0, 71
		kAmpA2 table 1, 71
		kAmpA3 table 2, 71
		kAmpA4 table 3, 71
		kAmpA5 table 4, 71
		

		;;E Soprano BANDWIDTH ;;

		kBndA1 table 0, 76
		kBndA2 table 1, 76
		kBndA3 table 2, 76
		kBndA4 table 3, 76
		kBndA5 table 4, 76
   
endif
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;VOWEL 2;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;
if		(giVowelB == 1  &&  giVoxB == 1) then		;U

		
		
		;;U Bass FREQUENEY ;;
	
		kFrqB1 table 0, 9		
		kFrqB2 table 1, 9      
		kFrqB3 table 2, 9	       
		kFrqB4 table 3, 9	        
		kFrqB5 table 4, 9
			
		;;U Bass AMPLITUDE;;
		
		kAmpB1 table 0, 14
		kAmpB2 table 1, 14
		kAmpB3 table 2, 14
		kAmpB4 table 3, 14
		kAmpB5 table 4, 14


		;;U Bass BANDWIDTH ;;

		kBndB1 table 0, 19
		kBndB2 table 1, 19
		kBndB3 table 2, 19
		kBndB4 table 3, 19
		kBndB5 table 4, 19


	elseif (giVowelB == 1 && giVoxB == 2) then		;U

		
		
		;;U Ten FREQUENEY ;;
	
		kFrqB1 table 0, 24		
		kFrqB2 table 1, 24     
		kFrqB3 table 2, 24	       
		kFrqB4 table 3, 24	        
		kFrqB5 table 4, 24
			
		;;U Ten AMPLITUDE;;
		
		kAmpB1 table 0, 29
		kAmpB2 table 1, 29
		kAmpB3 table 2, 29
		kAmpB4 table 3, 29
		kAmpB5 table 4, 29


		;;U Ten BANDWIDTH ;;

		kBndB1 table 0, 34
		kBndB2 table 1, 34
		kBndB3 table 2, 34
		kBndB4 table 3, 34
		kBndB5 table 4, 34

   
   
	elseif	(giVowelB == 1 && giVoxB == 3) then		;U

		
		
		;;U CounTen FREQUENEY ;;
	
		kFrqB1 table 0, 39		
		kFrqB2 table 1, 39     
		kFrqB3 table 2, 39	       
		kFrqB4 table 3, 39	        
		kFrqB5 table 4, 39
			
		;;U CounTen AMPLITUDE;;
		
		kAmpB1 table 0, 44
		kAmpB2 table 1, 44
		kAmpB3 table 2, 44
		kAmpB4 table 3, 44
		kAmpB5 table 4, 44


		;;U CounTen BANDWIDTH ;;

		kBndB1 table 0, 49
		kBndB2 table 1, 49
		kBndB3 table 2, 49
		kBndB4 table 3, 49
		kBndB5 table 4, 49

   
	elseif (giVowelB == 1 && giVoxB == 4) then		;U

		
		
		;;U Alto FREQUENEY ;;
	
		kFrqB1 table 0, 54		
		kFrqB2 table 1, 54     
		kFrqB3 table 2, 54	       
		kFrqB4 table 3, 54	        
		kFrqB5 table 4, 54
			
		;;U Alto AMPLITUDE;;
		
		kAmpB1 table 0, 59
		kAmpB2 table 1, 59
		kAmpB3 table 2, 59
		kAmpB4 table 3, 59
		kAmpB5 table 4, 59


		;;U Alto BANDWIDTH ;;

		kBndB1 table 0, 64
		kBndB2 table 1, 64
		kBndB3 table 2, 64
		kBndB4 table 3, 64
		kBndB5 table 4, 64

   
   
	   elseif (giVowelB == 1 && giVoxB == 5) then		;U

		
		
		;;U Soprano FREQUENEY ;;
	
		kFrqB1 table 0, 69		
		kFrqB2 table 1, 69     
		kFrqB3 table 2, 69	       
		kFrqB4 table 3, 69	        
		kFrqB5 table 4, 69
			
		;;U Soprano AMPLITUDE;;
		
		kAmpB1 table 0, 74
		kAmpB2 table 1, 74
		kAmpB3 table 2, 74
		kAmpB4 table 3, 74
		kAmpB5 table 4, 74


		;;U Soprano BANDWIDTH ;;

		kBndB1 table 0, 79
		kBndB2 table 1, 79
		kBndB3 table 2, 79
		kBndB4 table 3, 79
		kBndB5 table 4, 79
   
           	     

elseif		(giVowelB == 2  &&  giVoxB == 1) then		;A

		
		
		;;A Bass FREQUENEY ;;
	
		kFrqB1 table 0, 5		
		kFrqB2 table 1, 5      
		kFrqB3 table 2, 5	       
		kFrqB4 table 3, 5	        
		kFrqB5 table 4, 5
			
		;;A Bass AMPLITUDE;;
		
		kAmpB1 table 0, 10
		kAmpB2 table 1, 10
		kAmpB3 table 2, 10
		kAmpB4 table 3, 10
		kAmpB5 table 4, 10


		;;A Bass BANDWIDTH ;;

		kBndB1 table 0, 15
		kBndB2 table 1, 15
		kBndB3 table 2, 15
		kBndB4 table 3, 15
		kBndB5 table 4, 15


elseif		(giVowelB == 2 && giVoxB == 2) then		;A

		
		
		;;A Ten FREQUENEY ;;
	
		kFrqB1 table 0, 20	
		kFrqB2 table 1, 20     
		kFrqB3 table 2, 20	       
		kFrqB4 table 3, 20        
		kFrqB5 table 4, 20
			
		;;A Ten AMPLITUDE;;
		
		kAmpB1 table 0, 25
		kAmpB2 table 1, 25
		kAmpB3 table 2, 25
		kAmpB4 table 3, 25
		kAmpB5 table 4, 25


		;;A Ten BANDWIDTH ;;

		kBndB1 table 0, 30
		kBndB2 table 1, 30
		kBndB3 table 2, 30
		kBndB4 table 3, 30
		kBndB5 table 4, 30

   
   
elseif		(giVowelB == 2 && giVoxB == 3) then		;A

		
		
		;;A CounTen FREQUENEY ;;
	
		kFrqB1 table 0, 35	
		kFrqB2 table 1, 35     
		kFrqB3 table 2, 35	       
		kFrqB4 table 3, 35	        
		kFrqB5 table 4, 35
			
		;;A CounTen AMPLITUDE;;
		
		kAmpB1 table 0, 40
		kAmpB2 table 1, 40
		kAmpB3 table 2, 40
		kAmpB4 table 3, 40
		kAmpB5 table 4, 40


		;;A CounTen BANDWIDTH ;;

		kBndB1 table 0, 45
		kBndB2 table 1, 45
		kBndB3 table 2, 45
		kBndB4 table 3, 45
		kBndB5 table 4, 45

   
   elseif		(giVowelB == 2 && giVoxB == 4) then		

		
		
		;;A Alto FREQUENEY ;;
	
		kFrqB1 table 0, 50	
		kFrqB2 table 1, 50    
		kFrqB3 table 2, 50	       
		kFrqB4 table 3, 50	        
		kFrqB5 table 4, 50
			
		;;A Alto AMPLITUDE;;
		
		kAmpB1 table 0, 55
		kAmpB2 table 1, 55
		kAmpB3 table 2, 55
		kAmpB4 table 3, 55
		kAmpB5 table 4, 55


		;;A Alto BANDWIDTH ;;

		kBndB1 table 0, 60
		kBndB2 table 1, 60
		kBndB3 table 2, 60
		kBndB4 table 3, 60
		kBndB5 table 4, 60

   
   
   elseif		(giVowelB == 2 && giVoxB == 5) then		;A

		
		
		;;A Soprano FREQUENEY ;;
	
		kFrqB1 table 0, 65	
		kFrqB2 table 1, 65   
		kFrqB3 table 2, 65	       
		kFrqB4 table 3, 65	        
		kFrqB5 table 4, 65
			
		;;A Soprano AMPLITUDE;;
		
		kAmpB1 table 0, 70
		kAmpB2 table 1, 70
		kAmpB3 table 2, 70
		kAmpB4 table 3, 70
		kAmpB5 table 4, 70


		;;A Soprano BANDWIDTH ;;

		kBndB1 table 0, 75
		kBndB2 table 1, 75
		kBndB3 table 2, 75
		kBndB4 table 3, 75
		kBndB5 table 4, 75
   
;;;FROM HERE 

elseif		(giVowelB == 3  &&  giVoxB == 1) then		;O

		
		
		;;O Bass FREQUENEY ;;
	
		kFrqB1 table 0, 8		
		kFrqB2 table 1, 8      
		kFrqB3 table 2, 8	       
		kFrqB4 table 3, 8	        
		kFrqB5 table 4, 8
			
		;;O Bass AMPLITUDE;;
		
		kAmpB1 table 0, 13
		kAmpB2 table 1, 13
		kAmpB3 table 2, 13
		kAmpB4 table 3, 13
		kAmpB5 table 4, 13


		;;O Bass BANDWIDTH ;;

		kBndB1 table 0, 18
		kBndB2 table 1, 18
		kBndB3 table 2, 18
		kBndB4 table 3, 18
		kBndB5 table 4, 18


	elseif (giVowelB == 3 && giVoxB == 2) then		;O

		
		
		;;O Ten FREQUENEY ;;
	
		kFrqB1 table 0, 23	
		kFrqB2 table 1, 23     
		kFrqB3 table 2, 23	       
		kFrqB4 table 3, 23	        
		kFrqB5 table 4, 23
			
		;;O Ten AMPLITUDE;;
		
		kAmpB1 table 0, 28
		kAmpB2 table 1, 28
		kAmpB3 table 2, 28
		kAmpB4 table 3, 28
		kAmpB5 table 4, 28


		;;O Ten BANDWIDTH ;;

		kBndB1 table 0, 33
		kBndB2 table 1, 33
		kBndB3 table 2, 33
		kBndB4 table 3, 33
		kBndB5 table 4, 33

   
   
	elseif	(giVowelB == 3 && giVoxB == 3) then		;O

		
		
		;;O CounTen FREQUENEY ;;
	
		kFrqB1 table 0, 38	
		kFrqB2 table 1, 38     
		kFrqB3 table 2, 38	       
		kFrqB4 table 3, 38	        
		kFrqB5 table 4, 38
			
		;;O CounTen AMPLITUDE;;
		
		kAmpB1 table 0, 43
		kAmpB2 table 1, 43
		kAmpB3 table 2, 43
		kAmpB4 table 3, 43
		kAmpB5 table 4, 43


		;;O CounTen BANDWIDTH ;;

		kBndB1 table 0, 48
		kBndB2 table 1, 48
		kBndB3 table 2, 48
		kBndB4 table 3, 48
		kBndB5 table 4, 48

   
	elseif (giVowelB == 3 && giVoxB == 4) then		;O

		
		;;O Alto FREQUENEY ;;
	
		kFrqB1 table 0, 53	
		kFrqB2 table 1, 53    
		kFrqB3 table 2, 53	       
		kFrqB4 table 3, 53	        
		kFrqB5 table 4, 53
			
		;;O Alto AMPLITUDE;;
		
		kAmpB1 table 0, 58
		kAmpB2 table 1, 58
		kAmpB3 table 2, 58
		kAmpB4 table 3, 58
		kAmpB5 table 4, 58


		;;O Alto BANDWIDTH ;;

		kBndB1 table 0, 63
		kBndB2 table 1, 63
		kBndB3 table 2, 63
		kBndB4 table 3, 63
		kBndB5 table 4, 63

   
   
	   elseif (giVowelB == 3 && giVoxB == 5) then		;O

		
		
		;;O Soprano FREQUENEY ;;
	
		kFrqB1 table 0, 68	
		kFrqB2 table 1, 68    
		kFrqB3 table 2, 68	       
		kFrqB4 table 3, 68	        
		kFrqB5 table 4, 68
			
		;;O Soprano AMPLITUDE;;
		
		kAmpB1 table 0, 73
		kAmpB2 table 1, 73
		kAmpB3 table 2, 73
		kAmpB4 table 3, 73
		kAmpB5 table 4, 73


		;;O Soprano BANDWIDTH ;;

		kBndB1 table 0, 78
		kBndB2 table 1, 78
		kBndB3 table 2, 78
		kBndB4 table 3, 78
		kBndB5 table 4, 78
   
           	     

elseif		(giVowelB == 4  &&  giVoxB == 1) then		;I

		
		
		;;I Bass FREQUENEY ;;
	
		kFrqB1 table 0, 7		
		kFrqB2 table 1, 7      
		kFrqB3 table 2, 7	       
		kFrqB4 table 3, 7	        
		kFrqB5 table 4, 7
			
		;;I Bass AMPLITUDE;;
		
		kAmpB1 table 0, 12
		kAmpB2 table 1, 12
		kAmpB3 table 2, 12
		kAmpB4 table 3, 12
		kAmpB5 table 4, 12


		;;I Bass BANDWIDTH ;;

		kBndB1 table 0, 17
		kBndB2 table 1, 17
		kBndB3 table 2, 17
		kBndB4 table 3, 17
		kBndB5 table 4, 17


elseif		(giVowelB == 4 && giVoxB == 2) then		;I

		
		
		;;I Ten FREQUENEY ;;
	
		kFrqB1 table 0, 22	
		kFrqB2 table 1, 22     
		kFrqB3 table 2, 22	       
		kFrqB4 table 3, 22        
		kFrqB5 table 4, 22
			
		;;I Ten AMPLITUDE;;
		
		kAmpB1 table 0, 27
		kAmpB2 table 1, 27
		kAmpB3 table 2, 27
		kAmpB4 table 3, 27
		kAmpB5 table 4, 27


		;;I Ten BANDWIDTH ;;

		kBndB1 table 0, 32
		kBndB2 table 1, 32
		kBndB3 table 2, 32
		kBndB4 table 3, 32
		kBndB5 table 4, 32

   
   
elseif		(giVowelB == 4 && giVoxB == 3) then		;I

		
		
		;;I CounTen FREQUENEY ;;
	
		kFrqB1 table 0, 37
		kFrqB2 table 1, 37     
		kFrqB3 table 2, 37	       
		kFrqB4 table 3, 37	        
		kFrqB5 table 4, 37
			
		;;I CounTen AMPLITUDE;;
		
		kAmpB1 table 0, 42
		kAmpB2 table 1, 42
		kAmpB3 table 2, 42
		kAmpB4 table 3, 42
		kAmpB5 table 4, 42


		;;I CounTen BANDWIDTH ;;

		kBndB1 table 0, 47
		kBndB2 table 1, 47
		kBndB3 table 2, 47
		kBndB4 table 3, 47
		kBndB5 table 4, 47

   
   elseif		(giVowelB == 4 && giVoxB == 4) then		

		
		
		;;I Alto FREQUENEY ;;
	
		kFrqB1 table 0, 52
		kFrqB2 table 1, 52    
		kFrqB3 table 2, 52	       
		kFrqB4 table 3, 52	        
		kFrqB5 table 4, 52
			
		;;I Alto AMPLITUDE;;
		
		kAmpB1 table 0, 57
		kAmpB2 table 1, 57
		kAmpB3 table 2, 57
		kAmpB4 table 3, 57
		kAmpB5 table 4, 57


		;;I Alto BANDWIDTH ;;

		kBndB1 table 0, 62
		kBndB2 table 1, 62
		kBndB3 table 2, 62
		kBndB4 table 3, 62
		kBndB5 table 4, 62

   
   
   elseif		(giVowelB == 4 && giVoxB == 5) then		;I

		
		
		;;I Soprano FREQUENEY ;;
	
		kFrqB1 table 0, 67
		kFrqB2 table 1, 67   
		kFrqB3 table 2, 67	       
		kFrqB4 table 3, 67	        
		kFrqB5 table 4, 67
			
		;;I Soprano AMPLITUDE;;
		
		kAmpB1 table 0, 72
		kAmpB2 table 1, 72
		kAmpB3 table 2, 72
		kAmpB4 table 3, 72
		kAmpB5 table 4, 72


		;;I Soprano BANDWIDTH ;;

		kBndB1 table 0, 77
		kBndB2 table 1, 77
		kBndB3 table 2, 77
		kBndB4 table 3, 77
		kBndB5 table 4, 77
   



elseif		(giVowelB == 5  &&  giVoxB == 1) then		;E

		
		
		;;E Bass FREQUENEY ;;
	
		kFrqB1 table 0, 6		
		kFrqB2 table 1, 6      
		kFrqB3 table 2, 6	       
		kFrqB4 table 3, 6	        
		kFrqB5 table 4, 6
			
		;;E Bass AMPLITUDE;;
		
		kAmpB1 table 0, 11
		kAmpB2 table 1, 11
		kAmpB3 table 2, 11
		kAmpB4 table 3, 11
		kAmpB5 table 4, 11


		;;E Bass BANDWIDTH ;;

		kBndB1 table 0, 16
		kBndB2 table 1, 16
		kBndB3 table 2, 16
		kBndB4 table 3, 16
		kBndB5 table 4, 16


elseif		(giVowelB == 5 && giVoxB == 2) then		;E

		
		
		;;E Ten FREQUENEY ;;
	
		kFrqB1 table 0, 21
		kFrqB2 table 1, 21     
		kFrqB3 table 2, 21	       
		kFrqB4 table 3, 21        
		kFrqB5 table 4, 21
			
		;;E Ten AMPLITUDE;;
		
		kAmpB1 table 0, 26
		kAmpB2 table 1, 26
		kAmpB3 table 2, 26
		kAmpB4 table 3, 26
		kAmpB5 table 4, 26


		;;E Ten BANDWIDTH ;;

		kBndB1 table 0, 31
		kBndB2 table 1, 31
		kBndB3 table 2, 31
		kBndB4 table 3, 31
		kBndB5 table 4, 31

   
   
elseif		(giVowelB == 5 && giVoxB == 3) then		;E

		
		
		;;E CounTen FREQUENEY ;;
	
		kFrqB1 table 0, 36
		kFrqB2 table 1, 36     
		kFrqB3 table 2, 36	       
		kFrqB4 table 3, 36	        
		kFrqB5 table 4, 36
			
		;;E CounTen AMPLITUDE;;
		
		kAmpB1 table 0, 41
		kAmpB2 table 1, 41
		kAmpB3 table 2, 41
		kAmpB4 table 3, 41
		kAmpB5 table 4, 41


		;;E CounTen BANDWIDTH ;;

		kBndB1 table 0, 46
		kBndB2 table 1, 46
		kBndB3 table 2, 46
		kBndB4 table 3, 46
		kBndB5 table 4, 46

   
   elseif		(giVowelB == 5 && giVoxB == 4) then		

		
		
		;;E Alto FREQUENEY ;;
	
		kFrqB1 table 0, 51
		kFrqB2 table 1, 51    
		kFrqB3 table 2, 51	       
		kFrqB4 table 3, 51	        
		kFrqB5 table 4, 51
			
		;;E Alto AMPLITUDE;;
		
		kAmpB1 table 0, 56
		kAmpB2 table 1, 56
		kAmpB3 table 2, 56
		kAmpB4 table 3, 56
		kAmpB5 table 4, 56


		;;E Alto BANDWIDTH ;;

		kBndB1 table 0, 61
		kBndB2 table 1, 61
		kBndB3 table 2, 61
		kBndB4 table 3, 61
		kBndB5 table 4, 61
   
   
   elseif		(giVowelB == 5 && giVoxB == 5) then		;E

		
		
		;;E Soprano FREQUENEY ;;
	
		kFrqB1 table 0, 66
		kFrqB2 table 1, 66   
		kFrqB3 table 2, 66	       
		kFrqB4 table 3, 66	        
		kFrqB5 table 4, 66
			
		;;E Soprano AMPLITUDE;;
		
		kAmpB1 table 0, 71
		kAmpB2 table 1, 71
		kAmpB3 table 2, 71
		kAmpB4 table 3, 71
		kAmpB5 table 4, 71
		

		;;E Soprano BANDWIDTH ;;

		kBndB1 table 0, 76
		kBndB2 table 1, 76
		kBndB3 table 2, 76
		kBndB4 table 3, 76
		kBndB5 table 4, 76
  	
  	  	
  endif
  	
  	;Constants across model 1

		kFmin 	= 0		; minimum value of original scale
		kFmax 	= 100		; maximum value of original scale   Frequencey
    	
		kBmin 	= 0		; minimum value of original scale
		kBmax 	= 100		; maximum value of original scale   Bandwidth
  	
  		kAmin	= 0		; minimum value of original scale
		kAmax 	= 100		; maximum value of original scale	  Amplitude
  	
  	  
  	
 /******************************************************************************************************************************************/ 	
 /******************************************************************************************************************************************/ 	
 /**************************************VOWEL SCALE GENERATOR ALGORITHMS***********************************************/ 	
 /******************************************************************************************************************************************/ 	
 /******************************************************************************************************************************************/ 	
  	
 ;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;FORMANT 1;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;
     
     	;;VowelA to VowelB -FRQ;;
       	
       
		kFabAxis1 =	 kFrqB1-kFrqA1		   	;AXIS of Values between Vowel A and Vowel B 	

		kFa1 = kFrqA1 + (kFabAxis1 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kFb1 = kFrqB1 					; new range maximum taking into account range defined in p-fields
		

		kFfx1 = (kFb1-kFa1)*(kx-kFmin)/(kFmax-kFmin)  + kFa1  ;kFfx = Scaled Data. Points from the first 50% scaled to range between A and B.


	;;VowelA to VowelB -AMP;;
    	
    				

		kAabAxis1 =	kAmpB1-kAmpA1		   	;AXIS of Values between Vowel A and Vowel B 	

		kAa1 = kAmpA1 + (kAabAxis1 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kAb1 = kAmpB1 				 	; new range maximum taking into account range defined in p-fields


		kAfx1 = ((kAb1-kAa1)*(kx-kAmin))/(kAmax-kAmin) +kAa1  ;kBfx = Scaled Data. Points from the first 50% scaled to range between A and B.
		
    	
    	;;VowelA to VowelB -BND;;
    	
    				

		kBabAxis1 =	 kBndB1-kBndA1		   	;AXIS of Values between Vowel A and Vowel B 	

		kBa1 = kBndA1 + (kBabAxis1 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kBb1 = kBndB1				 	; new range maximum taking into account range defined in p-fields


		kBfx1 = ((kBb1-kBa1)*(kx-kAmin))/(kBmax-kAmin) +kBa1  ;kBfx = Scaled Data. Points from the first 50% scaled to range between A and B.
		

	
	;FIRST FORMANT: Plugs Paramaters into First formant.
  gk1amp  = ampdbfs(kAfx1)  					     ;Getting the figure in here will be an issue
  gk1form = kFfx1 								;Modulate Formant. k1StrtFrq = Start position. kFrqData1 = Ending position
  gk1band = kBfx1	
	
	



;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;FORMANT 2;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
     
     	;;VowelA to VowelB -FRQ;;
       	
       
		kFabAxis2 =	kFrqB2-kFrqA2		   	;AXIS of Values between Vowel A and Vowel B 	

		kFa2 = kFrqA2 + (kFabAxis2 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kFb2 = kFrqB2 				 	; new range maximum taking into account range defined in p-fields
		

		kFfx2 = (kFb2-kFa2)*(kx-kFmin)/(kFmax-kFmin)  + kFa2  ;kFfx = Scaled Data. Points from the first 50% scaled to range between A and B.


	;;VowelA to VowelB -AMP;;
    	
    				

		kAabAxis2 =	kAmpB2-kAmpA2		   	;AXIS of Values between Vowel A and Vowel B 	

		kAa2 = kAmpA2 + (kAabAxis2 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kAb2 = kAmpB2 				 	; new range maximum taking into account range defined in p-fields


		kAfx2 = ((kAb2-kAa2)*(kx-kAmin))/(kAmax-kAmin) +kAa2  ;kBfx = Scaled Data. Points from the first 50% scaled to range between A and B.
		
    	
    	;;VowelA to VowelB -BND;;
    	
    				

		kBabAxis2 =	kBndB2-kBndA2		   	;AXIS of Values between Vowel A and Vowel B 	

		kBa2 = kBndA2 + (kBabAxis2 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kBb2 = kBndB2 				 	; new range maximum taking into account range defined in p-fields


		kBfx2 = ((kBb2-kBa2)*(kx-kAmin))/(kBmax-kAmin) +kBa2  ;kBfx = Scaled Data. Points from the first 50% scaled to range between A and B.
		

	
	;SECOND FORMANT: Plugs Paramaters into Fof unit.
  gk2amp  = ampdbfs(kAfx2)  					    
  gk2form = kFfx2 								
  gk2band = kBfx2	
	
	
	
;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;FORMANT 3;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
     
     	;;VowelA to VowelB -FRQ;;
       	
       
		kFabAxis3 =	kFrqB3-kFrqA3		   	;AXIS of Values between Vowel A and Vowel B 	

		kFa3 = kFrqA3 + (kFabAxis3 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kFb3 = kFrqB3 					; new range maximum taking into account range defined in p-fields
		

		kFfx3 = (kFb3-kFa3)*(kx-kFmin)/(kFmax-kFmin)  + kFa3  ;kFfx = Scaled Data. Points from the first 50% scaled to range between A and B.


	;;VowelA to VowelB -AMP;;
    	
    				

		kAabAxis3 =	kAmpB3-kAmpA3		   	;AXIS of Values between Vowel A and Vowel B 	

		kAa3 = kAmpA3 + (kAabAxis3 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kAb3 = kAmpB3  				 	; new range maximum taking into account range defined in p-fields


		kAfx3 = ((kAb3-kAa3)*(kx-kAmin))/(kAmax-kAmin) +kAa3  ;kBfx = Scaled Data. Points from the first 50% scaled to range between A and B.
		
    	
    	;;VowelA to VowelB -BND;;
    	
    				

		kBabAxis3 =	kBndB3-kBndA3		   	;AXIS of Values between Vowel A and Vowel B 	

		kBa3 = kBndA3 + (kBabAxis3 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kBb3 = kBndB3  				 	; new range maximum taking into account range defined in p-fields


		kBfx3 = ((kBb3-kBa3)*(kx-kAmin))/(kBmax-kAmin) +kBa3  ;kBfx = Scaled Data. Points from the first 50% scaled to range between A and B.
		

	
	;THIRD FORMANT: Plugs Paramaters into Fof unit.
  gk3amp  = ampdbfs(kAfx3)  					    
  gk3form = kFfx3 								
  gk3band = kBfx3	
	
	
;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;FORMANT 4;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
     
     	;;VowelA to VowelB -FRQ;;
       	
       
		kFabAxis4 =	kFrqB4-kFrqA4		   	;AXIS of Values between Vowel A and Vowel B 	

		kFa4 = kFrqA4 + (kFabAxis4 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kFb4 = kFrqB4  				 	; new range maximum taking into account range defined in p-fields
		

		kFfx4 = (kFb4-kFa4)*(kx-kFmin)/(kFmax-kFmin)  + kFa4  ;kFfx = Scaled Data. Points from the first 50% scaled to range between A and B.


	;;VowelA to VowelB -AMP;;
    	
    				

		kAabAxis4 =	kAmpB4-kAmpA4		   	;AXIS of Values between Vowel A and Vowel B 	

		kAa4 = kAmpA4 + (kAabAxis4 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kAb4 = kAmpB4 				 	; new range maximum taking into account range defined in p-fields


		kAfx4 = ((kAb4-kAa4)*(kx-kAmin))/(kAmax-kAmin) +kAa4  ;kBfx = Scaled Data. Points from the first 50% scaled to range between A and B.
		
    	
    	;;VowelA to VowelB -BND;;
    	
    				

		kBabAxis4 =	kBndB4-kBndA4		   	;AXIS of Values between Vowel A and Vowel B 	

		kBa4 = kBndA4 + (kBabAxis4 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kBb4 = kBndB4 				 	; new range maximum taking into account range defined in p-fields


		kBfx4 = ((kBb4-kBa4)*(kx-kAmin))/(kBmax-kAmin) +kBa4  ;kBfx = Scaled Data. Points from the first 50% scaled to range between A and B.
		

	
	;FOURTH FORMANT: Plugs Paramaters into Fof unit.
  gk4amp  = ampdbfs(kAfx4)  					    
  gk4form = kFfx4 								
  gk4band = kBfx4	


;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;FORMANT 5;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
     
     	;;VowelA to VowelB -FRQ;;
       	
       
		kFabAxis5 =	kFrqB5-kFrqA5		   	;AXIS of Values between Vowel A and Vowel B 	

		kFa5 = kFrqA5 + (kFabAxis5 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kFb5 = kFrqB5  				 	; new range maximum taking into account range defined in p-fields
		

		kFfx5 = (kFb5-kFa5)*(kx-kFmin)/(kFmax-kFmin)  + kFa5  ;kFfx = Scaled Data. Points from the first 50% scaled to range between A and B.


	;;VowelA to VowelB -AMP;;
    	
    				

		kAabAxis5 =	kAmpB5-kAmpA5		   	;AXIS of Values between Vowel A and Vowel B 	

		kAa5 = kAmpA5 + (kAabAxis5 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kAb5 = kAmpB5  				 	; new range maximum taking into account range defined in p-fields


		kAfx5 = ((kAb5-kAa5)*(kx-kAmin))/(kAmax-kAmin) +kAa5  ;kBfx = Scaled Data. Points from the first 50% scaled to range between A and B.
		
    	
    	;;VowelA to VowelB -BND;;
    	
    				

		kBabAxis5 =	kBndB5-kBndA5		   	;AXIS of Values between Vowel A and Vowel B 	

		kBa5 = kBndA5 + (kBabAxis5 * gkExMin) 	; new range minimum taking into account range defined in p-fields
		kBb5 = kBndB5  				 	; new range maximum taking into account range defined in p-fields


		kBfx5 = ((kBb5-kBa5)*(kx-kBmin))/(kBmax-kBmin) +kBa5  ;kBfx = Scaled Data. Points from the first 50% scaled to range between A and B.
		

	
	;FIFTH FORMANT: Plugs Paramaters into Fof unit.
  gk5amp  = ampdbfs(kAfx5)  					    
  gk5form = kFfx5 								
  gk5band = kBfx5	

/*__________________________________________________________________________________________________________________________________________________________*/
/*__________________________________________________________________________________________________________________________________________________________*/


endin 

 instr 3 ; Prosody  and Jitter Generator 
 
 ;  data intake
 kx = gkx
 
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;PROSODY MODEL BEGIN;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
 
;; PROSODY CARRIER
;Basic Carrier Lfo defines phrase/prosody shape
kSlfo =2

kSpeed = 2
k2 	randh .25, 1      ;Randomisation to emulation phrasing and prosody
kScps = kSpeed*k2
aPhrase   lfo kSlfo, kScps, 0



;;UPWARD TILT
;Up Lfo models + rate
kUlfo =2.5    ;Control the Amount of LFO applied to the signal here 

kUSpeed = .5
kU2 	randh 1, .3      ;Randomisation to emulation phrasing and prosody
kUcps = kUSpeed*kU2
aUp   lfo kUlfo, kUcps, 4


;;DOWNWARD TILT
;Down Lfo models - rate
kDlfo =2.5    ;Control the Amount of LFO applied to the signal here 

kDSpeed = .5
kD2 	randh 1, .3      ;Randomisation to emulation phrasing and prosody
kDcps = kDSpeed*kD2
aDn   lfo kDlfo, kDcps, 5


;;PAUSES
;Square Wave LFO  models pauses
kPlfo = 1    ;Control the Amount of LFO applied to the signal here 
kPSpeed = 5
      ;Randomisation to emulation phrasing and prosody

kP2 randomh .01625,1,2
kPcps = kPSpeed*kP2


aPs   lfo kPlfo, kPcps, 3



;Add Up and Down Signal to Phrase  Signal Signals Together
aProsody = (aPhrase + aUp  + aDn)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;PROSODY MODEL END;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;JITTER MODEL BEGIN;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
ar1          randi       .01*.5   ,1/.05                                  
ar2          randi       .01*.5   ,1/.1111   
ar3          randi       .01*.5   ,1/1.2186 


kkf1 random 180,290
kkf2 random 240,440
kkf3 random 300,380
kkf4 random 600,800
kkf5 random 700,1200




;rescale kx so that it can be addedto kjit to provide a meaning profile 

printk 0,kx

akf1          =           (kkf1+kx) * (1+ar1+ar2+ar3)                        ;Basic Fundamental Frequencey of kkf1 + Kx for Kfund1 with added jitter controlled by data
akf2          =           (kkf2+kx) * (1+ar1+ar2+ar3)                              ;Basic Fundamental Frequencey of kkf2 + Kx for Kfund2 with added jitter controlled by data
akf3          =           (kkf3+kx) * (1+ar1+ar2+ar3)                           ;Basic Fundamental Frequencey of kkf3 + Kx for Kfund3 with added jitter controlled by data
akf4          =           (kkf4+kx) * (1+ar1+ar2+ar3)                       ;Basic Fundamental Frequencey of kkf4 + Kx for Kfund4 with added jitter controlled by data
akf5          =           (kkf5+kx) * (1+ar1+ar2+ar3)                            ;Basic Fundamental Frequencey of kkf5 + Kx for Kfund5 with added jitter controlled by data
  
  
  

gkfund1 = (akf1+aProsody) ;* aPs
gkfund2 = (akf2+aProsody) ;* aPs
gkfund3 = (akf3+aProsody) ;* aPs
gkfund4 = (akf4+aProsody) ;* aPs
gkfund5 = (akf5+aProsody) ;* aPs

gkfund = 220
gkfund = (gkfund +kx) * (1+ar1+ar2+ar3)  


gkfund1 = gkfund
gkfund2 = gkfund
gkfund3 = gkfund
gkfund4 = gkfund
gkfund5 = gkfund

			


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;JITTER MODEL END;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;TIMBRE DEFINITION;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
   
    gkoct init 0

  gkris = .005
  gkdur = .017
 ; gkdec = .007

;  kdur    linseg  1,1,1 ,2 , 1 ,1 ,1 ; kdur CHANGE
  gkdec    linseg  1,p3/3,.5 ,p3/3,.5 ,p3/3 ,1 ; kdec CHANGE
  
  gk1ris = gkris
  gk2ris = gkris
  gk3ris = gkris
  gk4ris = gkris
  gk5ris = gkris
  
  gk1dur = gkdur
  gk2dur = gkdur
  gk3dur = gkdur
  gk4dur = gkdur
  gk5dur = gkdur
  
  gk1dec = gkdec
  gk2dec = gkdec
  gk3dec = gkdec
  gk4dec = gkdec
  gk5dec = gkdec

	if (p2 <=0) then			;bangs in i-rate variables just once

		  giolaps = 20000
         		  gifna = 1
		  gifnb = 2
		  gitotdur = p3 
		  giphs	=	0
		  gifmode	=	1
		  giskip	=	0
		endif			

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;Timbral Variation Envelopes;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;5 Formant Frequencey Variation Envelopes

afrmv1 linseg .95,p3/4,1.05,p3/4,1,     p3/4,.95,p3/4,1
afrmv2 linseg .9,p3/4,.95,    p3/4,1.03,p3/4,1,p3/4,.95
afrmv3 linseg 1,p3/4,.9,       p3/4,.95,  p3/4,.9,p3/4,1.10
afrmv4 linseg 1.10,p3/4,1,   p3/4,1.10,p3/4,1.03,p3/4,1.05
afrmv5 linseg 1.05,p3/4,1.1,p3/4,1.05,p3/4,1.05,p3/4,.9

gk1form = gk1form* afrmv1
gk2form = gk2form* afrmv2
gk3form = gk3form* afrmv3
gk4form = gk4form* afrmv4
gk5form = gk5form* afrmv5
 ;___________________________________________________________________
 ;_________________________________________________________________________________		
 		

endin




instr 4 ; Fof Generators for Vocal Gestures

;;;;;;;;;;;;;;;;;;;;;
;;; FOF GENERATORS;;;
;;;;;;;;;;;;;;;;;;;;;


  a1 fof gk1amp, gkfund1, gk1form, gkoct, gk1band, gk1ris, \
         gk1dur, gk1dec, giolaps, gifna, gifnb, gitotdur
  a2 fof gk2amp, gkfund2, gk2form, gkoct, gk2band, gk2ris, \
         gk2dur, gk2dec, giolaps, gifna, gifnb, gitotdur
  a3 fof gk3amp, gkfund3, gk3form, gkoct, gk3band, gk3ris, \
         gk3dur, gk3dec, giolaps, gifna, gifnb, gitotdur
  a4 fof gk4amp, gkfund4, gk4form, gkoct, gk4band, gk4ris, \
         gk4dur, gk4dec, giolaps, gifna, gifnb, gitotdur
  a5 fof gk5amp, gkfund5, gk5form, gkoct, gk5band, gk5ris, \
         gk5dur, gk5dec, giolaps, gifna, gifnb, gitotdur
 

;VALVES
 
;a1=0
;a2=0
;a3=0
;a4=0
;a5=0
 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;Postproduction;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;Image widening and Formant Organisation

	a1	=	a1*.5

	asigl sum (a1+a2+a4)     	
	asigr sum (a1+a3+a5)     	


	;asigr delay asigr, .001





	;Panning
;	aLL, aLR pan2 asigl, 0 
;	aRL, aRR pan2 asigr, 1 


;asigl = aLL + aLR
;asigr = aRL + aRR




    ;outs asigl*.025, asigr*.125   ; Signal need to be kept at roughly 1% of output to prevent Deafening and possible explosion of head and face



;outs asigl, asigr

gaVocalGesture = asigl+asigr

endin


instr 5 ; Stereo-Space

;=================SATIALISATION========================

kData = gkSpatData
aVG = gaVocalGesture

kX = 0
kY = 0
kZ = 0


; spatialisation		description
;W, aX, aY, aZ          spat3d ain, kX, kY, kZ, idist, ift, imode, imdel, iovr [, istor]	

										       ;7=ftable for room dimensions
a_W, a_X, a_Y, a_Z	spat3d aVG, kX, kY, kZ, 1.0, 7, 4, 2.0, 8
			
			a_W      =  a_W * 1.4142




a_W      butterlp a_W, 1000      
a_Y      butterlp a_Y, 1000      
aleft   =  a_W + a_X
aright  =  a_Y + a_Z

outs aleft,aright







endin



</CsInstruments>
<CsScore>
; sine wave
;f1 0 4096 10 1

f1 0 16384 9 1 20 0   2 1 0  3 1 0  4 .5 0  5 .5 0  6 .125 0  7 .125 0  8 .125 0  9 .125 0  10 .125 0
;f1 0 16384 10 1 1   1   1    0.7 0.5   0.3  0.1   ;Pulse

; sigmoid wave
f2 0 1024 19 0.5 0.5 270 0.5


                 ;==========================
 ;==========================Test Sequence==========================

    
;  INS           STRT	        DUR	       DataPIn1%       DataPIn1%	             VOWEL-A       VOWEL-B	  EXTENT%LIMIT-A  EXTENT%LIMIT-B     mode       Vox- A      Vox- B
   i1	             0	        10                      0		  0	                              1                  5			0			100		          1                2              2
   i2	             0	        10                      0		  0	                              1                  5			0			100		          1                2              2
   i3	             0	        10                      0		  0	                              1                  5			0			100		          1                2              2  
   i4		   0	        10                      0		  0	                              1                  5			0			100		          1                2              2
   i5                  0              10
 
 
 
 		  
e


/*
p4 and p5 allow for Score input of data.

VOWEL DESIGNATIONS for p6 and p7

0 	==	Automatic U-O-A-I-E Scale Maybe this could be pointless

1	==	U
2	==	O
3	==	A
4	==	I
5	==	E

DATA MODES  for p10

1	==	Map data to entire range of vowel pair 
2	==	Express data as a percentage of the range between vowel pairs

Switching modes int the middle of a score when sonifying the same data set is not recomended.

Vocal Types for p11
1 == Bass
2 == Tenor
3 == Counter Tenor
4 == Alto
5 == Soprano
*/

</CsScore>
</CsoundSynthesizer>
```
