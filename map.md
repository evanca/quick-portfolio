---
layout: default
title: Story Map
description: Final Results
---
# Story Map

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>JS Bin</title>
<style>

<style>

.background {
  fill: #eee;
  pointer-events: all;
}
.background-trial {
  fill: 'black';
}
.button {
  position: relative;
}
.map-layer {
  fill: #fff;
  stroke: #aaa;
  float: left;
}
.effect-layer{
  pointer-events:none;
}
text{
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-weight: 300;
}
text.big-text{
  font-size: 30px;
  font-weight: 400;
}
.effect-layer text, text.dummy-text{
  font-size: 12px;
}
.tooltip {
  position: absolute;
  z-index: 10;
  visibility: hidden;
  background: Beige;
}
</style>
</head>
<body>
<div style="text-align: left;">
    <div style="display: inline-block; text-align: left;">
      <script src="https://d3js.org/d3.v3.min.js"></script>
          <div id = 'chart1'>
            <div id = 'title_div'>
            </div>
            <div id = 'dropdown'></div>
        </div>

      <script>
      var width = 1160,
          height = 600,
          centered;
      // Define color scale
      var color = d3.scale.linear()
        .domain([1, 5])
        .clamp(true)
        .range(['white', 'SteelBlue']);
      var projection = d3.geo.mercator()
                           .scale(900)
                           .center([-103.7,38])
                           .translate([(width)/2, (height)/2])
      var path = d3.geo.path()
        .projection(projection);
      var title_svg = d3.select('#title_div')
        .append('svg')
        .attr('width', width)
        .attr('height', 100);
        title_svg.append('rect')
          .attr('class', 'background')
          .attr('width', width)
          .attr('height', 100);
      // Set svg width & height
      var svg = d3.select('#chart1')
        .append('svg')
        .attr('width', width)
        .attr('height', height);
      // Add background
      svg.append('rect')
        .attr('class', 'background')
        .attr('width', width)
        .attr('height', height);
      var filter_y = 77;
      var filter_text = 90;
      var assigned = true;
      var years = [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012];
      title_svg.append('text').text('Patents: ').attr('x', 10).attr('y', filter_text);
      var assigned_filter = title_svg.append('rect')
        .attr('id', 'assigned_filter')
        .attr('width', 70)
        .attr('height', 18)
        .attr('x', -100)
        .attr('y', filter_y)
        .style('opacity', 0.5);
        title_svg.append('text').text('Assigned').attr('x', 90).attr('y', filter_text).style('font-size', 12);
      var invented_filter = title_svg.append('rect')
        .attr('id', 'invented_filter')
        .attr('width', 70)
        .attr('height', 18)
        .attr('x', 150)
        .attr('y', filter_y)
        .style('opacity', 0.2);
        title_svg.append('text').text('Invented').attr('id', 'invented_filter').attr('x', 165).attr('y', filter_text).style('font-size', 12);
      // var xScale = d3.scale.linear()
      //           .domain([0, d3.max(years)])
      //           .range([200, 700]);
      // console.log(xScale);
      // var year_filter = title_svg.append('rect')
      //   .attr('id', 'year_filter')
      var g = svg.append('g');
      var effectLayer = g.append('g')
        .classed('effect-layer', true);
      var mapLayer = g.append('g')
        .classed('map-layer', true);
      var dummyText = g.append('text')
        .classed('dummy-text', true)
        .attr('x', 10)
        .attr('y', 30)
        .style('opacity', 0);
      var bigText = g.append('text')
        .classed('big-text', true)
        .attr('x', 20)
        .attr('y', 45);
      var tooltip = d3.select('#chart1')
             .append('g')
             .attr('class', 'tooltip');
      svg.append('rect')
        .attr('id', 'summary_stats')
        .attr('width', (width / 5) + 20)
        .attr('height', 900)
        .attr("transform","translate(0,0)")
        .attr("fill", "SteelBlue")
        .style('opacity', 0.1)
        .attr('stroke', 'black')
        .attr('stroke-width', 0.2);
      title_svg.append('text')
        .attr('id', 'title')
        .text('Top Innovative Cities in the United States')
        .attr('font-size', 20)
        .attr('x', 400)
        .attr('y', 30);
      svg.append('text')
        .attr('id', 'year')
        .text('Year: ')
        .attr('font-weight', 'bold')
        .attr('font-size', 12)
        .attr('x', 10)
        .attr('y', 30);
      svg.append('text')
        .attr('id', 'top_features')
        .text('Logistic Regression Coefficients: ')
        .attr('font-weight', 'bold')
        .attr('font-size', 12)
        .attr('x', 10)
        .attr('y', 50);
      svg.append('text')
        .text('Feature')
        .attr('font-weight', 'bold')
        .attr('font-size', 12)
        .attr('x', 20)
        .attr('y', 80);
      svg.append('text')
        .text('Assigned')
        .attr('font-weight', 'bold')
        .attr('font-size', 12)
        .attr('x', 120)
        .attr('y', 80);
      svg.append('text')
          .text('Invented')
          .attr('font-weight', 'bold')
          .attr('font-size', 12)
          .attr('x', 180)
          .attr('y', 80);
      svg.append('text')
        .text('Top Cities: ')
        .attr('id', 'top_cities')
        .attr('font-weight', 'bold')
        .attr('font-size', 12)
        .attr('x', 10)
        .attr('y', 250);
      svg.append('text')
        .text('Place: ')
        .attr('font-weight', 'bold')
        .attr('font-size', 12)
        .attr('x', 10)
        .attr('y', 400);
      svg.append('text')
        .text('Total Patents: ')
        .attr('font-weight', 'bold')
        .attr('font-size', 12)
        .attr('x', 10)
        .attr('y', 420);
      svg.append('text')
        .text('Total Invented Patents: ')
        .attr('font-weight', 'bold')
        .attr('font-size', 12)
        .attr('x', 10)
        .attr('y', 440);
      svg.append('text')
        .text('Average SBIR Funding: ')
        .attr('font-weight', 'bold')
        .attr('font-size', 12)
        .attr('x', 10)
        .attr('y', 460);
      svg.append('text')
        .text('Percent Creative Class: ')
        .attr('font-weight', 'bold')
        .attr('font-size', 12)
        .attr('x', 10)
        .attr('y', 480);
      svg.append('text')
        .text("Percent Bachelor's Deg: ")
        .attr('font-weight', 'bold')
        .attr('font-size', 12)
        .attr('x', 10)
        .attr('y', 500);
      svg.append('text')
        .text("Percent Graduate Deg: ")
        .attr('font-weight', 'bold')
        .attr('font-size', 12)
        .attr('x', 10)
        .attr('y', 520);
      svg.append('text')
        .text("Percent Foreign Born: ")
        .attr('font-weight', 'bold')
        .attr('font-size', 12)
        .attr('x', 10)
        .attr('y', 540);
      svg.append('text')
        .text("Median Household Income: ")
        .attr('font-weight', 'bold')
        .attr('font-size', 12)
        .attr('x', 10)
        .attr('y', 560);
      d3.json('https://gist.githubusercontent.com/rohuniyer/c44fead13bb1f6ec517bdb53f36870da/raw/aba3df59a745810f7afef833b0728a6b70ba8129/new_cities_stats.json', function(error, mapData) {
        //console.log(mapData.features[0].properties.place_name)
        var features = mapData.features;
        var spacing = 20;
        var f_3 = d3.format(".3f");
        var f_1 = d3.format(",.0f");
        var year = 2001;
        d3.csv('https://raw.githubusercontent.com/rohuniyer/a_story_of_cities_and_patents/master/csv_for_summary.csv',
          function(data) {
            //console.log(data[0]);
            var annualPatentSummary = d3.nest()
              .key(function(d) { return d.Year; })
              .rollup(function(v) { return d3.sum(v, function(d) { return d['Patents']; }); })
              .entries(data);
            var annualInventorPatentSummary = d3.nest()
                .key(function(d) { return d.Year; })
                .rollup(function(v) { return d3.sum(v, function(d) { return d.inventor_patents; }); })
                .entries(data);
            var annualSBIRSummary = d3.nest()
              .key(function(d) { return d.Year; })
              .rollup(function(v) { return d3.mean(v, function(d) { return d['Award Mean']; }); })
              .entries(data);
            var annualCC = d3.nest()
              .key(function(d) { return d.Year; })
              .rollup(function(v) { return d3.mean(v, function(d) { return d.percent_creative_class; }); })
              .entries(data);
            var annualBachelors = d3.nest()
              .key(function(d) {return d.Year; })
              .rollup(function(v) { return d3.mean(v, function(d) { return d.percent_bachelors; }); })
              .entries(data);
            var annualGraduate = d3.nest()
              .key(function(d) { return d.Year; })
              .rollup(function(v) { return d3.mean(v, function(d) { return d.percent_graduate; }); })
              .entries(data);
            var annualForeignBorn = d3.nest()
              .key(function(d) { return d.Year; })
              .rollup(function(v) { return d3.mean(v, function(d) { return d.percent_foreign_born; }); })
              .entries(data);
            var annualMedianIncome = d3.nest()
              .key(function(d) { return d.Year; })
              .rollup(function(v) { return d3.mean(v, function(d) { return d.median_household_income; }); })
              .entries(data);
            var topCities = d3.nest()
              .key(function(d) { return d.Year; })
              .entries(data);
            function rank_inventor_cities() {
              var ranked_cities = [];
              for (var i = 0; i < Object.keys(topCities).length; i++) {
                ranked_cities.push(topCities[i].values.map(d => [d.city_state, d.inventor_patents]));
              }
              for (var i = 0; i < ranked_cities.length; i++) {
                ranked_cities[i].sort(function (a, b) {
                  return b[1] - a[1];
                })
                ranked_cities[i] = ranked_cities[i].map(d => d[0]);
              }
              return ranked_cities;
            }
            var ranked_inventor_cities = rank_inventor_cities();
            function get_cities() {
              var ranked_cities = []
              for (var i = 0; i < Object.keys(topCities).length; i++) {
                ranked_cities.push(topCities[i].values.map(d => d.city_state));
              }
              return ranked_cities;
            }
            var ranked_cities = get_cities();
            d3.csv('https://raw.githubusercontent.com/rohuniyer/a_story_of_cities_and_patents/master/regression_results.csv',
              function(regression_data) {
                var annualRegressionSummary = d3.nest()
                  .key(function(d) { return d.Year; })
                  .key(function(v) { return v.score; })
                  .entries(regression_data);
                function regression_results_text() {
                  var results_y = 100;
                  //Award Mean
                  svg.append('text')
                    .text('SBIR Mean: ')
                    .attr('font-size', 12)
                    .attr('x', 20)
                    .attr('y', results_y);
                  svg.append('text')
                    .text(function(d) {
                      return f_3(annualRegressionSummary[year-2001].values[0].values[0].award_mean);
                    })
                    .attr('id', 'award_mean_sa')
                    .attr('font-size', 12)
                    .attr('x', 120)
                    .attr('y', results_y);
                  svg.append('text')
                    .text(function(d) {
                      return f_3(annualRegressionSummary[year-2001].values[1].values[0].award_mean);
                    })
                    .attr('id', 'award_mean_si')
                    .attr('font-size', 12)
                    .attr('x', 180)
                    .attr('y', results_y);
                  //Perc Creative Class
                  svg.append('text')
                    .text('Creative Class: ')
                    .attr('font-size', 12)
                    .attr('x', 20)
                    .attr('y', results_y + spacing);
                  svg.append('text')
                    .text(function(d) {
                      return f_3(annualRegressionSummary[year-2001].values[0].values[0].scaled_perc_creative_class);
                    })
                    .attr('id', 'scaled_perc_creative_class_sa')
                    .attr('font-size', 12)
                    .attr('x', 120)
                    .attr('y', results_y + spacing);
                  svg.append('text')
                    .text(function(d) {
                      return f_3(annualRegressionSummary[year-2001].values[1].values[0].scaled_perc_creative_class);
                    })
                    .attr('id', 'scaled_perc_creative_class_si')
                    .attr('font-size', 12)
                    .attr('x', 180)
                    .attr('y', results_y + spacing);
                  //Perc Bachelors
                  svg.append('text')
                    .text('Bachelors Deg.: ')
                    .attr('font-size', 12)
                    .attr('x', 20)
                    .attr('y', results_y + (2*spacing));
                  svg.append('text')
                    .text(function(d) {
                      return f_3(annualRegressionSummary[year-2001].values[0].values[0].percent_bachelors);
                    })
                    .attr('id', 'percent_bachelors_sa')
                    .attr('font-size', 12)
                    .attr('x', 120)
                    .attr('y', results_y + (2*spacing));
                  svg.append('text')
                    .text(function(d) {
                      return f_3(annualRegressionSummary[year-2001].values[1].values[0].percent_bachelors);
                    })
                    .attr('id', 'percent_bachelors_si')
                    .attr('font-size', 12)
                    .attr('x', 180)
                    .attr('y', results_y + (2*spacing));
                  //Perc Graduate
                  svg.append('text')
                    .text('Graduates Deg.: ')
                    .attr('font-size', 12)
                    .attr('x', 20)
                    .attr('y', results_y + (3*spacing));
                  svg.append('text')
                    .text(function(d) {
                      return f_3(annualRegressionSummary[year-2001].values[0].values[0].percent_graduate);
                    })
                    .attr('id', 'percent_graduate_sa')
                    .attr('font-size', 12)
                    .attr('x', 120)
                    .attr('y', results_y + (3*spacing));
                  svg.append('text')
                    .text(function(d) {
                      return f_3(annualRegressionSummary[year-2001].values[1].values[0].percent_graduate);
                    })
                    .attr('id', 'percent_graduate_si')
                    .attr('font-size', 12)
                    .attr('x', 180)
                    .attr('y', results_y + (3*spacing));
                    //Perc Foreign Born
                    svg.append('text')
                      .text('Foreign Born: ')
                      .attr('font-size', 12)
                      .attr('x', 20)
                      .attr('y', results_y + (4*spacing));
                    svg.append('text')
                      .text(function(d) {
                        return f_3(annualRegressionSummary[year-2001].values[0].values[0].percent_foreign_born);
                      })
                      .attr('id', 'percent_foreign_born_sa')
                      .attr('font-size', 12)
                      .attr('x', 120)
                      .attr('y', results_y + (4*spacing));
                    svg.append('text')
                      .text(function(d) {
                        return f_3(annualRegressionSummary[year-2001].values[1].values[0].percent_foreign_born);
                      })
                      .attr('id', 'percent_foreign_born_si')
                      .attr('font-size', 12)
                      .attr('x', 180)
                      .attr('y', results_y + (4*spacing));
                    //Recipient Mean
                    svg.append('text')
                      .text('Federal Funding: ')
                      .attr('font-size', 12)
                      .attr('x', 20)
                      .attr('y', results_y + (5*spacing));
                    svg.append('text')
                      .text(function(d) {
                        return f_3(annualRegressionSummary[year-2001].values[0].values[0].recipient_mean);
                      })
                      .attr('id', 'recipient_mean_sa')
                      .attr('font-size', 12)
                      .attr('x', 120)
                      .attr('y', results_y + (5*spacing));
                    svg.append('text')
                      .text(function(d) {
                        return f_3(annualRegressionSummary[year-2001].values[1].values[0].recipient_mean);
                      })
                      .attr('id', 'recipient_mean_si')
                      .attr('font-size', 12)
                      .attr('x', 180)
                      .attr('y', results_y + (5*spacing));
                    //Median Household Income
                    svg.append('text')
                      .text('Household Income: ')
                      .attr('font-size', 12)
                      .attr('x', 20)
                      .attr('y', results_y + (6*spacing));
                    svg.append('text')
                      .text(function(d) {
                        return f_3(annualRegressionSummary[year-2001].values[0].values[0].median_household_income);
                      })
                      .attr('id', 'median_household_income_sa')
                      .attr('font-size', 12)
                      .attr('x', 120)
                      .attr('y', results_y + (6*spacing));
                    svg.append('text')
                      .text(function(d) {
                        return f_3(annualRegressionSummary[year-2001].values[1].values[0].median_household_income);
                      })
                      .attr('id', 'median_household_income_si')
                      .attr('font-size', 12)
                      .attr('x', 180)
                      .attr('y', results_y + (6*spacing));
                }
                regression_results_text();
        d3.json('https://raw.githubusercontent.com/rohuniyer/a_story_of_cities_and_patents/master/city_stats.json', function(error, cityData) {
          var centroids = features.map(function (feature){
            return path.centroid(feature);
          });
            var years = Object.keys(cityData).sort();
            var dropdown = d3.select("#chart1")
                          .append('select')
                          .attr('x', 40)
                          .attr('y', 100);
            dropdown.selectAll("option")
                          .data(years)
                        .enter().append("option")
                          .attr("value", function (d) { return d; })
                          .text(function (d) {
                              return d[0].toUpperCase() + d.slice(1,d.length);
                          });
            var city_features = cityData[year];
            draw_legend();
            function write_top_cities() {
              svg.append('text')
               .html(function (d) {
                 if (assigned) {
                   var curr_city = city_features[ranked_cities[year-2001][0]]
                 }
                 else {
                   var curr_city = city_features[ranked_inventor_cities[year-2001][0]]
                 }
                 var city_rank = '1 | ' + curr_city.city_for_viewing;
                 return city_rank; //topCities[year-2001].values[0].city_state;
               })
               .attr('id', 'top_cities_1')
               .attr('font-size', 12)
               .attr('x', 20)
               .attr('y', 270)
               svg.append('text')
                .html(function (d) {
                  if (assigned) {
                    var curr_city = city_features[ranked_cities[year-2001][1]]
                  }
                  else {
                    var curr_city = city_features[ranked_inventor_cities[year-2001][1]]
                  }
                  var city_rank = '2 | ' + curr_city.city_for_viewing;
                  return city_rank; //topCities[year-2001].values[0].city_state;
                })
                .attr('id', 'top_cities_2')
                .attr('font-size', 12)
                .attr('x', 20)
                .attr('y', 285)
                svg.append('text')
                 .html(function (d) {
                   if (assigned) {
                     var curr_city = city_features[ranked_cities[year-2001][2]]
                   }
                   else {
                     var curr_city = city_features[ranked_inventor_cities[year-2001][2]]
                   }
                   var city_rank = '3 | ' + curr_city.city_for_viewing;
                   return city_rank; //topCities[year-2001].values[0].city_state;
                 })
                 .attr('id', 'top_cities_3')
                 .attr('font-size', 12)
                 .attr('x', 20)
                 .attr('y', 300)
                 svg.append('text')
                  .html(function (d) {
                    if (assigned) {
                      var curr_city = city_features[ranked_cities[year-2001][3]]
                    }
                    else {
                      var curr_city = city_features[ranked_inventor_cities[year-2001][3]]
                    }
                    var city_rank = '4 | ' + curr_city.city_for_viewing;
                    return city_rank; //topCities[year-2001].values[0].city_state;
                  })
                  .attr('id', 'top_cities_4')
                  .attr('font-size', 12)
                  .attr('x', 20)
                  .attr('y', 315)
                  svg.append('text')
                   .html(function (d) {
                     if (assigned) {
                       var curr_city = city_features[ranked_cities[year-2001][4]]
                     }
                     else {
                       var curr_city = city_features[ranked_inventor_cities[year-2001][4]]
                     }
                     var city_rank = '5 | ' + curr_city.city_for_viewing;
                     return city_rank; //topCities[year-2001].values[0].city_state;
                   })
                   .attr('id', 'top_cities_5')
                   .attr('font-size', 12)
                   .attr('x', 20)
                   .attr('y', 330)
            }
            write_top_cities();
            var summary_stats_x = 150;
            var summary_stats_y = 400;
             svg.append('text')
               .text('USA')
               .attr('id', 'place_name')
               .attr('font-size', 12)
               .attr('x', summary_stats_x)
               .attr('y', 400);
             svg.append('text')
               .text(function(d) {
                 return f_1(annualPatentSummary[year - 2001].values);
               })
               .attr('id', 'patents')
               .attr('font-size', 12)
               .attr('x', summary_stats_x)
               .attr('y', 420);
            svg.append('text')
                 .text(function(d) {
                   return f_1(annualInventorPatentSummary[year - 2001].values);
                 })
                 .attr('id', 'inventor_patents')
                 .attr('font-size', 12)
                 .attr('x', summary_stats_x)
                 .attr('y', 440);
            svg.append('text')
               .text(function (d) {
                 return '$' + f_1(annualSBIRSummary[year - 2001].values);
               })
               .attr('id', 'funding')
               .attr('font-size', 12)
               .attr('x', summary_stats_x)
               .attr('y', 460);
            svg.append('text')
               .text(function(d) {
                 return f_3(annualCC[year - 2001].values);
               })
               .attr('id', 'perc_cc')
               .attr('font-size', 12)
               .attr('x', summary_stats_x)
               .attr('y', 480);
               svg.append('text')
                  .text(function(d) {
                    return f_3(annualBachelors[year - 2001].values);
                  })
                  .attr('id', 'perc_bachelors_summary')
                  .attr('font-size', 12)
                  .attr('x', summary_stats_x)
                  .attr('y', 500);
              svg.append('text')
                 .text(function(d) {
                   return f_3(annualGraduate[year - 2001].values);
                 })
                 .attr('id', 'perc_graduate_summary')
                 .attr('font-size', 12)
                 .attr('x', summary_stats_x)
                 .attr('y', 520);
             svg.append('text')
                .text(function(d) {
                  return f_3(annualForeignBorn[year - 2001].values);
                })
                .attr('id', 'perc_fb_summary')
                .attr('font-size', 12)
                .attr('x', summary_stats_x)
                .attr('y', 540);
            svg.append('text')
               .text(function(d) {
                 return '$' + f_1(annualMedianIncome[year - 2001].values);
               })
               .attr('id', 'perc_income_summary')
               .attr('font-size', 12)
               .attr('x', summary_stats_x)
               .attr('y', 560);
            function draw_circles() {
              mapLayer.selectAll('circle')
                  .data(features)
                  .enter().append('circle')
                  .attr('cx', function(d) {
                    return projection([d.properties.lon, d.properties.lat])[0];
                  })
                  .attr('cy', function(d) {
                    return projection([d.properties.lon, d.properties.lat])[1];
                  })
                  .attr('r', function(d) {
                    var city_name = d.properties.city_state;
                    var curr_city = city_features[city_name];
                    if (assigned) {
                      return Math.pow(Math.log(curr_city.Patents / 2), 1.5);
                    }
                    else{
                      return Math.pow(Math.log(curr_city.inventor_patents / 2), 1.5);
                    }
                    //return (Math.pow(curr_city.Score_assigned, 3)) / 8;
                  })
                  .attr("stroke","")
                  .style('fill', function(d) {
                    var city_name = d.properties.city_state;
                    var curr_city = city_features[city_name];
                    return (color(curr_city.Score_invented));
                  })
                  .on('mouseover', function(d) {
                        d3.select(this)
                          .style('fill', 'grey')
                          .attr("stroke","black");
                          var city_name = d.properties.city_state;
                          var curr_city = city_features[city_name];
                          //mouseover(curr_city);
                          tooltip.html(format_description(d, curr_city));
                          tooltip.style('visibility', 'visible');
                          tooltip.style('top', (d3.event.pageY+20) + "px")
                                 .style('left', (d3.event.pageX+10) + "px");
                   })
                  .on('mouseout', function(d) {
                          var city_name = d.properties.city_state;
                          var curr_city = city_features[city_name];
                          d3.select(this).style('fill', function(d) {
                              return (color(curr_city.Score_invented));
                          })
                          .attr("stroke","");
                          tooltip.style('visibility', 'hidden');
                  })
                  .on('click', function(d) {
                            var city_name = d.properties.city_state;
                            var curr_city = city_features[city_name];
                            change_summary_stats(d, curr_city);
                            change_clicked_top_cities(d, city_name);
                            clicked(d, curr_city);
                  });
            }
            draw_circles();
            //Draw each province as a path
            assigned_filter.on("click", function(d) {
              console.log("assigned_filter");
              d3.select(this).style('opacity', 0.5);
              d3.select('#invented_filter').style('opacity', 0.2);
              assigned = true;
              change_top_cities();
              mapLayer.selectAll('circle')
                  .data(features)
                  .attr('cx', function(d) {
                    return projection([d.properties.lon, d.properties.lat])[0];
                  })
                  .attr('cy', function(d) {
                    return projection([d.properties.lon, d.properties.lat])[1];
                  })
                  .attr('r', function(d) {
                    var city_name = d.properties.city_state;
                    var curr_city = city_features[city_name];
                      if (assigned) {
                        return Math.pow(Math.log(curr_city.Patents / 2), 1.5);
                      }
                      else{
                        return Math.pow(Math.log(curr_city.inventor_patents / 2), 1.5);
                      }
                  })
                  .attr("stroke","")
                  .style('fill', function(d) {
                    var city_name = d.properties.city_state;
                    var curr_city = city_features[city_name];
                    return (color(curr_city.Score_invented));
                  })
                  .on('mouseover', function(d) {
                        d3.select(this)
                          .style('fill', 'grey')
                          .attr("stroke","black");
                          var city_name = d.properties.city_state;
                          var curr_city = city_features[city_name];
                          //mouseover(curr_city);
                          tooltip.html(format_description(d, curr_city));
                          tooltip.style('visibility', 'visible');
                          tooltip.style('top', (d3.event.pageY+20) + "px")
                                 .style('left', (d3.event.pageX+10) + "px");
                   })
                  .on('mouseout', function(d) {
                          var city_name = d.properties.city_state;
                          var curr_city = city_features[city_name];
                          d3.select(this).style('fill', function(d) {
                              return (color(curr_city.Score_invented));
                          })
                          .attr("stroke","");
                          tooltip.style('visibility', 'hidden');
                  })
                  .on('click', function(d) {
                            var city_name = d.properties.city_state;
                            var curr_city = city_features[city_name];
                            change_summary_stats(d, curr_city);
                            change_clicked_top_cities(d, city_name);
                            clicked(d, curr_city);
                  });
            });
            invented_filter.on('click', function() {
              console.log('invented_filter');
              d3.select(this).style('opacity', 0.5);
              d3.select('#assigned_filter').style('opacity', 0.2);
              assigned = false;
              change_top_cities();
              mapLayer.selectAll('circle')
                  .data(features)
                  .attr('cx', function(d) {
                    return projection([d.properties.lon, d.properties.lat])[0];
                  })
                  .attr('cy', function(d) {
                    return projection([d.properties.lon, d.properties.lat])[1];
                  })
                  .attr('r', function(d) {
                    var city_name = d.properties.city_state;
                    var curr_city = city_features[city_name];
                      if (assigned) {
                        return Math.pow(Math.log(curr_city.Patents / 2), 1.5);
                      }
                      else{
                        return Math.pow(Math.log(curr_city.inventor_patents / 2), 1.5);
                      }
                  })
                  .attr("stroke","")
                  .style('fill', function(d) {
                    var city_name = d.properties.city_state;
                    var curr_city = city_features[city_name];
                    return (color(curr_city.Score_invented));
                  })
                  .on('mouseover', function(d) {
                        d3.select(this)
                          .style('fill', 'grey')
                          .attr("stroke","black");
                          var city_name = d.properties.city_state;
                          var curr_city = city_features[city_name];
                          //mouseover(curr_city);
                          tooltip.html(format_description(d, curr_city));
                          tooltip.style('visibility', 'visible');
                          tooltip.style('top', (d3.event.pageY+20) + "px")
                                 .style('left', (d3.event.pageX+10) + "px");
                   })
                  .on('mouseout', function(d) {
                          var city_name = d.properties.city_state;
                          var curr_city = city_features[city_name];
                          d3.select(this).style('fill', function(d) {
                              return (color(curr_city.Score_invented));
                          })
                          .attr("stroke","");
                          tooltip.style('visibility', 'hidden');
                  })
                  .on('click', function(d) {
                            var city_name = d.properties.city_state;
                            var curr_city = city_features[city_name];
                            change_summary_stats(d, curr_city);
                            change_clicked_top_cities(d, city_name);
                            clicked(d, curr_city);
                  });
            })
                // When the button is changed, run the updateChart function
                dropdown.on("change", function(d) {
                    year = d3.select(this).property('value')
                    var city_features = cityData[year];
                    change_annual_stats(d);
                    change_regression_results_text(d);
                    change_top_cities(d);
                    //Draw each province as a path
                    mapLayer.selectAll('circle')
                        .data(features)
                        .attr('cx', function(d) {
                          return projection([d.properties.lon, d.properties.lat])[0];
                        })
                        .attr('cy', function(d) {
                          return projection([d.properties.lon, d.properties.lat])[1];
                        })
                        .attr('r', function(d) {
                          var city_name = d.properties.city_state;
                          var curr_city = city_features[city_name];
                            if (assigned) {
                              return Math.pow(Math.log(curr_city.Patents / 2), 1.5);
                            }
                            else{
                              return Math.pow(Math.log(curr_city.inventor_patents / 2), 1.5);
                            }
                        })
                        .attr("stroke","")
                        .style('fill', function(d) {
                          var city_name = d.properties.city_state;
                          var curr_city = city_features[city_name];
                          return (color(curr_city.Score_invented));
                        })
                        .on('mouseover', function(d) {
                              d3.select(this)
                                .style('fill', 'grey')
                                .attr("stroke","black");
                                var city_name = d.properties.city_state;
                                var curr_city = city_features[city_name];
                                //mouseover(curr_city);
                                tooltip.html(format_description(d, curr_city));
                                tooltip.style('visibility', 'visible');
                                tooltip.style('top', (d3.event.pageY+20) + "px")
                                       .style('left', (d3.event.pageX+10) + "px");
                         })
                        .on('mouseout', function(d) {
                                var city_name = d.properties.city_state;
                                var curr_city = city_features[city_name];
                                d3.select(this).style('fill', function(d) {
                                    return (color(curr_city.Score_invented));
                                })
                                .attr("stroke","");
                                tooltip.style('visibility', 'hidden');
                        })
                        .on('click', function(d) {
                                  var city_name = d.properties.city_state;
                                  var curr_city = city_features[city_name];
                                  change_summary_stats(d, curr_city);
                                  change_clicked_top_cities(d, city_name);
                                  clicked(d, curr_city);
                        });
                })
                function format_description(d, curr_city) {
                  var to_return = '<b> ' + curr_city.city_for_viewing +  ' </b> <br> Patents: ' + curr_city.Patents +  ' </b> <br> Invented Patents: ' + curr_city.inventor_patents;
                  return to_return;
                }
                // When clicked, zoom in
                function clicked(d, curr_city) {
                  var x, y, k;
                  // Compute centroid of the selected path
                  if (d && centered !== d) {
                    d3.select('#summary_stats')
                      .style('opacity', 0.2);
                    var centroid = path.centroid(d);
                    x = centroid[0];
                    y = centroid[1];
                    k = 8;
                    centered = d;
                    // d3.select('#title').text('');
                    mapLayer.selectAll('circle')
                      .transition()
                      .duration(750)
                      .attr("stroke-width", 0.1)
                      .attr('r', function(d) {
                        var city_name = d.properties.city_state;
                        var curr_city = city_features[city_name];
                        if (assigned) {
                          return Math.pow(Math.log(curr_city.Patents / 12), 1.2);
                        }
                        else {
                          return Math.pow(Math.log(curr_city.inventor_patents / 12), 1.2);
                        }
                //          return d.properties.Score_assigned / 3.5;
                    });
                  } else {
                    d3.select('#summary_stats')
                      .style('opacity', 0.2);
                    x = width/2;
                    y = height/2;
                    k = 1;
                    centered = null;
                    // d3.select('#title').text('Top Innovative Cities in the United States');
                    mapLayer.selectAll('circle')
                        .transition()
                        .duration(750)
                        .attr("stroke-width", 0.5)
                        .attr('r', function(d) {
                                    var city_name = d.properties.city_state;
                                    var curr_city = city_features[city_name];
                                    if (assigned) {
                                      return Math.pow(Math.log(curr_city.Patents / 2), 1.5);
                                    }
                                    else{
                                      return Math.pow(Math.log(curr_city.inventor_patents / 2), 1.5);
                                    }
                              //return (Math.pow(curr_city.Score_assigned, 3)) / 8;
                            //return (d.properties.fips);
                            // return (Math.pow(d.properties.Year, 3)) / 8;
                    });
                  }
                  //change_summary_stats(d);
                  // Zoom
                  g.transition()
                    .duration(750)
                    .attr('transform', 'translate(' + width / 2 + ',' + height / 2 + ')scale(' + k + ')translate(' + -x + ',' + -y + ')');
                }
                function draw_legend() {
                  var top_City = ranked_cities[year-2001][0]
                  var tophalf_City = ranked_cities[year-2001][30]
                  var bottomhalf_City = ranked_cities[year-2001][80]
                  var bottom_City = ranked_cities[year-2001][200]
                  svg.append('circle')
                    .attr('cx', width - 120)
                    .attr('cy', height - 30)
                    .attr('r', function(d) {
                      var city = city_features[top_City]
                      return Math.pow(Math.log(5000 / 2), 1.5);
                    })
                    .style('fill','blue')
                    .style('opacity', 0.3);
                  svg.append('text')
                    .text(function(d) { return '5000 Patents' })
                    .attr('font-size', 12)
                    .attr('x', width - 90)
                    .attr('y', height - 25);
                    svg.append('circle')
                      .attr('cx', width - 120)
                      .attr('cy', height - 70)
                      .attr('r', function(d) {
                        var city = city_features[tophalf_City]
                        return Math.pow(Math.log(1000 / 2), 1.5);
                      })
                      .style('fill','blue')
                      .style('opacity', 0.3);
                      svg.append('text')
                        .text(function(d) { return '1000' })
                        .attr('font-size', 12)
                        .attr('x', width - 90)
                        .attr('y', height - 70);
                    svg.append('circle')
                      .attr('cx', width - 120)
                      .attr('cy', height - 100)
                      .attr('r', function(d) {
                        var city = city_features[bottomhalf_City]
                        return Math.pow(Math.log(200 / 2), 1.5);
                      })
                      .style('fill','blue')
                      .style('opacity', 0.3);
                      svg.append('text')
                        .text(function(d) { return '200' })
                        .attr('font-size', 12)
                        .attr('x', width - 90)
                        .attr('y', height - 95);
                  svg.append('circle')
                    .attr('cx', width - 120)
                    .attr('cy', height - 120)
                    .attr('r', function(d) {
                      var city = city_features[bottom_City]
                      return Math.pow(Math.log(50 / 2), 1.5);
                    })
                    .style('fill','blue')
                    .style('opacity', 0.3);
                    svg.append('text')
                      .text(function(d) { return '50'  })
                      .attr('font-size', 12)
                      .attr('x', width - 90)
                      .attr('y', height - 115);
                }
                function change_annual_stats(d) {
                  d3.select('#place_name').text("USA");
                  d3.select("#patents").text(f_1(annualPatentSummary[year - 2001].values));
                  d3.select('#inventor_patents').text(f_1(annualInventorPatentSummary[year-2001].values));
                  d3.select('#funding').text('$' + f_1(annualSBIRSummary[year - 2001].values));
                  d3.select('#perc_cc').text(f_3(annualCC[year - 2001].values));
                  d3.select('#perc_bachelors_summary').text(f_3(annualBachelors[year - 2001].values));
                  d3.select('#perc_graduate_summary').text(f_3(annualGraduate[year - 2001].values));
                  d3.select('#perc_fb_summary').text(f_3(annualForeignBorn[year - 2001].values));
                  d3.select('#perc_income_summary').text('$' + f_1(annualMedianIncome[year - 2001].values));
                }
                function change_summary_stats(d, curr_city) {
                      if (d && centered !== d) {
                        d3.select('#place_name').text(curr_city.city_for_viewing);
                        d3.select("#patents").text(curr_city.Patents);
                        d3.select("#inventor_patents").text(curr_city.inventor_patents)
                        d3.select('#funding').text('$' + f_1(curr_city['Award Mean']));
                        d3.select('#perc_cc').text(f_3(curr_city.percent_creative_class));
                        d3.select('#perc_bachelors_summary').text(f_3(curr_city.percent_bachelors));
                        d3.select('#perc_graduate_summary').text(f_3(curr_city.percent_graduate));
                        d3.select('#perc_fb_summary').text(f_3(curr_city.percent_foreign_born));
                        d3.select('#perc_income_summary').text('$' + f_1(curr_city.median_household_income));
                      }
                      else {
                        d3.select('#place_name').text("USA");
                        d3.select("#patents").text(f_1(annualPatentSummary[year - 2001].values));
                        d3.select('#inventor_patents').text(f_1(annualInventorPatentSummary[year-2001].values));
                        d3.select('#funding').text('$' + f_1(annualSBIRSummary[year - 2001].values));
                        d3.select('#perc_cc').text(f_3(annualCC[year - 2001].values));
                        d3.select('#perc_bachelors_summary').text(f_3(annualBachelors[year - 2001].values));
                        d3.select('#perc_graduate_summary').text(f_3(annualGraduate[year - 2001].values));
                        d3.select('#perc_fb_summary').text(f_3(annualForeignBorn[year - 2001].values));
                        d3.select('#perc_income_summary').text('$' + f_1(annualMedianIncome[year - 2001].values));
                      }
                }
                function change_regression_results_text(d) {
                  d3.select('#award_mean_sa').text(f_3(annualRegressionSummary[year-2001].values[0].values[0].award_mean));
                  d3.select('#award_mean_si').text(f_3(annualRegressionSummary[year-2001].values[1].values[0].award_mean));
                  d3.select('#scaled_perc_creative_class_sa').text(f_3(annualRegressionSummary[year-2001].values[0].values[0].scaled_perc_creative_class));
                  d3.select('#scaled_perc_creative_class_si').text(f_3(annualRegressionSummary[year-2001].values[1].values[0].scaled_perc_creative_class));
                  d3.select('#percent_bachelors_sa').text(f_3(annualRegressionSummary[year-2001].values[0].values[0].percent_bachelors));
                  d3.select('#percent_bachelors_si').text(f_3(annualRegressionSummary[year-2001].values[1].values[0].percent_bachelors));
                  d3.select('#percent_graduate_sa').text(f_3(annualRegressionSummary[year-2001].values[0].values[0].percent_graduate));
                  d3.select('#percent_graduate_si').text(f_3(annualRegressionSummary[year-2001].values[1].values[0].percent_graduate));
                  d3.select('#percent_foreign_born_sa').text(f_3(annualRegressionSummary[year-2001].values[0].values[0].percent_foreign_born));
                  d3.select('#percent_foreign_born_si').text(f_3(annualRegressionSummary[year-2001].values[1].values[0].percent_foreign_born));
                  d3.select('#recipient_mean_sa').text(f_3(annualRegressionSummary[year-2001].values[0].values[0].recipient_mean));
                  d3.select('#recipient_mean_si').text(f_3(annualRegressionSummary[year-2001].values[1].values[0].recipient_mean));
                  d3.select('#median_household_income_sa').text(f_3(annualRegressionSummary[year-2001].values[0].values[0].median_household_income));
                  d3.select('#median_household_income_si').text(f_3(annualRegressionSummary[year-2001].values[1].values[0].median_household_income));
                }
                function change_clicked_top_cities(d, curr_city) {
                  if (d && centered !== d) {
                    if (assigned) {
                      index = ranked_cities[year-2001].indexOf(curr_city);
                      if (index > 3) {
                        var city_rank1 = index-1 + ' | ' + city_features[ranked_cities[year-2001][index-2]].city_for_viewing;
                        var city_rank2 = index + ' | ' + city_features[ranked_cities[year-2001][index-1]].city_for_viewing;
                        var city_rank3 = index+1 + ' | ' + city_features[ranked_cities[year-2001][index]].city_for_viewing;
                        var city_rank4 = index+2 + ' | ' + city_features[ranked_cities[year-2001][index+1]].city_for_viewing;
                        var city_rank5 = index+3 + ' | ' + city_features[ranked_cities[year-2001][index+2]].city_for_viewing;
                        d3.select('#top_cities_1').text(city_rank1);
                        d3.select('#top_cities_2').text(city_rank2);
                        d3.select('#top_cities_3').text(city_rank3);
                        d3.select('#top_cities_4').text(city_rank4);
                        d3.select('#top_cities_5').text(city_rank5);
                      }
                    }
                    else {
                      index = ranked_inventor_cities[year-2001].indexOf(curr_city);
                      if (index > 3) {
                        var city_rank1 = index-1 + ' | ' + city_features[ranked_inventor_cities[year-2001][index-2]].city_for_viewing;
                        var city_rank2 = index + ' | ' + city_features[ranked_inventor_cities[year-2001][index-1]].city_for_viewing;
                        var city_rank3 = index+1 + ' | ' + city_features[ranked_inventor_cities[year-2001][index]].city_for_viewing;
                        var city_rank4 = index+2 + ' | ' + city_features[ranked_inventor_cities[year-2001][index+1]].city_for_viewing;
                        var city_rank5 = index+3 + ' | ' + city_features[ranked_inventor_cities[year-2001][index+2]].city_for_viewing;
                        d3.select('#top_cities_1').text(city_rank1);
                        d3.select('#top_cities_2').text(city_rank2);
                        d3.select('#top_cities_3').text(city_rank3);
                        d3.select('#top_cities_4').text(city_rank4);
                        d3.select('#top_cities_5').text(city_rank5);
                      }
                    }
                  }
                  else {
                    if (assigned) {
                      var city_rank1= '1 | ' + city_features[ranked_cities[year-2001][0]].city_for_viewing;
                      var city_rank2= '2 | ' + city_features[ranked_cities[year-2001][1]].city_for_viewing;
                      var city_rank3= '3 | ' + city_features[ranked_cities[year-2001][2]].city_for_viewing;
                      var city_rank4= '4 | ' + city_features[ranked_cities[year-2001][3]].city_for_viewing;
                      var city_rank5= '5 | ' + city_features[ranked_cities[year-2001][4]].city_for_viewing;
                      d3.select('#top_cities_1').text(city_rank1);
                      d3.select('#top_cities_2').text(city_rank2);
                      d3.select('#top_cities_3').text(city_rank3);
                      d3.select('#top_cities_4').text(city_rank4);
                      d3.select('#top_cities_5').text(city_rank5);
                    }
                    else {
                      var city_rank1= '1 | ' + city_features[ranked_inventor_cities[year-2001][0]].city_for_viewing;
                      var city_rank2= '2 | ' + city_features[ranked_inventor_cities[year-2001][1]].city_for_viewing;
                      var city_rank3= '3 | ' + city_features[ranked_inventor_cities[year-2001][2]].city_for_viewing;
                      var city_rank4= '4 | ' + city_features[ranked_inventor_cities[year-2001][3]].city_for_viewing;
                      var city_rank5= '5 | ' + city_features[ranked_inventor_cities[year-2001][4]].city_for_viewing;
                      d3.select('#top_cities_1').text(city_rank1);
                      d3.select('#top_cities_2').text(city_rank2);
                      d3.select('#top_cities_3').text(city_rank3);
                      d3.select('#top_cities_4').text(city_rank4);
                      d3.select('#top_cities_5').text(city_rank5);
                    }
                  }
                }
                function change_top_cities(d) {
                    if (assigned) {
                      var city_rank1= '1 | ' + city_features[ranked_cities[year-2001][0]].city_for_viewing;
                      var city_rank2= '2 | ' + city_features[ranked_cities[year-2001][1]].city_for_viewing;
                      var city_rank3= '3 | ' + city_features[ranked_cities[year-2001][2]].city_for_viewing;
                      var city_rank4= '4 | ' + city_features[ranked_cities[year-2001][3]].city_for_viewing;
                      var city_rank5= '5 | ' + city_features[ranked_cities[year-2001][4]].city_for_viewing;
                    }
                    else {
                      var city_rank1= '1 | ' + city_features[ranked_inventor_cities[year-2001][0]].city_for_viewing;
                      var city_rank2= '2 | ' + city_features[ranked_inventor_cities[year-2001][1]].city_for_viewing;
                      var city_rank3= '3 | ' + city_features[ranked_inventor_cities[year-2001][2]].city_for_viewing;
                      var city_rank4= '4 | ' + city_features[ranked_inventor_cities[year-2001][3]].city_for_viewing;
                      var city_rank5= '5 | ' + city_features[ranked_inventor_cities[year-2001][4]].city_for_viewing;
                    }
                      d3.select('#top_cities_1').text(city_rank1);
                      d3.select('#top_cities_2').text(city_rank2);
                      d3.select('#top_cities_3').text(city_rank3);
                      d3.select('#top_cities_4').text(city_rank4);
                      d3.select('#top_cities_5').text(city_rank5);
                    }
                // function get_cities_around(curr_city) {
                //
                //   function helper() {
                //     return curr_city;
                //   }
                //
                //   console.log(topCities[year-2001].values.findIndex(helper));
                //
                // }
                });
              });
          });
      });
      d3.json('https://gist.githubusercontent.com/michellechandra/0b2ce4923dc9b5809922/raw/a476b9098ba0244718b496697c5b350460d32f99/us-states.json',
             function(error,states) {
        var state_features = states.features;
        mapLayer.selectAll("path")
          .data(state_features)
          .enter()
          .append("path")
          .attr("d", path)
          .style('opacity', 0.2)
          .style("stroke", "#fff")
          .style("stroke-width", "1")
          .style('fill', 'purple')
         });
      </script>
    </div>
</div>
</body>
