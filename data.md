---
layout: default
title: Data
description: Information about Variables & Features
---
## Data
<style>
.column {
  float: left;
  width: 33%;
  padding: 5px;
}

.row::after {
  content: "";
  clear: both;
  display: table;

</style>

# Resources
<a href="https://github.com/rohuniyer/a_story_of_cities_and_patents">Patents</a>
<a href="https://github.com/rohuniyer/a_story_of_cities_and_patents">SBIR</a>
<a href="https://github.com/rohuniyer/a_story_of_cities_and_patents">Census</a>
<a href="https://github.com/rohuniyer/a_story_of_cities_and_patents">Federal Funding</a>
<a href="https://github.com/rohuniyer/a_story_of_cities_and_patents">Empowerment Zone</a>

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


# Factors That Lead to Innovation

_Using previous studies, we have identified three main determinants of an innovative ecosystem: regulatory, socioeconomic, and spatial._

<p>Different types of regulations include federal programs for R&D funding, tax benefits, and government subsidies. In addition to the regulatory environment, literature also suggests that city growth can be measured by changes in demographic and economic factors.</p>

## Regulatory data
