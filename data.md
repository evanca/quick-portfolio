---
layout: default
title: Data
description: Information About Variables and Features
---
## Data

# Resources
<ul>
  <li><a href="http://www.patentsview.org/web/#viz/relationships">Patents</a></li>
  <li><a href="https://www.sbir.gov">SBIR</a></li>
  <li><a href="https://api.census.gov/data.html">Census</a></li>
  <li><a href="https://www.usaspending.gov/#/download_center/custom_award_data">Federal Funding</a></li>
  <li><a href="https://data2.nhgis.org/main">Demographic</a></li>
  <li><a href="https://www.gao.gov/new.items/d04306.pdf">Empowerment Zone</a></li>
</ul>

<h2> Factors That Lead to Innovation</h2>

<p>Using previous studies, we have identified three main determinants of a city’s classification as an innovative ‘innovation hub’: regulatory, socioeconomic, and spatial. Different types of regulations include federal programs for research and development (R&D) funding, tax benefits, and government subsidies. In addition to the regulatory environment, literature also suggests that city growth can be measured by changes in demographic and socioeconomic factors. Lastly, these cities are being analyzed over time and in space to identify long-term trends and factors inherent to their geographic properties.</p>

<h2> How to Measure Innovation?</h2>
<p>The patent data obtained is from Patentsview.org. It contains detailed information on every patent assigned to a United States based organization from 1976-2014. Patents and their associated citations have shown to indicate the level of a firm’s innovative capacity, and aggregating this data by city, we can scale this model to evaluate a that capacity.</p>


<h2>Patent Scoring Method</h2>

<p>For the analyses, the patents were aggregated by city using a couple significant features of patents in the United States. Every patent has a list of assignees -- those who own the rights to the patent -- and a list of inventors -- those who contributed to the innovation itself -- each with an associated company and location. Additionally, every patent contains a number of citations -- the amount of new innovations built off of this patent. By aggregating the number of patents assigned and patents invented with their associated citations, two scores were generated that indicate innovative development: Patents Assigned and Patents Invented.</p>

 <a id="skip-to-content" href="#content">Back to Top</a>

<h2> Visualize results</h2>
<p>First: Select two cities from the search bar.</p>
<p>Second: Select a variable to plot from the checkbox.</p>

<html>
 <head>
   <meta name="description" content="Capstone-Cities">
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width">
   <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/css/select2.min.css" rel="stylesheet" />
     <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/js/select2.full.js"></script>
 <title>JS Bin</title>
 <style id="jsbin-css">
.header {
 margin-top:20px;
}

.search {
 width: 60%;
 margin-top:20px;
 margin-left:20px;
}

.label {
 text-anchor: middle;
}

.title {
 font-family: Helvetica;
 font-size: 20px;
 fill:Black;
 text-anchor: middle;
}

.axis--y1 line {
 stroke: Crimson;
}

.axis--y1 text {
 font-size: 12px;
 fill: Crimson;
}

.axis--y1 path {
 stroke: Crimson;
}

.axis--y2 line {
 stroke: SteelBlue;
}

.axis--y2 text {
 font-size: 12px;
 fill: SteelBlue;
}

.axis--y2 path {
 stroke: SteelBlue;
}

.axis--x path {
}

.axis--x text {
 font-size: 10px;
 fill:black
}

.curve {
 fill:none;
 stroke-width: 1.5;
}

.legend--frame {
 stroke: black;
 fill: ghostwhite;
}

.legend--item--box {
 stroke: black;
 fill: lightsteelblue;
}

.legend--city--box {
 stroke: black;
}

.legend--item--label {
 font-family: Helvetica;
 font-size: 14px;
 fill: black;
 alignment-baseline: central;
}
</style>
</head>
<body>
 <h2 class="header">
   Choose From the Following Cities:
 </h2>
 <hr color="purple">


 <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.9.2/d3.min.js"></script>
<script src="https://d3js.org/d3-selection-multi.v1.min.js"></script>

 <script src="https://d3js.org/d3-selection-multi.v1.min.js"></script>

<script src="https://d3js.org/d3.v5.min.js" charset="utf-8"></script>

<!--   <script src="http://cdnjs.cloudflare.com/ajax/libs/select2/3.5.0/select2.min.js"></script>
 <script src="select2.js"></script> -->
<!--
 <script type="text/javascript" src="https://select2.github.io/vendor/js/jquery.min.js"></script>
   <script type="text/javascript" src="https://select2.github.io/dist/js/select2.full.js"></script> -->


 <div id="chart">
   <div id="search">
   </div>

   <svg width="1100" height="800"></svg>  </div>
<script id="jsbin-javascript">
var STATS_BY_CITY_URL = "https://raw.githubusercontent.com/rohuniyer/a_story_of_cities_and_patents/master/city_stats.json";

Promise.all([d3.json(STATS_BY_CITY_URL)])
 .then(createChart);

function createChart(allData) {    
 var data = Object.values(allData[0]),
     citiesMap = data.map(d=>Object.entries(d))[0]
 .map(d=>{
   original = d[0];
   show = d[1].city_for_viewing;
   return {original: original, show: show};
 })
 .sort((a, b) => (a.show > b.show) ? 1 : -1),
     citiesShow = citiesMap.map(d=>d.show),
     citiesSearch = citiesShow.map((d,i)=>{return {id:i,text:d}
 }),
     features = Object.keys(
       data.map(d=>Object.values(d))
       .flat(1)[0])
 .filter(function(e) {
   return (e !== 'Year' &&
           e !== 'city_for_viewing' &&
           e !== 'scaled_population' &&
           e !== 'scaled_perc_creative_class');
 })  
 .map(d=>{
   original = d;
   show = d.toLowerCase()
     .replace('_',' ')
     .replace('_',' ')
     .replace('_',' ')
     .split(' ')
     .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
     .join(' ');
   return {original: original, show: show};
 });
 console.log(features)

 features[1].show='SBIR Award Sum';
 features[5].show='SBIR Award Mean';
 features[10].show='SBIR Company Count';
 features[23].show='Company Count Percentage';
 features[24].show='Patents (Inventors)';
 features[25].show='Patents (Assignees)';
 features.sort((a, b) => (a.show > b.show) ? 1 : -1);

 var featuresShow = features.map(d=>d.show),
     svg = d3.select("svg"),
     g = svg.append("g"),
     gPlot = svg.append("g"),
     pArea = [400, 150, 750, 500],
     pSize = [pArea[2]-pArea[0], pArea[3]-pArea[1]],
     color = ['Crimson', 'SteelBlue'];

 function cityData(city) {
   newData = data.map(d=>Object.entries(d))
     .flat(1)
     .filter(d=>(d[0]==city))
     .map(d=>d[1]);
   return newData
 }


 function createPlot(g, feature, city) {

   d3.select(".title").remove()
   d3.select(".axis--x").remove()
   d3.select(".axis--y1").remove()
   d3.select(".axis--y2").remove()
   d3.select(".curve").remove()
   d3.select(".curve").remove()

   var featureOriginal = features[featuresShow.indexOf(feature)].original,
       city1 = citiesMap[citiesShow.indexOf(city[0])].original,
       cityCount = city.length,
       data1 = cityData(city1).map(
         (d,i)=>{
           if (d!==null){
             return [d['Year'], d[featureOriginal]];
           } else {
             return [2001+i, 0];
           }
         }
       ),
       minValue1 = d3.min(data1, d=>d[1]),
       maxValue1 = d3.max(data1, d=>d[1]),
       x = d3.scaleBand()
   .domain(d3.range(2001, 2013))
   .range([pArea[0], pArea[2]]),
       xAxis = d3.axisBottom(x),
       y1 = d3.scaleLinear()
   .domain([minValue1, maxValue1])
   .range([pArea[3], pArea[1]]),
       yAxisLeft = d3.axisLeft(y1).ticks(6);

   if (maxValue1>1e3) {
     yAxisLeft.tickFormat(d3.formatPrefix(".1", 1e3));
   }

   if (maxValue1>1e6) {
     yAxisLeft.tickFormat(d3.formatPrefix(".1", 1e6));
   }

   if(cityCount==2){

     var city2 = citiesMap[citiesShow.indexOf(city[1])].original,
         data2 = cityData(city2).map(
           (d,i)=>{
             if (d!==null){
               return [d['Year'], d[featureOriginal]];
             } else {
               return [2001+i, 0]
             }
           }
         ),
         minValue2 = d3.min(data2, d=>d[1]),
         maxValue2 = d3.max(data2, d=>d[1]),
         y2 = d3.scaleLinear()
     .domain([minValue2, maxValue2])
     .range([pArea[3], pArea[1]]),
         yAxisRight= d3.axisRight(y2).ticks(6);

     if (maxValue2>=1e3) {
       yAxisRight.tickFormat(d3.formatPrefix(".1", 1e3));
     }

     if (maxValue2>1e6) {
       yAxisRight.tickFormat(d3.formatPrefix(".1", 1e6));
     }
   }

   gPlot.append("text")
     .attr("class", "title")
     .attr("x", (x.range()[0]+x.range()[1])*0.5)
     .attr("y", 130)
     .text(feature+" from 2001-2012");

   gPlot.append("rect")
     .attr("x", pArea[0])
     .attr("y", pArea[1])
     .attr("width", pSize[0])
     .attr("height", pSize[1])
     .attr('fill', 'none')

   gPlot.append('g')
     .attr("class", "axis axis--x")
     .attr("transform", `translate(0,${pArea[3]})`)
     .call(xAxis)
     .append("text")
     .attr("class", "label")
     .attr("x", (x.range()[0]+x.range()[1])*0.5)
     .attr("y", 40)
     .text("Year");

   gPlot.append('g')
     .attr("class", "axis axis--y1")
     .attr("transform", `translate(${pArea[0]},0)`)
     .call(yAxisLeft)
     .append("text")
     .attr("class", "label")
     .attr("transform", "rotate(-90)")
     .attr("x", -(y1.range()[0]+y1.range()[1])*0.5)
     .attr("y", -60)
     .text(feature +' for ' + city[0]);

   gPlot.append('path')
     .attr("class", "curve")
     .datum(data1)
     .transition().duration(4000)
     .attr("stroke", color[0])
     .attr("d", d3.line()
           .curve(d3.curveMonotoneX)
           .x(d=>x(d[0])+14.5)
           .y(d=>y1(d[1])));     

   if (cityCount==2){

     gPlot.append('path')
       .attr("class", "curve")
       .datum(data2)
       .transition().duration(2000)
       .attr("stroke", color[1])
       .attr("d", d3.line()
             .curve(d3.curveMonotoneX)
             .x(d=>x(d[0])+14.5)
             .y(d=>y2(d[1])));

     gPlot.append('g')
       .attr("class", "axis axis--y2")
       .attr("transform", `translate(${pArea[2]},0)`)
       .call(yAxisRight)
       .append("text")
       .attr("class", "label")
       .attr("transform", "rotate(90)")
       .attr("x", (y2.range()[0]+y2.range()[1])*0.5)
       .attr("y", -60)
       .text(feature + ' for ' + city[1]);
   }

   var cityLegend = gPlot.append("g")
   .attr("transform", `translate(${pArea[2]+70}, ${pArea[1]})`);

   cityLegend.append("rect")
     .attr("class", "legend--frame")
     .attr("x", 0)
     .attr("y", 0)
     .attr("width", 190)
     .attr("height", 50);

   var legendNames =cityLegend.selectAll(".legend--item--box")
   .data(city)
   .enter().append("g");

   legendNames.append("rect")
     .attr("class", "legend--city--box")
     .attr("x", 5)
     .attr("y", (d,i) => (i*20+10))
     .attr("width", 10)
     .attr("height", 10)
     .attr("fill", (d,i)=>color[i]);

   legendNames.append("text")
     .attr("class", "legend--item--label")
     .attr("x", 25)
     .attr("y", (d,i) => (i*20+15))
     .text((d, i) => d);

 }

 createPlot(g, 'Patents (Assignees)', ["Green Bay, WI", "San Jose, CA"])


 $('#search').select2({
   data: citiesSearch,
   placeholder: "Select a City",
   multiple:'multiple',
   allowClear: true,
   maximumSelectionLength: 2,
   containerCssClass: "search"});

 var legend = g.append("g")
 .attr("transform", "translate(20,30)");

 legend.append("rect")
   .attr("class", "legend--frame")
   .attr("x", 0)
   .attr("y", 0)
   .attr("width", 240)
   .attr("height", 630);

 var legendItems = legend.selectAll(".legend--item--box")
 .data(featuresShow)
 .enter().append("g");

 legendItems.append("rect")
   .attr("class", "legend--item--box")
   .attr("x", 5)
   .attr("y", (d,i) => (i*20+10))
   .attr("width", 10)
   .attr("height", 10);

 legendItems.append("text")
   .attr("class", "legend--item--label")
   .attr("x", 25)
   .attr("y", (d,i) => (15+i*20))
   .text((d, i) => d);


 $("#search").on('change', function(){
   var output = ($("#search").select2('data')
                 .map(d=>Object.values(d)[2]));
   legendItems.on("click", d=>{createPlot(gPlot, d, output)});
 })
}
</script>

</body>
</html>
__

<h2> Regulatory Data</h2>

<p>A federal award can be defined as money the federal government has promised to pay to companies, organizations, government entities or individuals. This is done by contracts, grants, loans or direct payments. Federal awards data are available from 2001 to 2018 with each year having millions of awards. Each award has 260 features ranging from funding agency, federal obligation, to recipient, and performance center, and location.
Each year’s data was aggregated to average amount of federal obligation and total number of awards based on recipient city and primary place of performance. The average amount was used instead of the total amount of federal obligation to account for the large variation in the sizes of cities being analyzed. </p>
<p>Empowerment Zone’s and the Small Business Innovation Research (SBIR) program were investigated as well. The SBIR program is a federal funding program that enables small businesses to get financial awards from federal agencies' R&D budgets helping thousands of small businesses with over $100 million awarded every year since 1982. For the SBIR program, data are available from 1983 to 2019 with an average of six thousand awards each year and each award containing general information of each business including its location, the amount of award the business receives, its funding agency and topic/field for each awarded project.</p>

<h2>City Diversity Data</h2>

<p>Demographic and household data can be collected decennially going back to 1970 from the Census’ IPUMS National Historic GIS at the place levels for the entire U.S. Features of interest include total population, median household income, education, and nativity.</p>

<p>In order to determine how many people fit Richard Florida’s creative class, we collected US Economic 5 Year Data from the Census API. Years available were 1997, 2002, 2007, and 2012. Data collected includes the number of employers and employees per each job title as described by North American Industry Classification System (NAICS) per Census designated place. Richard Florida describes the creative class as those in academia, arts, and other professions requiring an advanced degree. We mapped the job titles to create or not, and summed the number of creative and non-creative employees per city in order to determine the size of each city’s creative class.</p>

<a id="skip-to-content" href="#content">Back to Top</a>

<h2> Data Aggregation</h2>

<p>A unique code per each city was designed as such, city_state (ex. sanjose_ca), among all datasets in order to join them. We then performed a left join on of our collected and processed data onto the patent data in order to keep as many of the original 1000 top patent producing cities. All final features and their explanations can be found within the appendix.</p>

<h2> Limitations</h2>

<p> A major limitation faced by this experiment was the decline in number of municipalities through various stages of this study. With the original top 1,000 patent producing cities, the retention rate after all the joins with other datasets was found to be between 55%-80%. One reason this occurred was due to PatentsView irregular use of geographies within the same location feature. For instance New York City, NY and Woodlawn, IL -- a neighborhood within Chicago -- were both listed within the top 1,000 patent producing cities. Finding neighborhood level data across various data sources was not possible and, as a result, neighborhoods, towns, and small municipalities were mostly dropped. This amount of data reduction allowed for limited model selection, with the random forest and logistic regressions as the best options. </p>
<p>External data sets not only limited the number of cities, but also the years of analysis. PatentsView data went back to the 1970s, however, between all these external data sources, the window of analysis was shorted to 2001 through  2012. This window allows for the experiment to determine what features are significant to city patent production, but not how these cities became patent producing 'hubs'.
</p>

<a id="skip-to-content" href="#content">Back to Top</a>
