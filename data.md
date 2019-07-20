---
layout: default
title: Data
description: Information About Variables and Features
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
<ul>
  <li><a href="https://github.com/rohuniyer/a_story_of_cities_and_patents">Patents</a></li>
  <li><a href="https://github.com/rohuniyer/a_story_of_cities_and_patents">SBIR</a></li>
  <li><a href="https://github.com/rohuniyer/a_story_of_cities_and_patents">Census</a></li>
  <li><a href="https://github.com/rohuniyer/a_story_of_cities_and_patents">Federal Funding</a></li>
  <li><a href="https://github.com/rohuniyer/a_story_of_cities_and_patents">Empowerment Zone</a></li>
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
