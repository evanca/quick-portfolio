# A Spatial Analysis of Florida with Sea Level Rise

## Introduction
<br><br>
<img src="rad-sc.github.io/Project1_486/images/FloridaLand.png?raw=true"/>
<br><br>
Florida is a coastal state with porous limestone ground and flat terrain that makes it vulnerable to the effects of sea level rise. Florida is also especially vulnerably to damage from tropical storms, which become more powerful with rising water level. According to former NASA scientist James Hansen, sea level rise could accelerate exponentially in the next 50-150 years on a magnitude of several meters. I was interested in what Florida would look like at varying levels of sea level rise after seeing the following image from NASA's Earth Observatory.
<br><br>
<img src="rad-sc.github.io/Project1_486/images/NasaFlorida.png?raw=true"/>
<br><br>
For my analysis I was interested to see what extents of land area sea level rise would cover at various depths across the entire state of Florida. I chose the classes of sea level rise depths based on a maximum increase of 230 feet, under the circumstance that all global ice melted, and divided at levels based on varying significant factors.

## Data Anaylsis
I obtained my initial data from the State of Florida's open source GIS database. I downloaded an 'elevation contours & depression' shape file for the entire state of florida, this took a long time, unfortunately Digital Elevation Models and Lidar data are not readily included in the public open source data for the entire state of Florida, however they are a more accurate measure of topography. After imputting my contour data into QGIS I used the SAGA convert line vertices to point tool to create point data with my elevation attribute for rasterizing. The resulting point data consisted of 50+ million points which I used to create a raster image to be symbolized by elevation. Although several point to raster tools exist in QGIS I actually had to create the elevation raster in ArcGis because QGIS couldn't handle the amount of point data; this took 7 hours to give an output in ArcGIS with the point to raster tool. After I had my raster, I loaded it back into QGIS for symbolizing by sea level and area analysis. The area analysis was performed by... 
<br><br>
I symbolized the raster image with unique values, at intervals between below 0-1 feet, 1-3 feet, 3-5 feet, 5-10 feet, 10-30 feet, 30-70 feet, 70-100 feet, and 100-230 feet, to display the "above sea level" elevations as green, and "below sea level" elevations as blue. Intervals from 0-10 feet were selected because these areas are most vulnerable to sea level rise in the next 100 years. The interval from 10-30 feet is significant because of sea swells during hurricanes and tropical storms, which can reach to 30 feet. intervals from 30-230 feet represent sea level rise to the greatest extent, where all global ice has melted. 


## Florida visualized to show various sea levels and area analysis

<img src="rad-sc.github.io/Project1_486/images/SeaLevelRiseFast.gif?raw=true"/>

Area of land below sea level under future rise:
<br><br>
Sea level +1 foot = __ sq feet under water
<br><br>
Sea level +3 feet = __ sq feet under water
<br><br>
Sea level +5 feet = __ sq feet under water
<br><br>
Sea level +10 feet = __ sq feet under water
<br><br>
Sea level +30 feet = __ sq feet under water
<br><br>
Sea level +70 feet =  __ sq feet under water
<br><br>
Sea level +100 feet = __ sq feet under water
<br><br>
Sea Level +230 feet = __ sq feet under water

Conclusions...



