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
import math as m               #Probably don't need this     
from pandas import ExcelWriter #Probably don't need this.
import io                      #Probably don't need this
import numpy as np             #PRobably don't need this.
import csv                     #Probably don't need this.

#####################################################################################################################################
#####################TIMER DATA PIPE MECHANICS#######################################################################################
#####################################################################################################################################
injson = requests.get("https://ns1.pervasivenation.com/trace/json?tz=0&event=!GW|PXY&from=1d&num=99999&pltspan=w", auth=('pervasive.nation', '98ojnv12-dws')).content
pnData = pd.read_json(injson)

ts = pnData['ts'] #Pull Time Stamps
ev = pnData['ev'] #Pull Events List
gw = pnData['gw'] #Pull Gateway list
m   = pnData['m'] #Pull message list
cd  = pnData['cd'] #Pull confirmation messages  
dv =  pnData['dv'] #Pull DevEUI     These might be mixed up
du =  pnData['du'] #Pull DevAddr
ri =  pnData['ri'] #Pull Recieved Signal Strength
sn =  pnData['sn'] #Signal to Noise Ratio
fq =  pnData['fq'] #Frequencey
sf =  pnData['sf'] #Spread Factor


####Initialisation for controlling ints for the while loop
x=0     #Time
y=1     #Data
scleFctr = .01 # This is the scaling factor for the time series
#The k-rate of csound or update rate has to be taken into account in teh scaling factor. 
#Data sent quicker than k-rate will not be sonified. 
# X and y should both be incremented as the code proceeds to keep readint each piece out in time.
###############################Turn on OSC######################################################################################################
client = OSCClient()                 # Establish Client
client.connect(("localhost", 7777))  # Connect to port 7777
#####################################################################################################################################
#######################################DATA PROCESSING#######################################################################################
#####################################################################################################################################
while True:

    t1 = ts.iloc[x]
    t2 = ts.iloc[x+1] 
    t3 = (t2-t1)*scleFctr # This gives the time to delay the system by
    t3 = t3 *scleFctr     # This gives the time to delay the system by multiplied by a scalling factor
    
    event     = ev.iloc[y]  #This event can be sent to OSC now
    gate      = gw.iloc[y]  #This gateway can be sent to OSC now
    message   = m.iloc[y]   #etc.
    conf      = cd.iloc[y]
    dvEUI     = dv.iloc[y]
    dvAddr    = du.iloc[y]
    rssi      = ri.iloc[y]
    sgNoise   = sn.iloc[y]
    freq      = fq.iloc[y]
    spreadF   = sf.iloc[y]

    #if current time stamp is within 1 second either way of last as last add .25 seconds to current in original data frame
#    if m.ceil(ts.iloc[x]) == m.ceil(ts.iloc[x-1])+10000:
#        ts.iloc[x] = ts.iloc[x]+.25
#    elif m.ceil(ts.iloc[x]) == m.ceil(ts.iloc[x-1])-10000:    
#        ts.iloc[x] = ts.iloc[x]+.25
#    elif m.ceil(ts.iloc[x]) == 0:    
#        ts.iloc[x] = ts.iloc[x]+.25
       
    x=x+1
    y=y+1

    time.sleep(t3) # This delays the code for the number of seconds specified in T3
    time.sleep(.25) #Just sleep for .25 of a second between every execution anyway....
    #Ahhh..jesus... that fixed it.. fo fuck sake.....
    #time.sleep(3) # This delays the code for the number of seconds specified in T3
   #print event
   
#############################################################################################################################
################################Data Handler#################################################################################   
#############################################################################################################################
#This section checks to see if the current event is an UL and if it is 
#updates dtaosc1&2 which are the values sen over osc to the synthesiser

    data1 = 0
    dtime = 0
    print event

    if event == "ULD":
        data1 = 2
        dtime = t3
    else:
        data1 = 1
        dtime = t3

#This section checks to see if the mic codes are correct 
#updates data1 which sends the confirmation or non-confirmation over osc to the synthesiser

    if '[Can\'t calculate MIC]' in message:
        data2 = 3
        dtime = t3
        print 'Not our device'
    else:
        data2 = 3
        dtime = t3

    if rssi <= -70:
        data3 = 3
        print 'Device at Edge of RSSI Range'
    else:
        data3 =0
        
#####################################################################################################################################


#############################OSC Sender################################################################################################
    msg = OSCMessage("/sonify")           # Generate Message Root
    msg.append([data1, dtime,data2,data3])          # Append the data to the root 
    client.send(msg)                    # Send the data
    
  #  print msg,t3,event
    
    #time.sleep(t3*.5)                   #Wait for half of t3 before clearing message
    msg.clearData();                    # Clear message
##############################################################################################################################
##################################These reset the Sata to 0############################################################################################    
    data1 = 0
    dtime = 0
    data2 = 0
    data3 = 0
  #  if x >= 500: #Determines how long the program should run for
  #      break

    
    
##############################Turn off OSC Sender################################################################################################
    
client.send(OSCMessage("/quit"))    # Send quit mesasge

####################################################################################################################################################################################


##########################################################################################
##############################JSON SPEC FOR PN TRACE##############################
##########################################################################################

#ts = Timestamp
#ev = Event
#gw = Gateway
#dv = DevEUI
#du = DevAddr
#ri = Recieved Signal Strength indicator
#sn = Signal to Noise Ratio
#fq = Frequencey
#sf = Spread Factor
#cd = Confirmation
#m =  Message

##########################################################################################

##########################################################################################
################NOTES NOTES NOTES NOTES###################################################
##########################################################################################
#The code can be expanded out to parse all of the data coming in.
#The Json within the message sections can be re-parsed into a second dataframe