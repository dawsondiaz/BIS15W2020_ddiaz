---
title: "Lab 6 Homework"
author: "Dawson Diaz"
date: "February 21, 2020"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---



### Libraries

```r
#install.packages("tidyverse")
#install.packages("naniar")
#install.packages("gapminder")
#install.packages("knitr")
#install.packages("kableExtra")


library(tidyverse)
library(naniar)
library(gapminder)
library(knitr)
library(kableExtra)
```


```r
# This file uses libraries designed to output clean tables. For best viewing, open lab6_hw.html
```


### Questions

**1. Use the function(s) of your choice to get an idea of the overall structure of the data frame, including its dimensions, column names, variable classes, etc. As part of this, determine how NAs are treated in the data.**


```r
gapminder <- gapminder
```
<br>

```r
glimpse(gapminder)
```

```
## Observations: 1,704
## Variables: 6
## $ country   <fct> Afghanistan, Afghanistan, Afghanistan, Afghanistan, Afghani…
## $ continent <fct> Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia,…
## $ year      <int> 1952, 1957, 1962, 1967, 1972, 1977, 1982, 1987, 1992, 1997,…
## $ lifeExp   <dbl> 28.801, 30.332, 31.997, 34.020, 36.088, 38.438, 39.854, 40.…
## $ pop       <int> 8425333, 9240934, 10267083, 11537966, 13079460, 14880372, 1…
## $ gdpPercap <dbl> 779.4453, 820.8530, 853.1007, 836.1971, 739.9811, 786.1134,…
```

<br>


```r
any_na(gapminder)
```

```
## [1] FALSE
```
It  would appear that no NA values are present, as `NA` or any other common inputs for NA.

<br><br>
**2. Among the interesting variables in gapminder is life expectancy. How has global life expectancy changed between 1952 and 2007?**

Processing the data

```r
global_lifeExp <- gapminder %>% 
  select(country, year, lifeExp)  %>% 
  filter(year>=1952 & year<=2007) %>% 
  group_by(year) %>% 
  summarize(lifeExp_avg = mean(lifeExp))
```

<br>
`lifeExp_avg` summarized in a table

```r
kable(global_lifeExp) %>% 
  kable_styling(bootstrap_options = "striped", full_width = F, position="left")
```

<table class="table table-striped" style="width: auto !important; ">
 <thead>
  <tr>
   <th style="text-align:right;"> year </th>
   <th style="text-align:right;"> lifeExp_avg </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1952 </td>
   <td style="text-align:right;"> 49.05762 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1957 </td>
   <td style="text-align:right;"> 51.50740 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1962 </td>
   <td style="text-align:right;"> 53.60925 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1967 </td>
   <td style="text-align:right;"> 55.67829 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1972 </td>
   <td style="text-align:right;"> 57.64739 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1977 </td>
   <td style="text-align:right;"> 59.57016 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1982 </td>
   <td style="text-align:right;"> 61.53320 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1987 </td>
   <td style="text-align:right;"> 63.21261 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 64.16034 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1997 </td>
   <td style="text-align:right;"> 65.01468 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:right;"> 65.69492 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:right;"> 67.00742 </td>
  </tr>
</tbody>
</table>
<br>

`lifeExp_avg` summarized as a line graph

```r
ggplot(global_lifeExp, aes(x=year, y=lifeExp_avg))+
  geom_line()+
  labs(
    title= "Average Global Life Expectancy by Year (1952-2000)",
    x="Year",
    y="Average Life Expectancy (years)")+
  theme(plot.title = element_text(size = 14, face = "bold", hjust = 0.5, vjust = 2.25, margin = margin(t=15)),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 12),
        axis.title.y = element_text(margin = margin(t = 0, r = 15, b = 0, l = 0)),
        axis.title.x = element_text(margin = margin(t = 10, r = 0, b = 0, l = 0)))
```

![](lab6_hw_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

<br><br>



**3. How do the distributions of life expectancy compare for the years 1952 and 2007? _Challenge: Can you put both distributions on a single plot?_**

<br><br>
**4. Your answer above doesn't tell the whole story since life expectancy varies by region. Make a summary that shows the min, mean, and max life expectancy by continent for all years represented in the data.**

<br><br>
**5. How has life expectancy changed between 1952-2007 for each continent? Try using `geom_line()` for this, including all continents on the same  plot.**

<br><br>
**6. We are interested in the relationship between per capita GDP and life expectancy; i.e. does having more money help you live longer?**

<br><br>
**7. There is extreme disparity in per capita GDP. Rescale the x axis to make this easier to interpret. How would you characterize the relationship?**

<br><br>
**8. Which countries have had the largest population growth since 1952?**

<br><br>
**9. Use your results from the question above to plot population growth for the top five countries since 1952.**

<br><br>
**10. How does per capita GDP growth compare between these same five countries?**


<br><br><br>
