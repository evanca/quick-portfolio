# Portfolio

---

## Walksheds and Bikesheds to Career Centers in Phoenix, Arizona

Exploring 5, 10, 15 minute walksheds and bikesheds to Career Centers in Phoenix, AZ

<img src="images/Walksheds_and_bikesheds.png?raw=true"/>

<sub>Check out the [ArcGIS StoryMap](https://storymaps.arcgis.com/stories/1b23c0736c6140bebdc5611bc529a1d4)</sub>


---

## The Memorial-Monument Density for the University of Missouri

What does the University of Missouri memorialize and where?
> "The past is potentially contested terrain and where memorials are located - relative to a sense of time and place - plays a critical role in shaping what (and who) is ultimately remembered and forgotten" (Dwyer and Alderman, 2008).

<img src="images/MemorialDensity(50m)png.png?raw=true"/><img src="images/Chartspptx.png?raw=true"/>

<sub>Check out the [Presentation](https://github.com/ksaves/krystalsaverse.github.io/blob/master/pdf/University%20of%20Missouri%20-%20Memorial%20Landscape.pdf)</sub>


---

## Analyzing Railroad Development, Abandonment, and Historic Population Density for Central Missouri

The American rail system contributed to the growth and transportation of resources during the American industrial revolution, however, many abandoned railroads exist today. This project aims to explore local indicators which might explain railway abandonment using ArcPy

Example Code:
```
## Step 1, Import system modules

import arcpy, os
import save0004_module as sav

# Use variables from getPathInfo() module
my_ws, out_ws, out_name = sav.getPathInfo()

# Set workspace
arcpy.env.workspace = my_ws
arcpy.env.overwriteOutput = True
```

```
## Step 3, Add field "YEAR" to MO_Census_Data & calculate

# Retrieve variables from getRailInfo() module
cws = sav.getCensusFieldInfo()
mofcs = []

# Walk through files
walk = arcpy.da.Walk(cws, datatype="FeatureClass")
for dirpath, dirnames, filenames in walk:
    for filename in filenames:
        if filename.endswith("_shp"):
            mofcs.append(os.path.join(dirpath, filename))

# Execute AddField            
for entry in mofcs:
    arcpy.management.AddField(entry, "YEAR", "TEXT")

# Split file text to retrieve year
for entry in mofcs:
    x = entry.split("\\")[1]
    xx = entry.split("_")[1]
    output = int(xx)

# Execute CalculateField with retrieved year    
    arcpy.management.CalculateField(entry, "YEAR", output, "PYTHON3")
```

<img src="images/Layout3.png?raw=true"/>

<sub>Check out the [Written Report](https://github.com/ksaves/krystalsaverse.github.io/blob/master/pdf/Written%20Report.pdf)</sub>


---

# Capstone Project to be added here...
Pedestrian-Vehicle Accidents in Maricopa County, AZ
Capstone Project.


For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).
