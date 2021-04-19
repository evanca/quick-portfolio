## Portfolio

---


<link type="text/css" rel="stylesheet" href="/style.css" />

# GIS 486 

---
## Recent Projects

### Changes in Maryland Renting Between 2015 and 2019


## Rent, Income, and Poverty

With my own graduation approaching and the Covid-19 pandemic slowly abating (or at least becoming normal), the looming spectre of moving out and dealing with rent raises its head once more. With this on my mind, I decided to take a look at rent data, and see if there were any interesting patterns to find. 

Over the years, I have, through cultural osmossis, picked up on the general idea that the cost of living in an area is generally related to the income that people in that region earn. I wanted to take a look at how well this bit of folk economics held up to census data, particularly census data pertaining to a relatively bounded region, in this case the state of Maryland.

Using U.S. census data on the percentage of income allocated toward paying rent, I created two datasets, one for the 2019 and the other for 2015. By subtracting the 2015 data from the 2019 data, I was able to see how the proportion of rent to income has changed throughout maryland in that time. To be perfectly honest, I was expecting to see almost no change between those years, as I figured the time frame was too small to allow for significant changes to occur. However, the data tells a different story:

[<img src="Projects/Change_Over_Time_Maps/Map_Images/Rent_Change_Over_Time_Map.png?raw=true"/>](/Projects/Change_Over_Time_Maps/Map_PDFs/Rent_Change_Over_Time_Map.pdf)

I should clarify that the percent changes here are not multiplicative, but additive. A change of -30% means that, if 40% of household income was spent on rent in 2015, by 2019 only 10% of household income was needed to cover rent. The magnitude of change in both direction caught me entirely by surprise, though as of now I cannot see any significant pattern in which regions saw increases and which saw decreases. I intend to return to this data in the future to see if I can find any patterns when examined against other data, such as demographic distributions. 

It could also prove enlightening to see how the component data (i.e. median gross rent and median income) behave when viewed analyzed over the same period of time. For instance, in the areas where the ratio of rent to income decreased, was it because rent became cheaper, or because the average income rose? 

While that specific analysis will have to come later, I did take the oppurtunity to cross reference this data with another data set in order to make a bivariate map. Specifically, I examined the percent of income spent on rent alongside the number of renting households with incomes below the poverty line to create a bivariate map. As with the previous map, this map repreesnts the changes in these variables between 2015 and 2019.

[<img src="Projects/Change_Over_Time_Maps/Map_Images/Bivariate_Rent_Map.png?raw=true"/>](/Projects/Change_Over_Time_Maps/Map_PDFs/Bivariate_Rent_Map.pdf)

Unfortunately, these two datasets do not play well with each other, and it is difficult to see the trends in either of them while looking at both of them. However, the extremes of this data could be useful for discussing topics like subsidized housing/rent, as areas containing high number of renters earning below the poverty line and with a high percentage of income spent on rent would likely benefit far more from such programs than regions with a low number of impovershed renters and a low percent rent. Though, couldn't the fact that there are fewer renters below the poverty line also mean that the rents are too great to be afforded by low income households? Certainly something to investigate in the future.


---
<p style="font-size:11px">Page template forked from <a href="https://github.com/evanca/quick-portfolio">evanca</a></p>
<!-- Remove above link if you don't want to attibute -->
