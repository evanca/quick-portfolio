```python
import pandas as pd
```


```python
ufo = pd.read_csv(r"http://bit.ly/uforeports")
```


```python
ufo.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>City</th>
      <th>Colors Reported</th>
      <th>Shape Reported</th>
      <th>State</th>
      <th>Time</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Ithaca</td>
      <td>NaN</td>
      <td>TRIANGLE</td>
      <td>NY</td>
      <td>6/1/1930 22:00</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Willingboro</td>
      <td>NaN</td>
      <td>OTHER</td>
      <td>NJ</td>
      <td>6/30/1930 20:00</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Holyoke</td>
      <td>NaN</td>
      <td>OVAL</td>
      <td>CO</td>
      <td>2/15/1931 14:00</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Abilene</td>
      <td>NaN</td>
      <td>DISK</td>
      <td>KS</td>
      <td>6/1/1931 13:00</td>
    </tr>
    <tr>
      <th>4</th>
      <td>New York Worlds Fair</td>
      <td>NaN</td>
      <td>LIGHT</td>
      <td>NY</td>
      <td>4/18/1933 19:00</td>
    </tr>
  </tbody>
</table>
</div>




```python
ufo.describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>City</th>
      <th>Colors Reported</th>
      <th>Shape Reported</th>
      <th>State</th>
      <th>Time</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>18216</td>
      <td>2882</td>
      <td>15597</td>
      <td>18241</td>
      <td>18241</td>
    </tr>
    <tr>
      <th>unique</th>
      <td>6476</td>
      <td>27</td>
      <td>27</td>
      <td>52</td>
      <td>16145</td>
    </tr>
    <tr>
      <th>top</th>
      <td>Seattle</td>
      <td>RED</td>
      <td>LIGHT</td>
      <td>CA</td>
      <td>11/16/1999 19:00</td>
    </tr>
    <tr>
      <th>freq</th>
      <td>187</td>
      <td>780</td>
      <td>2803</td>
      <td>2529</td>
      <td>27</td>
    </tr>
  </tbody>
</table>
</div>




```python
ufo["Colors Reported"].value_counts().sort_values(ascending=False)
```




    RED                       780
    GREEN                     531
    ORANGE                    528
    BLUE                      450
    YELLOW                    169
    RED GREEN                  89
    RED BLUE                   78
    RED ORANGE                 44
    GREEN BLUE                 34
    RED GREEN BLUE             33
    ORANGE YELLOW              26
    RED YELLOW                 25
    ORANGE GREEN               23
    YELLOW GREEN               17
    ORANGE BLUE                10
    RED YELLOW GREEN            9
    YELLOW BLUE                 6
    YELLOW GREEN BLUE           5
    ORANGE GREEN BLUE           5
    RED ORANGE YELLOW           4
    RED YELLOW GREEN BLUE       4
    RED ORANGE GREEN            3
    RED ORANGE BLUE             3
    RED YELLOW BLUE             3
    ORANGE YELLOW BLUE          1
    RED ORANGE YELLOW BLUE      1
    ORANGE YELLOW GREEN         1
    Name: Colors Reported, dtype: int64




```python
ufo.isnull().sum()
```




    City                  25
    Colors Reported    15359
    Shape Reported      2644
    State                  0
    Time                   0
    dtype: int64




```python
ufo.shape
```




    (18241, 5)




```python
ufo.dropna(how="any").shape
```




    (2486, 5)




```python

```
