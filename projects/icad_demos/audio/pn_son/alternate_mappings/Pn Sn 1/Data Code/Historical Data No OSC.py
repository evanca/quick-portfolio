#!/usr/bin/env python      
# Get pyOSC here: https://trac.v2.nl/wiki/pyOSC     
# The GitHub-hosted version of pyOSC is for Python 3 which isn't supported by Pythonista at the moment

##############################################################################################################################
###################################Stephen Roddy 2017 Pervasive Nation Sonification Project###################################
##############################################################################################################################
import pandas as pd
import json
import urllib
import requests
from OSC import OSCClient, OSCMessage
import time
import os
import math as m
import datetime               #Probably don't need this     
from pandas import ExcelWriter #Probably don't need this.
import io                      #Probably don't need this
import numpy as np             #PRobably don't need this.
import csv                     #Probably don't need this.


os.chdir("/Users/Stephen/Desktop/Sonification Research/Pervasive Nation Prototype/PNSOn Prototype/Plenneary Sonification")
#####################################################################################################################################
#####################TIMER DATA PIPE MECHANICS#######################################################################################
#####################################################################################################################################
#injson = requests.get("https://pn.orbiwise.com/trace/json?tz=0&event=!GW|PXY&from=11%2F01%2F2016&to=11%2F01%2F2017&num=9999&pltspan=w", auth=('pervasive.nation', '98ojnv12-dws')).content
#old server#injson = requests.get("https://pn.orbiwise.com/trace/json?tz=0&event=!GW|PXY&from=1d&num=99999&pltspan=w", auth=('pervasive.nation', '98ojnv12-dws')).content
#new server #ns1.pervasivenation.com/trace  # new server
injson = requests.get("https://ns1.pervasivenation.com/trace/json?tz=0&event=!GW|PXY&from=1d&num=99999&pltspan=w", auth=('pervasive.nation', '98ojnv12-dws')).content
pnData = pd.read_json(injson)
pnData = pnData.sort_values(['ts'], ascending=True) #sort values on basis of time stamps.. done anyway
print pnData

ts = pnData['ts'] #Pull Time Stamps
ev = pnData['ev'] #Pull Events List
gw = pnData['gw'] #Pull Gateway list
m  = pnData['m'] #Pull message list
cd = pnData['cd'] #Pull confirmation messages  
dv = pnData['dv'] #Pull DevEUI     These might be mixed up
du = pnData['du'] #Pull DevAddr
ri = pnData['ri'] #Pull Recieved Signal Strength
sn = pnData['sn'] #Signal to Noise Ratio
fq = pnData['fq'] #Frequencey
sf = pnData['sf'] #Spread Factor

mastercount =0
now = (time.time())*1000  # ## Current time in miliseconds from epoch/unix
dayms = 86400000          # ## Miliseconds in a day
then= now - dayms         # ## 24 hours ago in unix

fts =  ts.iloc[0]         # ## First Time Stamp in Data
lts = ts.tail(1).iloc[0]  # ts.iloc[len(ts)-1] ## Last Time Stamp in Data

if fts < then:    
    binstart = fts           
elif fts > then:
    binstart = then
           
binsize = 720000          # Want 120 12 minute bins 720,000ms = 12 mins
binend = binstart+binsize #define the end of the first bin


inTime = abs(then - fts)
outTime= abs(now - lts)
introBins = int((inTime)/binsize)   ### ### 
outroBins = int((outTime)/binsize)  ### ###     


if abs(lts-now)>binsize:  #Checks to see if that we are taking enough data in
    print 'Not enough rows of data in json'
    exit()     

else:
    print 'Enough rows in data'

#Check how much data we've got
a= ts.iloc[0]
b= ts.iloc[len(ts)-1]
sum = (((abs(a-b))/1000)/60)/60
#print 'The record contains', sum,'hours or',sum/7,'days'


icnt = 0
ocnt = 0

##Binstart
### if sets binstart to earliest time stamp fts or then

eventcount = 0          
joincnt   = 0
rssicount  = 0

# Data Time Arracy Capture
evr =[0]  #Lists to capture aggregates from bins
msr  =[0] 
rsr  =[0]          

y=0    #init data scanning variable
tstamp    = ts.iloc[y]


while tstamp<=lts-1: #tstamp < lts: #mastercount != now: 
### Scans through data columns incrementaly     
    event     = ev.iloc[y]  #This event can be sent to OSC now
    gate      = gw.iloc[y]  #This gateway can be sent to OSC now
    message   =  m.iloc[y]   #etc.
    conf      = cd.iloc[y]
    dvEUI     = dv.iloc[y]
    dvAddr    = du.iloc[y]
    rssi      = ri.iloc[y]
    sgNoise   = sn.iloc[y]
    freq      = fq.iloc[y]
    spreadF   = sf.iloc[y]
    tstamp    = ts.iloc[y]       #Timestamp coresponding to data streams current data being read  using y

 
###BinLogic 
    
    if binstart <= tstamp <= binend :    #if current time falls within the bin time
                                   #Do error checks
        if event == "UL":                #if Msg appears
            eventcount = eventcount +1        #increment the bin count 
        if 'join_accept' in message:
            joincnt = joincnt +1
        if rssi <= -70:
            rssicount = rssicount+1
        
        
        if tstamp >= lts: # if data ends before bin ends, dump counters to arrays
            evr= evr + [eventcount]     #Dump Final bin values into arrays
            msr= msr + [joincnt]       #Arrays to capture aggregates from bins
            rsr= rsr + [rssicount]
       
            binstart = binend           #Start of a new bin and end of previous bin
            binend = binstart+binsize   #End of bin = new start + bin size
            
            eventcount = 0 #RESET EVENT BIN
            joincnt = 0 #RESET MSG BIN
            rssicount = 0 #RESET RSSI BIN
            
    if binstart < tstamp > binend:  # when the time stamp is outside of the bin end
        evr= evr + [eventcount]     #Dump Final bin values into arrays
        msr= msr + [joincnt]       #Arrays to capture aggregates from bins
        rsr= rsr + [rssicount]
       
        binstart = binend           #Start of a new bin and end of previous bin
        binend = binstart+binsize   #End of bin = new start + bin size
            
        eventcount = 0 #RESET EVENT BIN
        joincnt = 0 #RESET MSG BIN
        rssicount = 0 #RESET RSSI BIN

        icnt=icnt+1
        ocnt=ocnt+1
    y=y+1

c = 0
filler = introBins+outroBins
end=0
mnd =0
rnd =0
while c <= filler: #For any missing time periods at the beginning and end fo the sonification
    
    if icnt < introBins and icnt != introBins: #Insert empty bins at start
                 
        evr.insert(0,0)
        msr.insert(0,0)
        rsr.insert(0,0)
               
        icnt=icnt+1
        
    if ocnt < outroBins and ocnt != outroBins: #Insert empry bins at end
        end = (len(evr))
        mnd = (len(msr))
        rnd = (len(rsr))
        #evr= evr + [0]    #they're going on the wrong end
        evr.insert(end,0)
        msr.insert(mnd,0)
        rsr.insert(rnd,0)
    c=c+1
         
print msr
print 'Data Processing Done...'
print 'Starting OSC...'
###############################Turn on OSC######################################################################################################

print 'Finished without problems'
print evr
print rsr

print now
