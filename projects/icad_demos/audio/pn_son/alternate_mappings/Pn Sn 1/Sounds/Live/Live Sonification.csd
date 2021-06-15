<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o poscil.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 100
nchnls = 2
0dbfs  = 1

  gihandle OSCinit 7777



  instr   1
    gkdata1 init 0
    gkdata2 init 0
    gkdata3 init 0
    gktime init 0


nxtmsg:
    kk  OSClisten gihandle, "/sonify", "ffff", gkdata1,gktime,gkdata2,gkdata3
    printk 0,gkdata1
    printk 0,gkdata2
    printk 0,gkdata3
    printk 0,gktime


if (kk == 0) goto ex
    printk 0,gkdata1
    printk 0,gkdata2
    printk 0,gkdata3
    printk 0,gktime

    kgoto nxtmsg
ex:
  endin
    
  instr 2
  

  git =.125 ; initialise master time for impulse
  gkpn line .5,git,1 ; initialise master panning lne for impulse

  if(gkdata1 >=1) then
  event "i", 3, 0, git
  gkdata1 =0 ;Reset the  osc data to 0
          endif
    if(gkdata2 >= 1) then
  event "i", 4, .2, git
  gkdata2 =0 ;Reset the  osc data to 0
          endif
     if(gkdata3 >= 1) then
  event "i", 5, .4, git
  gkdata3 =0 ;Reset the  osc data to 0
          endif
          
endin

instr 3
kcps = 240
kcar = 5
kmod = .1
kndx =  1

asig foscil .5, kcps, kcar, kmod, kndx, 1
aL,aR	pan2	asig, .5 
	outs	aL, aR                   ; audio to output
                       ; audio to output
  endin


instr 4
kcps = 440
kcar = .005
kmod = .5
kndx =  2

asig foscil .5, kcps, kcar, kmod, kndx, 1
aL,aR	pan2	asig, 1 
	outs	aL, aR                   ; audio to output
endin

instr 5
gisine ftgen 0,0,2^12,10,.1,.2,.4

aenv expon     .5, 0.7, 0.01             ; a short percussive envelope
asig poscil    aenv, 880, gisine          ; audio oscillator
aL,aR	pan2	asig, 0 
	outs	aL, aR                   ; audio to output
  endin


</CsInstruments>
<CsScore>

f1 0 16384 10 1                                          ; Sine
f2 0 16384 10 1 0.5 0.3 0.25 0.2 0.167 0.14 0.125 .111   ; Sawtooth
f3 0 16384 10 1 0   0.3 0    0.2 0     0.14 0     .111   ; Square
f4 0 16384 10 1 1   1   1    0.7 0.5   0.3  0.1          ; Pulse

i1 0 500000
i2 0 500000

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
