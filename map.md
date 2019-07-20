---
layout: default
title: Story Map
description: Our Final Results
customjs:
 - https://d3js.org/d3.v3.min.js
---
# Story Map

<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>JS Bin</title>
<style id="jsbin-css">
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
<script src="https://d3js.org/d3.v3.min.js"></script>
    <div id = 'chart1'>
      <div id = 'title_div'>
      </div>
      <div id = 'dropdown'></div>
  </div>
<script id="jsbin-javascript">


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
</body>
</html>
