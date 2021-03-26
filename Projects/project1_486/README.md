**Topic: Urban pollution throughout Maryland.**


**Datasets used:**

EPA Polluting Facilities Data: (https://gispub2.epa.gov/npdat/DataDownloads.html?fbclid=IwAR3etuLHt8CV9CjjA3FlqnM3_GwosszkZ-IQ846QqMLPDbDTovv4zNZVf1I, "Facilities Likely to Discharge N/P to Water")

MD Contaminated Plots Data (https://mdewin64.mde.state.md.us/LRP/index.html)

SPARROW Phosphorus Data (https://sparrow.wim.usgs.gov/sparrow-northeast-2012/, "Total Phosphorous")


**Why These Datasets?**

For this project I wanted to take a look at the relationship between urban sources of pollution and local water chemistry. To do this, I needed data on sources of urban pollution (or a sufficient proxy) and localized water quality data. This data also needed to be sufficiently contiquous in distribution, as fragmented data would be more difficult to communicate meaningfully.

I initially planned on using brownfield site distribution as a proxy for centrers of urban pollution, as brownfields are definitionally contaminated by some form of pollutant. Later in the lifecycle of the project I discovered the EPA dataset for "Facilities Likely to Discharge N/P to Water", which had some very compelling correlations with the brownfield data, and so I decided to include both in the final product.

For the water quality aspect of the project, my initial approach was to search for water quality data (specifically stream data) from  https://www.waterqualitydata.us/, but the data available there was not as useful as I had hoped it would be and I ultimately did not end up using it. After finding several fragmentary datasets of stream quality in various sections of Maryland, I wound up pivoting from looking for measured data to modeled data, as I expected that would have fewer spatial gaps in the data. This lead me to the SPARROW 2012 model, which provided, among other datasets, estimated total phosphorous data for the entire northeast US.


**Transformations, Subsets, and Analysis**

In order to map the data, I needed to first limit all of the datasets to the Maryland region. This was easily achieved simply by using the clipping tools in QGIS. The modeled dataset (when clipped) did not fill the Maryland region entirely, and I wanted to use that to clip the rest of the shapefiles. However, my attempts to do so resulted in errors, and so there are data in the final map that fall outside the area of the model. 

I attempted to restrict the brownfield dataset to only those sites within 5 miles of a poluting facility, but it turned out that every brownfield fulfilled that requirement. The brownfield dataset also contained non-brownfield sites that, while similarly contaminated, were not contaminated to the extent to be classified as brownfields. I filtered these sites out, as while they were useful for showing the relationships that I wanted to display, they created a lot of visual noise and decreased the overall legibility of the map.

Similarly, the polluting facilities dataset was split into major and minor sites based on the expected impact that those sites could have on the watersheds that they discharge into. I used these classifications to categorize the symbology for the shapefile, representing the major polluters with large red dots and the minor polluters with much smaller light blue dots. I kept the minor sites in despite removing the non-brownfield sites earlier as I felt that the minor sites were a better representation of urban pollution overall than the non-brownfield sites. If I was examining a smaller area of Maryland, I would likely include both.

The total phosphorus data provided many potential variables to base graduated symbolism on, allowing me to control for area (load vs yield), position in the larger watershed (accumulated vs incremental values), loss due to transport (delivered vs non-delivered) and even land use type (rural, urban, from manure, etc.). I found that assigning color based on the catchment's Delivered Incrimental Load of Urban Area Phosphorus (DINCL_S2) best isolated the desired factor (urban phosphorus) and, when classified around certain breaks, showed a very clear relationship between the locations of elevated phosphorus load from urban land use and the locations of the polluting facilities. 

The classification of the phosphorus data was a bit tricky, and required some trial and error to find breaks that represented the data meaningfully while also clearly showing the spatial relationship between the phosphorus loads and the distribution of polluting facilities and brownfields. While I initially classified the data by equal count, which showed quite a clear relationship between these elements (and was how I found the pattern in the first place), I was disappointed to find that the classification resulted in an almost comical legend featuring four classes for values between 0 and 30 kg phosphorus and a fifth for values between 31 and 2000 kg. While this is very much just the nature of the data (limiting the data to *urban* phosphorus naturally drops the estimated load in rural area precipitously), I felt that that was not the impression a reader would get when they saw the map and noticed the massive disparity between the classes. I analyzed the field statistics and set breaks based on multiples of the standard deviation, with each class increasing in range to capture the distribution of the values present. This resulted in the pattern being less impressive than it was previously, but it was still obvious.
