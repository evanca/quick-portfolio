## How Does Membership Status Affect Cyclistic Bike Usage? - Coursera Capstone Project

**Project description:** _Cyclistic_ is a Chicago-based fictional bike-share company. As a junior data analyst at _Cyclistic_, I am tasked with providing the company insights into rider behaviour in order to convert casual riders into Cyclistic members.

### 1. Statement Of Business Task

_How do annual members and casual riders use Cyclistic bikes differently?_

**Glossary**
- Ride Instance: A single ride undertaken by a rider
- Casual Rider: _Cyclistic_ users who have purchased single-ride passes or full-day passes
- Annual Member/Member: _Cyclistic_ users who have purchased annual memberships.

### 2. Data Sources Used

_Cyclistic_'s historical trip data was obtained from the following webpage:
  https://divvy-tripdata.s3.amazonaws.com/index.html

In particular, data for the past 12 months, spanning from January 2024 to January 2025, was downloaded for analysis.

### 3. Documentation Of Cleaning And Manipulation Of Data

For this project, I chose Microsoft Excel as my primary tool due to the data size, ease of calculations, and data visualisation capacity. Each .csv data file was downloaded and extracted, and converted to .xlsx file type for further analysis.

All columns were validated for the correct data type. All files were checked for data duplicates, which were absent. All files were checked for blanks, which were removed. The columns with blank data included "start_station_name", "start_station_id", "end_station_name", "end_station_id". Blank rows accounted for about 10-15% of the data. Blank fields could be inferred from the latitude and longitude information in the dataset but would require a different tool.

New columns added included information about weekday, week number, and ride duration, calculated using the "started_at" and "ended_at" columns. Ride durations below 0 and above 1440 minutes were excluded, as negative ride durations and those above 1440 minutes(1 day) are invalid numbers. To avoid misclassification, week numbers for 2025 were adjusted starting from '53' rather than resetting to '1'.

A new excel workbook was created which includes overall summary of the data and a dashboard of visualisations.

### 4. Summary Of Analysis

- About one-third of _Cyclistic_ userbase is Casual Riders, while the rest are Annual Members. The **average ride duration for a casual rider is higher**( 21 min, 20 s) **compared to annual member** ( 12 min, 1 s).
  
- **Casual Ride instances increase around the weekend, whereas annual member rides are highest during weekdays,** suggesting that annual members might use _Cyclistic_ bikes for work commute.
  
- **Quarters 2 and 3** saw the most ride instances for the data analysed. There was a dip in bike usage towards the beginning and end of the year.
  
- Both Casual Riders and Annual Members are using classic bikes over electric ones. However, based on a Chi-Squared test (p < 0.5), **Casual Riders prefer electric bikes, and Annual Members prefer classic bikes.**
  
- The top stations frequented by Casual Riders include "Adler Planetarium", "Theater on the Lake", "Dusable Harbor", "Shedd Aquarium", and "Millenium Park," possibly due to their **recreational use** of the _Cyclistic_ bike service.
  
- The top stations frequented by Annual Members include "University Ave & 57th St" located close to the University of Chicago, suggesting that a significant membership consists of college students and staff. Other top stations for Annual Members are located close to apartment and condomonium complexes, supporting the speculation that they are using _Cyclistic_ bikes for **commute**.

### 5. Supporting Viz And Key Findings

A static dashboard was created in Microsoft Excel, which is pictured below:
![image](https://github.com/user-attachments/assets/7b921f0f-f47e-4207-89ba-879cb55510c8)
![image](https://github.com/user-attachments/assets/47dfe687-f7fa-4513-bd53-316b0c2c7951)

**Key Findings:**
- Annual Members are likelier to use _Cyclistic_ bikes during weekdays, whereas Casual Riders are more likely to use them during the weekends.
- On average, the ride duration for Casual Riders is higher than Annual Members.
- Casual Riders are likelier to use electric bikes as compared to Annual Members, who prefer classic bikes.
- Casual Riders are likelier to visit recreational locations, whereas Annual Members frequent residential and possibly office parks.

The static Excel dashboard with data summary can be found here:

[2025_02_20_CyclisticBikeUsage.xlsx](https://github.com/user-attachments/files/18905756/2025_02_20_CyclisticBikeUsage.xlsx)

### 6. Recommendations Based On Analysis

My top three recommendations based on this analysis to increase customer conversion and member retention are:

- **Introduction of a Weekend Payment Plan.**
    As Casual Riders are using the service more often on weekends, and one of Cyclistic's perks is a flexible payment plan, a Weekend Payment Plan would be ideal to attract the customer base to an Annual Membership Plan.

- **Promotional Offer During Q2 and Q3**
    Since quarters 2 and 3 saw the most ride instances from both Casual Riders and Annual Members, it would be the ideal time for the marketing department to employ promotional offers.

- **Discounts on Electric Bike Usage**
    Not only would discounts on electric bike usage encourage Casual Riders to consider an Annual Membership Plan, it would also encourage both customer bases to choose the environmentally ideal option.

### 7. Key Skills Demonstrated

```Microsoft Excel```  ```Data Cleaning```  ```Data Manipulation```  ```Data Visualisation```


