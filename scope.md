---
layout: default
title: Scope
description: Project Scope and Problem Statement

---

<style>
.column {
  float: left;
  width: 25%;
  padding: 5px;
}

.row::after {
  content: "";
  clear: both;
  display: table;
  * {
    box-sizing: border-box;
  }

  body {
    font-family: Arial, Helvetica, sans-serif;
  }


  .column {
    float: left;
    width: 25%;
    padding: 0 10px;
  }


  .row {margin: 0 -5px;}


  .row:after {
    content: "";
    display: table;
    clear: both;
  }


  .card {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    padding: 16px;
    text-align: center;
    background-color: #f1f1f1;
  }


  @media screen and (max-width: 600px) {
    .column {
      width: 100%;
      display: block;
      margin-bottom: 20px;
    }
  }
</style>

# Scope
To understand how this development of an _innovation hub_ happens in a city, we will analyze more than thirty-five years of patent data in the United States from 1976-2014. Our regression analysis will explore three dimensions that influence the growth of innovation: regulation, socioeconomic diversity, and the spatial geography of the city.

<div class="row">
  <div class="column">
    <div class="card">
    <img src="./images/icon/icons8-scales-filled-100.png" alt="Funding" style="width:40px;height:80px;">
    <p>Federal Funding</p>
    </div>
  </div>
  <div class="column">
    <div class="card">
    <img src="./images/icon/icons8-idea-512.png" alt="Funding" style="width:40px;height:80px;">
    <p>Diversity</p>
    </div>
  </div>
  <div class="column">
    <div class="card">
    <img src="./images/icon/icons8-graph-80.png" alt="Funding" style="width:40px;height:80px;">
    <p>Spatial Factors</p>
    </div>
</div>

# Problem Statement:

*How does a city become an "innovation hub"?*

<p>Using patent data as a way to measure innovation, our goal is to investigate the factors which contribute to this growth as a hub within a city. </p>

<p>With the wealth of patent, demographic, geographic and business data available to us, our logistic regression models will identify the key features that determine a future of economic and innovative success of metropolitan statistical areas within the United States. </p>

<p>Developing a model to determine and predict future inflection points will give an insight into the future innovative landscape for cities and investors. We will create an interactive application that will allow users to see more in depth visual analysis of the innovative landscape over time. The dimensions of innovation we will explore include the city's dynamic regulatory environment, socioeconomic structure and spatial density.</p>
