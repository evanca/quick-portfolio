# A Spatial Analysis of Florida with Sea Level Rise(/project1_486//)

## Introduction
<img src="https://rad-sc.github.io/Project1_486/FloridaLand.png?raw=true"/>
Florida is a coastal state with porous limestone ground and flat terrain that makes it vulnerable to sea level rise. Florida is also especially vulnerably to tropical storms, where damage is increased with water level. According to former NASA scientist James Hansen, sea level rise could accelerate exponentially in the next 50-150 years on a magnitude of several meters. For my analysis I was interested to see what extents of land sea level rise would cover at various depths across the entire state of Florida.

## Data Anaylsis
I obtained my initial data from the State of Florida's open source GIS database. I downloaded an elevation, contours, and depression shape file for the entire state of florida, this took a long time. After imputting my data into QGIS I used the SAGA convert line vertices to point tool to create point data with my elevation attribute for rasterizing. After I had my point data (~50 million points), I converted points to raster. When converting to raster, I actually had to import the data into ArcGis; QGIS couldn't handle the data and kept crashing, ArcGis took 7 hours to process this point data into a raster. After loading my Florida elevation raster back into Qgis, I symbolized the elevation to represent above and below sea level.

## Area(sq m) affected by sea level rise at various increments



