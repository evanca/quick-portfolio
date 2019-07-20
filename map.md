---
layout: default
title: Story Map
description: Our Final Results
customjs:
 - https://d3js.org/d3.v3.min.js
---
# Story Map

<!DOCTYPE html>
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
