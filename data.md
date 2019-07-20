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
  <li><a href="https://github.com/rohuniyer/a_story_of_cities_and_patents">Federal Funding</a></li>
  <li><a href="https://data2.nhgis.org/main">Demographic</a></li>
  <li><a href="https://www.hud.gov/program_offices/comm_planning/economicdevelopment/programs/rc/ezcontacts">Empowerment Zone</a></li>
</ul>
# Patents as Innovation

<i>Ever since The first Patent Act of the U.S. Congress in 1790, the patent has been a key representation of innovation and progress in the United States.</i>

<p>For our project, we collect, engineer, and compare two sets of features: to measure innovation itself and to explain its growth in a city. For the former, we use the thorough patent data from Patentsview.org containing detailed information on every patent assigned to a United States based organization from 1976-2014.</p>

## How to Measure Innovation?
<p><i>Data from patent applications, provided by the PatentsView API will serve as a measure for innovation:</i>

<br>
Patent classifications, types, organizations along with other engineered features are included in our model to create a logistic regression and a random forest regression. Below we will outline the key variables that lead to increased overall patent production and how this project will classify innovation hubs.

The PatentsView data gives a precise description of every successful patent application, including geographic features such as assignee and inventor locations, patent classification features, assignee organization and type, and patent forward and backward citations.</p>


## Ranked Score - Top 5 Cities 'Innovation Hub' Indicators

<p><i>Aggregating the patent data by its city helps paint a picture of each city for each year through an innovative lens.</i>

<br>
 After aggregation, each city contains fields on the number of assignee patents, inventor patents, the ratio of inventor to assignee patents, citations for assignee and inventor patents, the ratio of citations to patents, proportion of patents being classified into the 8 high-level WIPO classifications, the type of assignee organization (including US/Foreign corporations, governments and individuals), and the patent type (utility, reissue, design, defensive). Below are the top 5 cities for each score, which has been standardized to account for the various different skewed features with one standard function.</p>

 <a id="skip-to-content" href="#content">Back to Top</a>

# Visualize results
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
     margin-left:20px;
   }

   .About {
     margin-top:20px;
     margin-left:20px;
   }

   .search {
     width: 60%;
     margin-top:20px;
     margin-left:20px;
   }

   .label {
     fill: black;
     font-family: Helvetica;
     font-size: 14px;
     text-anchor: middle;
   }

   .title {
     fill:Black;
   }

   .axis--y1 path {
   }

 .axis--y2 path {
   }

   .axis--x path {
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

 .grid path {
   display: none;
 }

 .grid line {
   stroke: lightgrey;
   opacity: 0.7;
 }

 .grid text {
   display:none;
 }
 </style>
 </head>
 <body>
   <h2 class="header">
     Choose from the following cities
   </h2>
   <hr color="purple">
     <p class="About">
       About: <br />
     </p>

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

     <svg width="1000" height="800"></svg>  </div>
 <script id="jsbin-javascript">
 var STATS_BY_CITY_URL = "https://raw.githubusercontent.com/rohuniyer/a_story_of_cities_and_patents/master/city_stats.json";
 var TEST_URL = "https://raw.githubusercontent.com/tingyuc3/Data/master/cityTest.json";

 Promise.all([d3.json(STATS_BY_CITY_URL)])
   .then(createChart);

 // d3.json("https://raw.githubusercontent.com/rohuniyer/a_story_of_cities_and_patents/master/city_stats.json", function (stats){
 //     var allData = stats
 //    createChart(allData);
 //     });

 // d3.json(STATS_BY_CITY_URL).then(createChart)

 function createChart(allData) {    
   var data = Object.values(allData[0]),
       cities  = data
   .map(d=>Object.keys(d))[0]
   .map((d,i)=>{
     return {id:i,text:d};}),
       //   .map((d,i)=>{city = d.split('_')[0];
       //                state = d.split('_')[1];
       //                city_state = city[0].toUpperCase()+city.slice(1)+', '+state.toUpperCase();
       //                return {id:i,text:city_state};}),

             features = Object.keys(
               data.map(d=>Object.values(d))
               .flat(1)[1])
         .sort(),
 //       features = ['regular_establishments',
 //                   'Award Sum',
 //                   'total_earned_bachelor',
 //                   'percent_graduate',
 //                   'performance_amount',
 //                   'Score_invented',
 //                   'Award Mean',
 //                   'total_less_than_bachelor',
 //                   'total_foreign',
 //                   'median_household_income',
 //                   'scaled_population',
 //                   'scaled_perc_creative_class',
 //                   'Company Count',
 //                   'total_earned_graduate_degree',
 //                   'percent_foreign_born',
 //                   'recipient_count',
 //                   'total_population',
 //                   'recipient_amount',
 //                   'total_native',
 //                   'percent_creative_class',
 //                   'Score_assigned',
 //                   'percent_bachelors',
 //                   'empowerment_zone',
 //                   'performance_count',
 //                   'creative_establishment_ratio',
 //                   'company_count_perc',
 //                   'inventor_patents',
 //                   'Patents',
 //                   'city_for_viewing',
 //                   'performance_mean',
 //                   'regular_employees',
 //                   'creative_employees',
 //                   'Year',
 //                   'creative_establishments',
 //                   'recipient_mean'],

       //   .map(d=>d
       //        .replace('_',' ')
       //        .replace('_',' ')
       //        .replace('_',' '))
       svg = d3.select("svg"),
       g = svg.append("g"),
       gPlot = svg.append("g"),
       pArea = [400, 150, 750, 500],
       pSize = [pArea[2]-pArea[0], pArea[3]-pArea[1]],
       color = ['red', 'blue'];    

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

     var cityCount = city.length,
         data1 = cityData(city[0]).map(
           (d,i)=>{
             if (d!==null){
               return [d['Year'], d[feature]];
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
     .domain([minValue1*0.9, maxValue1*1.1])
     .range([pArea[3], pArea[1]]),
         yAxisLeft = d3.axisLeft(y1);

     if(cityCount==2){
       var data2 = cityData(city[1]).map(
         (d,i)=>{
           if (d!==null){
             return [d['Year'], d[feature]];
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
           yAxisRight= d3.axisRight(y2);

       //           minValue = Math.min(d3.min(data1, d=>d[1]), d3.min(data2, d=>d[1]));
       //           maxValue = Math.max(d3.max(data1, d=>d[1]), d3.max(data2, d=>d[1]));
     }

     //         console.log(d3.max(data1, d=>d[1]))
     //         console.log(d3.max(data2, d=>d[1]))
     //         console.log(data1)
     //         console.log(data2)

     gPlot.append("text")
       .attr("class", "title")
       .attr("x", x.range()[0]+20)
       .attr("y", 130)
       .text(feature+" from 2001-2012");

     gPlot.append("rect")
       .attr("x", pArea[0])
       .attr("y", pArea[1])
       .attr("width", pSize[0])
       .attr("height", pSize[1])
       .attr('fill', 'seashell')

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
       .attr("y", -70)
       .text(feature);


     //     gPlot.append("g")
     //     .attr("class", "axis grid")
     //     .attr("transform", `translate(0,${pArea[3]})`)
     //     .call(d3.axisBottom(x)
     //           .ticks(5, "I")
     //           .tickSizeInner(-350));

     gPlot.append('path')
       .datum(data1)
       .transition().duration(2000)
       .attr("fill", "none")
       .attr("stroke", color[0])
       .attr("stroke-width", 1.5)
       .attr("d", d3.line()
             .curve(d3.curveBasis)
             .x(d=>x(d[0])+14.5)
             .y(d=>y1(d[1])));     

     if (cityCount==2){
       gPlot.append('path')
         .datum(data2)
         .transition().duration(2000)
         .attr("fill", "none")
         .attr("stroke", color[1])
         .attr("stroke-width", 1.5)
         .attr("d", d3.line()
               .curve(d3.curveBasis)
               .x(d=>x(d[0])+14.5)
               .y(d=>y2(d[1])));

       gPlot.append('g')
         .attr("class", "axis axis--y2")
         .attr("transform", `translate(${pArea[2]},0)`)
         .call(yAxisRight)
         .append("text")
         .attr("class", "label")
         .attr("transform", "rotate(-90)")
         .attr("x", -(y2.range()[0]+y2.range()[1])*0.5)
         .attr("y", 70)
         .text(feature);
     }


     var cityLegend = gPlot.append("g")
     .attr("transform", `translate(${pArea[2]+70}, ${pArea[1]})`);

     cityLegend.append("rect")
       .attr("class", "legend--frame")
       .attr("x", 0)
       .attr("y", 0)
       .attr("width", 120)
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
       .attr("y", (d,i) => (15+i*20))
       .text((d, i) => d);

   }

   $('#search').select2({
     data: cities,
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
     .attr("width", 250)
     .attr("height", 710);

   var legendItems = legend.selectAll(".legend--item--box")
   .data(features)
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

 //   console.log($("#search").select2('data'))  

   $("#search").on('change', function(){
     var output = ($("#search").select2('data')
                   .map(d=>Object.values(d)[2]));
     legendItems.on("click", d=> createPlot(gPlot, d, output));
   })
 }
 </script>

 </body>
 </html>

# Factors That Lead to Innovation

_Using previous studies, we have identified three main determinants of an innovative ecosystem: regulatory, socioeconomic, and spatial._

<p>Different types of regulations include federal programs for R&D funding, tax benefits, and government subsidies. In addition to the regulatory environment, literature also suggests that city growth can be measured by changes in demographic and economic factors.</p>

## Regulatory Data

_We have looked into federal awards -- money that the federal government has promised to pay to companies, organizations, government entities or individuals by contracts, grants, loans or direct payments._
<br>
<p> For federal awards, data are available from 2001 to 2018 with each year having millions of awards and each award having 260 columns of information about funding agency, federal obligation, as well as recipient, and performance center, locations.
For each year’s data, we aggregate average amount of federal obligation and total number of awards based on city of addresses for both recipient and primary place of performance. We use average amount instead of total amount of federal obligation as cities are having different scale of population and amount of businesses.</p>

<p>We also investigated the Empowerment Zone and the Small Business Innovation Research (SBIR) program. The SBIR program is a federal funding program that enables small businesses to get financial awards from federal agencies' R&D budgets which has helped thousands of small businesses with over $100 million every year since 1982.[17] For the SBIR program, data are available from 1983 to 2019 with an average of 6k awards each year and each award contains general information of business including its location, the amount of award the business receives, its funding agency and topic/field for each awarded project. We calculate the average amount of funding per business received and number of businesses awarded for each city in our model aiming to measure if this program has encouraged innovation toward cities. </p>

## City Diversity Data

_Demographic and household data can be collected decennially going back to 1970 from the IPUMS National Historic GIS at the census tract levels for the entire US._
<br>
<p>Feature of interest include total population, population by income bracket, and nativity. These tract populations were aggregated to specific cities using the open source OSMNX city shape-files available,  even down to the townships level.
In order to determine how many people fit Richard Florida’s creative class, we collected US Economic 5 Year Data from the Census API. Years available were 1997, 2002, 2007, and 2012. Data collected includes the number of employers and employees per each job title as described by North American Industry Classification System (NAICS) per each Census designated place. Richard Florida describes the creative class as those in academia, arts, and other professions requiring an advanced degree. We mapped the job titles to create or not, and summed the number of creative and non-creative employees per each city in order to determine the size of each city’s creative class.</p>

<a id="skip-to-content" href="#content">Back to Top</a>

### Data Aggregation

<p>A unique code per each city was designed among all datasets in order to join them. This was created by taking the city name, text processing, and appending the lower cased state abbreviation. We then performed a left join on of our collected and processed data onto the patent data in order to keep as many of the original 1000 top patent producing cities. </p>

## Limitations

<p> A major limitation faced by this experiment was the decline in number of municipalities through various stages of this study. With the original top 1,000 patent producing cities, the retention rate after all the joins with other datasets was found to be between 55%-80%. One reason this occurred was due to PatentsView irregular use of geographies within the same location feature. For instance New York City, NY and Woodlawn, IL, a neighborhood within Chicago, were both listed within the top 1,000 patent producing cities. Finding neighborhood level data (being federal funding, socio-economic, etc.) was not possible and, as a result, neighborhoods, towns, and small municipalities were largely dropped. This amount of data reduction allowed for limited model selection, with the random forest and logistic regressions as the best options. External data sets not only limited the number of cities, but also the years of analysis. PatentsView data went back to the 1970s. However, between all these external data sources, the window of analysis was found between 2001 and  2012. This window allows for the experiment to determine what features are significant to city patent production, but not how these cities became patent producing 'hubs'. Lastly, this time frame also includes two recessions, one being the Great Recession, resulting in outlier data found in 2008 across many features.</p>

<a id="skip-to-content" href="#content">Back to Top</a>
