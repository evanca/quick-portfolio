## Portfolio

---

### Category Name 1 

[Project 1 Title](/sample_page)
<img src="images/dummy_thumbnail.jpg?raw=true"/>

<style type="text/css">
			
    .label {
		font-family: Helvetica, sans-serif;
		font-size: 4px;
		fill: rgb(239,101,72);
		text-anchor: middle;
    }

</style>
<svg width="400" height="350"></svg>
<script src="https://d3js.org/d3.v7.min.js"></script>
<script type="text/javascript">

    //Width and height
    const w = 400;
    const h = 350;

    const color = d3.scaleQuantize()
    .range([`rgb(237,248,177)`,`rgb(199,233,180)`,`rgb(127,205,187)`,`rgb(65,182,196)`,`rgb(29,145,192)`,`rgb(34,94,168)`,`rgb(37,52,148)`,`rgb(8,29,88)`]);
    //YlGn scheme [`rgb(247,252,185)`,`rgb(217,240,163)`,`rgb(173,221,142)`,`rgb(120,198,121)`,`rgb(65,171,93)`,`rgb(35,132,67)`,`rgb(0,104,55)`,`rgb(0,69,41)`]
    //YlGnBu scheme [`rgb(237,248,177)`,`rgb(199,233,180)`,`rgb(127,205,187)`,`rgb(65,182,196)`,`rgb(29,145,192)`,`rgb(34,94,168)`,`rgb(37,52,148)`,`rgb(8,29,88)`]
    //Colors derived from ColorBrewer, by Cynthia Brewer, and included in https://github.com/d3/d3-scale-chromatic

    //Define path generator, using the geoMercator projection
    const projection =
            d3.geoMercator()
                .scale([1000])
                .center([185, -44]);

    const path = d3.geoPath(projection);    // same as d3.geopath().projection(projection)

    //Create SVG element
    const svg = d3.select("body")
                .append("svg")
                .attr("width", w)
                .attr("height", h);

    //Load in region data
    d3.csv("/data/nz_region_land_area.csv").then(data => {

        //Set input domain for color scale
        color.domain([
            d3.min(data, function(d) { return +d.value; }), 
            d3.max(data, function(d) { return +d.value; })
        ]);

        //Load in GeoJSON data
        d3.json("/data/nz_regions_simplified_geojson.json").then(json => {

            const formatDecimals = d3.format(",.2f");

            //Merge the region data and GeoJSON
            //Loop through once for each region land area data value
            for (i = 0; i < data.length; i++) {
        
                //Grab Region name
                const dataRegion = data[i].region;
                
                //Grab data value, and convert from string to float
                const dataValue = parseFloat(data[i].value);
        
                //Find the corresponding Region inside the GeoJSON
                for (j = 0; j < json.features.length; j++) {
                
                    const jsonRegion = json.features[j].properties.name;
        
                    if (dataRegion == jsonRegion) {
                
                        //Copy the data value into the JSON
                        json.features[j].properties.value = dataValue;
                        
                        //Stop looking through the JSON
                        break;
                        
                    }
                }		
            }
            
            //Bind data and create one path per GeoJSON feature
            const nzmap = svg.selectAll("path")
            .data(json.features)
            .enter()
            .append("path")
            .attr("d", path)                   
            .attr("fill", function(d) {
                //Get data value
                const value = d.properties.value;
                if (value) {        //If value exists…
                    return color(value);
                } else {            //If value is undefined…
                    return "#ccc";
                }});

            //Create one label per region
            const regionLabels = svg.selectAll("text")
                .data(json.features)
                .enter()
                .append("text")
                .attr("class", "label")
                .attr("x", function(d) { return path.centroid(d)[0]; })
                .attr("y", function(d) { return path.centroid(d)[1]; })
                .text(function(d) {
                    if (d.properties.value) {
                        return formatDecimals(d.properties.value);
                    }
            });

            //Load in cities data
            d3.csv("/data/nz-cities.csv").then(data => {
                
                const formatThousands = d3.format(",.2r");

                const cities = svg.selectAll("circle")
                    .data(data)
                    .enter()
                    .append("circle")
                    .attr("cx", function(d) {
                        return projection([d.lon, d.lat])[0];
                    })
                    .attr("cy", function(d) {
                        return projection([d.lon, d.lat])[1];
                    })
                    .attr("r", function(d) {
                        return Math.sqrt(parseInt(d.population) * 0.00003);
                    })
                    .attr("fill", "rgb(253,187,132)")
                    .attr("stroke", "gray")
                    .attr("stroke-width", 0.25)
                    .attr("opacity", 0.75)
                    .append("title")			//Simple tooltip
                    .text(function(d) {
                        return d.place + ": Pop. " + formatThousands(d.population);
                    });
                
            }).catch( err => {console.log(err)});

        }).catch( err => {console.log(err)});

    }).catch( err => {console.log(err)});
    
</script>

<div id='d3div'></div>

---
[Project 2 Title](/pdf/sample_presentation.pdf)
<img src="images/dummy_thumbnail.jpg?raw=true"/>

---
[Project 3 Title](http://example.com/)
<img src="images/dummy_thumbnail.jpg?raw=true"/>

---

### Category Name 2

- [Project 1 Title](http://example.com/)
- [Project 2 Title](http://example.com/)
- [Project 3 Title](http://example.com/)
- [Project 4 Title](http://example.com/)
- [Project 5 Title](http://example.com/)

---




---
<p style="font-size:11px">Page template forked from <a href="https://github.com/evanca/quick-portfolio">evanca</a></p>
<!-- Remove above link if you don't want to attibute -->
