# A Spatial Analysis of Florida with Sea Level Rise

## Introduction
<br><br>
<img src="https://rad-sc.github.io/project1_486/images/FloridaLand.png?raw=true"/>
<br><br>
Florida is a coastal state with a porous limestone ground and flat terrain that makes it vulnerable to the effects of sea level rise. Florida is also especially vulnerably to damage from tropical storms, which become more powerful with rising water level. According to former NASA scientist James Hansen, sea level rise could accelerate exponentially in the next 50-150 years on an magnitude of several meters. I was interested in what Florida would look like at varying levels of sea level rise after seeing the following image from NASA's Earth Observatory. 
<br><br>
<img src="https://rad-sc.github.io/project1_486/images/FloridaNasa.png?raw=true"/>
<br><br>
For my analysis I was interested to see what extents of land-area sea level rise would cover at various depths across the entire state of Florida. I chose the classes of sea level rise depths based on a maximum increase of 230 feet, under the circumstance that all global ice melted, and divided at levels based on varying significant factors. 

## Data Anaylsis
I obtained my initial data from the State of Florida's open source GIS database. I downloaded an 'elevation contours & depression' shape file for the entire state of florida; this took a long time, unfortunately Digital Elevation Models and Lidar data are not readily included in the public open source data for the entire state of Florida, however they are a more accurate measure of topography. After imputting my contour data into QGIS I used the SAGA 'convert line vertices to point' tool to create point data with my elevation attribute for rasterizing. The resulting point data consisted of 50+ million points which I used to create a raster image to be symbolized by elevation. Although several point to raster tools exist in QGIS I actually had to create the elevation raster in ArcGIS because QGIS couldn't handle the amount of point data; this took 7 hours to give an output in ArcGIS with the point to raster tool (I'm sure many of the rasterizing tools in Qgis would have worked if I hadn't had so much data, IDW interpolation for example). After I had my raster, I loaded it back into QGIS for symbolizing by sea level and area analysis. 
<br><br>
The area analysis was performed by first ensuring I was in an equal area projection to maintain accurate area measurements, and then by converting the raster data back to vector data as a polygon categorized by the elevation attribute. I used the field calculator to add an area field to the vector attribute table. I then used the Group Stats plugin to filter for the sum of the areas for all unique values by elevation category (example: "Elevation" >0 AND "Elevation" <= 1 for the sum of areas between 0 and 1 foot elevation), using the elevation vector as the Row, and the Sum function and Area field as the value. This returned a sum for each unique value, which I copied to the clipboard and pasted in excel where I used the excel sum function to get a final total area for each category. I also calculated area per foot of rise to give some scaled measure of how drastic the rise is per category through excel. Although the elevation data was in feet, the Albers equal area projection that I used is in meters, so area calculations are in metric. 
<br><br>
I symbolized the raster image with unique values, at intervals between below 0-1 feet, 1-3 feet, 3-5 feet, 5-10 feet, 10-30 feet, 30-70 feet, 70-100 feet, and 100-230 feet, to display the "above sea level" elevations as green, and "below sea level" elevations as blue. Intervals from 0-10 feet were selected because these areas are most vulnerable to sea level rise in the next 100 years. The interval from 10-30 feet is significant because of sea swells during hurricanes and tropical storms, which can reach to 30 feet. intervals from 30-230 feet represent sea level rise to the greatest extent, where all global ice has melted. 


## Florida visualized to show various sea levels and area analysis

<img src="https://rad-sc.github.io/project1_486/images/SeaLevelRiseFast.gif?raw=true"/>

Area of land below sea level under future rise:
<br><br>
Sea level +1 foot = ~18,000 sq kilometers under water
18,000 sq kilometers lost lost per foot rise
<br><br>
Sea level +3 feet = ~98,000 sq kilometers under water
48,800 sq kilometers lost per foot rise
<br><br>
Sea level +5 feet = 1,450,000 sq kilometers under water
726,000 sq kilometers lost per foot rise
<br><br>
Sea level +10 feet = 1,750,000 sq kilometers under water
350,000 sq kilometers lost per foot rise
<br><br>
Sea level +30 feet = 10,500,000 sq kilometers under water
522,000 sq kilometers lost per foot rise
<br><br>
Sea level +70 feet =  25,700,000 sq kilometers under water
641,000 sq kilometers lost per foot rise
<br><br>
Sea level +100 feet = 26,800,000 sq kilometers under water
893,000 sq kilometers lost per foot rise
<br><br>
Sea Level +230 feet = 57,900,000 sq kilometers under water
445,000 sq kilometers lost per foot rise

3,510,344 sq kilometers left above
124,000,000 sq kilometers lost

According to my spatial analysis, over 100 million square kilometers of Florida could be lost in the event that all global ice sea ice melted. While 230 feet of sea level rise is extreme it is useful to look at all the varying levels of rise possible. Based on the area lost per foot of rise for each category, sea level rise between 70 and 100 feet will consume the most sqare kilometers per foot rise, 893,000 sq km. Slightly more relevant and in second place for most square kilometers lost per foot rise is between 3 and 5 feet of rise at 726,000 sq km per foot rise. Current projections of sea level rise based on current climate change projections how that it is possibly that we will gain 2 meters of water (~6 feet) in the next 100 years. The amount of land being potentially displaced in Florida over the next 100 years is expansive, and the response efforts to the effects of climate change must include support for those displaced by rising sea level globally. Florida is just one example of a placce undergoing coastal shrinking, and with the majority of global populations living in coastal areas it is extremely important to consider these effects. 



