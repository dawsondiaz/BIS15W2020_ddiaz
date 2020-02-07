---
title: "Lab 4 Homework"
author: "Dawson Diaz"
date: "February 7th, 2020"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---



## Load the tidyverse

```r
library(tidyverse)
```

## Problems

The data used for this assignment are from the [United Nations Food and Agriculture Organization](http://www.fao.org/about/en/) on world fisheries. 
<br>
<br>
***1. Load the data `FAO_1950to2012_111914.csv` as a new object titled `fisheries`.***



```r
fisheries <- readr::read_csv("data/FAO_1950to2012_111914.csv")
```

<br>

***2. What are the names of the columns? Do you see any potential problems with the column names?***


```r
colnames(fisheries)
```

```
##  [1] "Country"                 "Common name"            
##  [3] "ISSCAAP group#"          "ISSCAAP taxonomic group"
##  [5] "ASFIS species#"          "ASFIS species name"     
##  [7] "FAO major fishing area"  "Measure"                
##  [9] "1950"                    "1951"                   
## [11] "1952"                    "1953"                   
## [13] "1954"                    "1955"                   
## [15] "1956"                    "1957"                   
## [17] "1958"                    "1959"                   
## [19] "1960"                    "1961"                   
## [21] "1962"                    "1963"                   
## [23] "1964"                    "1965"                   
## [25] "1966"                    "1967"                   
## [27] "1968"                    "1969"                   
## [29] "1970"                    "1971"                   
## [31] "1972"                    "1973"                   
## [33] "1974"                    "1975"                   
## [35] "1976"                    "1977"                   
## [37] "1978"                    "1979"                   
## [39] "1980"                    "1981"                   
## [41] "1982"                    "1983"                   
## [43] "1984"                    "1985"                   
## [45] "1986"                    "1987"                   
## [47] "1988"                    "1989"                   
## [49] "1990"                    "1991"                   
## [51] "1992"                    "1993"                   
## [53] "1994"                    "1995"                   
## [55] "1996"                    "1997"                   
## [57] "1998"                    "1999"                   
## [59] "2000"                    "2001"                   
## [61] "2002"                    "2003"                   
## [63] "2004"                    "2005"                   
## [65] "2006"                    "2007"                   
## [67] "2008"                    "2009"                   
## [69] "2010"                    "2011"                   
## [71] "2012"
```
There are a couple of potential problems with the column names, (1) some names have spaces, (2) there are data contained in the columns-- there are many individual columns that are levels of the variable "year" that should just be one column.

<br>


***3. What is the structure of the data? Show the classes of each variable.***

This data is structured in wide format. While this is perhaps easiest to enter in data, it creates problems for analysis. The classes of each variable are shown usinf the `lapply()` function.


```r
lapply(fisheries, class)
```

```
## $Country
## [1] "character"
## 
## $`Common name`
## [1] "character"
## 
## $`ISSCAAP group#`
## [1] "numeric"
## 
## $`ISSCAAP taxonomic group`
## [1] "character"
## 
## $`ASFIS species#`
## [1] "character"
## 
## $`ASFIS species name`
## [1] "character"
## 
## $`FAO major fishing area`
## [1] "numeric"
## 
## $Measure
## [1] "character"
## 
## $`1950`
## [1] "character"
## 
## $`1951`
## [1] "character"
## 
## $`1952`
## [1] "character"
## 
## $`1953`
## [1] "character"
## 
## $`1954`
## [1] "character"
## 
## $`1955`
## [1] "character"
## 
## $`1956`
## [1] "character"
## 
## $`1957`
## [1] "character"
## 
## $`1958`
## [1] "character"
## 
## $`1959`
## [1] "character"
## 
## $`1960`
## [1] "character"
## 
## $`1961`
## [1] "character"
## 
## $`1962`
## [1] "character"
## 
## $`1963`
## [1] "character"
## 
## $`1964`
## [1] "character"
## 
## $`1965`
## [1] "character"
## 
## $`1966`
## [1] "character"
## 
## $`1967`
## [1] "character"
## 
## $`1968`
## [1] "character"
## 
## $`1969`
## [1] "character"
## 
## $`1970`
## [1] "character"
## 
## $`1971`
## [1] "character"
## 
## $`1972`
## [1] "character"
## 
## $`1973`
## [1] "character"
## 
## $`1974`
## [1] "character"
## 
## $`1975`
## [1] "character"
## 
## $`1976`
## [1] "character"
## 
## $`1977`
## [1] "character"
## 
## $`1978`
## [1] "character"
## 
## $`1979`
## [1] "character"
## 
## $`1980`
## [1] "character"
## 
## $`1981`
## [1] "character"
## 
## $`1982`
## [1] "character"
## 
## $`1983`
## [1] "character"
## 
## $`1984`
## [1] "character"
## 
## $`1985`
## [1] "character"
## 
## $`1986`
## [1] "character"
## 
## $`1987`
## [1] "character"
## 
## $`1988`
## [1] "character"
## 
## $`1989`
## [1] "character"
## 
## $`1990`
## [1] "character"
## 
## $`1991`
## [1] "character"
## 
## $`1992`
## [1] "character"
## 
## $`1993`
## [1] "character"
## 
## $`1994`
## [1] "character"
## 
## $`1995`
## [1] "character"
## 
## $`1996`
## [1] "character"
## 
## $`1997`
## [1] "character"
## 
## $`1998`
## [1] "character"
## 
## $`1999`
## [1] "character"
## 
## $`2000`
## [1] "character"
## 
## $`2001`
## [1] "character"
## 
## $`2002`
## [1] "character"
## 
## $`2003`
## [1] "character"
## 
## $`2004`
## [1] "character"
## 
## $`2005`
## [1] "character"
## 
## $`2006`
## [1] "character"
## 
## $`2007`
## [1] "character"
## 
## $`2008`
## [1] "character"
## 
## $`2009`
## [1] "character"
## 
## $`2010`
## [1] "character"
## 
## $`2011`
## [1] "character"
## 
## $`2012`
## [1] "character"
```


<br> 
***4. Think about the classes. Will any present problems? Make any changes you think are necessary below.***

The values of each year, which are numbers are all characterized as `character` when they should be `numeric`. This can be more efficicently fixed later when the data is tidy.
Meanwhile other columns are `characters` when they would be better treated as a `factor`



```r
fisheries$Country <- as.factor(fisheries$Country)
fisheries$`ISSCAAP taxonomic group` <- as.factor(fisheries$`ISSCAAP taxonomic group`)
fisheries$`ASFIS species#` <- as.factor(fisheries$`ASFIS species#`)
fisheries$`FAO major fishing area` <- as.factor(fisheries$`FAO major fishing area`)
fisheries$`Common name` <- as.factor(fisheries$`Common name`)
fisheries$`ASFIS species name` <- as.factor(fisheries$`ASFIS species name`)
```


<br>

***5. How many countries are represented in the data? Provide a count.***


```r
# Get the number of levels of the column variable Country
nlevels(fisheries$Country)
```

```
## [1] 204
```


<br>

***6. What are the names of the countries?***


```r
levels(fisheries$Country)
```

```
##   [1] "Albania"                   "Algeria"                  
##   [3] "American Samoa"            "Angola"                   
##   [5] "Anguilla"                  "Antigua and Barbuda"      
##   [7] "Argentina"                 "Aruba"                    
##   [9] "Australia"                 "Bahamas"                  
##  [11] "Bahrain"                   "Bangladesh"               
##  [13] "Barbados"                  "Belgium"                  
##  [15] "Belize"                    "Benin"                    
##  [17] "Bermuda"                   "Bonaire/S.Eustatius/Saba" 
##  [19] "Bosnia and Herzegovina"    "Brazil"                   
##  [21] "British Indian Ocean Ter"  "British Virgin Islands"   
##  [23] "Brunei Darussalam"         "Bulgaria"                 
##  [25] "Cabo Verde"                "Cambodia"                 
##  [27] "Cameroon"                  "Canada"                   
##  [29] "Cayman Islands"            "Channel Islands"          
##  [31] "Chile"                     "China"                    
##  [33] "China, Hong Kong SAR"      "China, Macao SAR"         
##  [35] "Colombia"                  "Comoros"                  
##  [37] "Congo, Dem. Rep. of the"   "Congo, Republic of"       
##  [39] "Cook Islands"              "Costa Rica"               
##  [41] "Croatia"                   "Cuba"                     
##  [43] "Cura\xe7ao"                "Cyprus"                   
##  [45] "C\xf4te d'Ivoire"          "Denmark"                  
##  [47] "Djibouti"                  "Dominica"                 
##  [49] "Dominican Republic"        "Ecuador"                  
##  [51] "Egypt"                     "El Salvador"              
##  [53] "Equatorial Guinea"         "Eritrea"                  
##  [55] "Estonia"                   "Ethiopia"                 
##  [57] "Falkland Is.(Malvinas)"    "Faroe Islands"            
##  [59] "Fiji, Republic of"         "Finland"                  
##  [61] "France"                    "French Guiana"            
##  [63] "French Polynesia"          "French Southern Terr"     
##  [65] "Gabon"                     "Gambia"                   
##  [67] "Georgia"                   "Germany"                  
##  [69] "Ghana"                     "Gibraltar"                
##  [71] "Greece"                    "Greenland"                
##  [73] "Grenada"                   "Guadeloupe"               
##  [75] "Guam"                      "Guatemala"                
##  [77] "Guinea"                    "GuineaBissau"             
##  [79] "Guyana"                    "Haiti"                    
##  [81] "Honduras"                  "Iceland"                  
##  [83] "India"                     "Indonesia"                
##  [85] "Iran (Islamic Rep. of)"    "Iraq"                     
##  [87] "Ireland"                   "Isle of Man"              
##  [89] "Israel"                    "Italy"                    
##  [91] "Jamaica"                   "Japan"                    
##  [93] "Jordan"                    "Kenya"                    
##  [95] "Kiribati"                  "Korea, Dem. People's Rep" 
##  [97] "Korea, Republic of"        "Kuwait"                   
##  [99] "Latvia"                    "Lebanon"                  
## [101] "Liberia"                   "Libya"                    
## [103] "Lithuania"                 "Madagascar"               
## [105] "Malaysia"                  "Maldives"                 
## [107] "Malta"                     "Marshall Islands"         
## [109] "Martinique"                "Mauritania"               
## [111] "Mauritius"                 "Mayotte"                  
## [113] "Mexico"                    "Micronesia, Fed.States of"
## [115] "Monaco"                    "Montenegro"               
## [117] "Montserrat"                "Morocco"                  
## [119] "Mozambique"                "Myanmar"                  
## [121] "Namibia"                   "Nauru"                    
## [123] "Netherlands"               "Netherlands Antilles"     
## [125] "New Caledonia"             "New Zealand"              
## [127] "Nicaragua"                 "Nigeria"                  
## [129] "Niue"                      "Norfolk Island"           
## [131] "Northern Mariana Is."      "Norway"                   
## [133] "Oman"                      "Other nei"                
## [135] "Pakistan"                  "Palau"                    
## [137] "Palestine, Occupied Tr."   "Panama"                   
## [139] "Papua New Guinea"          "Peru"                     
## [141] "Philippines"               "Pitcairn Islands"         
## [143] "Poland"                    "Portugal"                 
## [145] "Puerto Rico"               "Qatar"                    
## [147] "Romania"                   "Russian Federation"       
## [149] "R\xe9union"                "Saint Barth\xe9lemy"      
## [151] "Saint Helena"              "Saint Kitts and Nevis"    
## [153] "Saint Lucia"               "Saint Vincent/Grenadines" 
## [155] "SaintMartin"               "Samoa"                    
## [157] "Sao Tome and Principe"     "Saudi Arabia"             
## [159] "Senegal"                   "Serbia and Montenegro"    
## [161] "Seychelles"                "Sierra Leone"             
## [163] "Singapore"                 "Sint Maarten"             
## [165] "Slovenia"                  "Solomon Islands"          
## [167] "Somalia"                   "South Africa"             
## [169] "Spain"                     "Sri Lanka"                
## [171] "St. Pierre and Miquelon"   "Sudan"                    
## [173] "Sudan (former)"            "Suriname"                 
## [175] "Svalbard and Jan Mayen"    "Sweden"                   
## [177] "Syrian Arab Republic"      "Taiwan Province of China" 
## [179] "Tanzania, United Rep. of"  "Thailand"                 
## [181] "TimorLeste"                "Togo"                     
## [183] "Tokelau"                   "Tonga"                    
## [185] "Trinidad and Tobago"       "Tunisia"                  
## [187] "Turkey"                    "Turks and Caicos Is."     
## [189] "Tuvalu"                    "Ukraine"                  
## [191] "Un. Sov. Soc. Rep."        "United Arab Emirates"     
## [193] "United Kingdom"            "United States of America" 
## [195] "Uruguay"                   "US Virgin Islands"        
## [197] "Vanuatu"                   "Venezuela, Boliv Rep of"  
## [199] "Viet Nam"                  "Wallis and Futuna Is."    
## [201] "Western Sahara"            "Yemen"                    
## [203] "Yugoslavia SFR"            "Zanzibar"
```

<br>
***7. Use `rename()` to rename the columns and make them easier to use.***


```r
fisheries <- fisheries %>% 
  
  dplyr::rename(
    country = Country,
    commname = `Common name`,
    ASFIS_sciname = `ASFIS species name`,
    ASFIS_spcode = `ASFIS species#`,
    ISSCAAP_spgroup = `ISSCAAP group#`,
    ISSCAAP_spgroupname = `ISSCAAP taxonomic group`,
    FAO_area = `FAO major fishing area`,
    unit = Measure
  )
```

<br>

***8. Are these data tidy? Why or why not, and, how do you know? Use the appropriate pivot function to tidy the data. Remove the NA's. Put the tidy data frame into a new object `fisheries_tidy`.***  

These data are not tidy. 


```r
fisheries_tidy <- fisheries %>% 
  pivot_longer(
    cols= "1950":"2012",
    names_to = "year",
    values_to = "catch_tonnes",
    values_drop_na = TRUE
  )
```


<br>
***9. Refocus the data only to include country, ISSCAAP_spgroupname, ASFIS_spcode, ASFIS_sciname, year, and catch.***


```r
fisheries_tidy2 <- fisheries_tidy %>% 
  select(country, ISSCAAP_spgroupname, ASFIS_spcode, ASFIS_sciname, year, catch_tonnes)
```


```r
fisheries_tidy2
```

```
## # A tibble: 376,771 x 6
##    country ISSCAAP_spgroupname     ASFIS_spcode ASFIS_sciname year  catch_tonnes
##    <fct>   <fct>                   <fct>        <fct>         <chr> <chr>       
##  1 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   1995  0 0         
##  2 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   1996  53          
##  3 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   1997  20          
##  4 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   1998  31          
##  5 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   1999  30          
##  6 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2000  30          
##  7 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2001  16          
##  8 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2002  79          
##  9 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2003  1           
## 10 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2004  4           
## # … with 376,761 more rows
```


<br>
***10. Re-check the classes of `fisheries_tidy2`. Notice that "catch" is shown as a character! This is a problem because we will want to treat it as a numeric. How will you deal with this?***



```r
fisheries_tidy2$catch_tonnes <- as.numeric(fisheries_tidy2$catch_tonnes)
```

```r
lapply(fisheries_tidy2, class)
```

```
## $country
## [1] "factor"
## 
## $ISSCAAP_spgroupname
## [1] "factor"
## 
## $ASFIS_spcode
## [1] "factor"
## 
## $ASFIS_sciname
## [1] "factor"
## 
## $year
## [1] "character"
## 
## $catch_tonnes
## [1] "numeric"
```

<br>

***11. Based on the ASFIS_spcode, how many distinct taxa were caught as part of these data?***


```r
n_distinct(fisheries_tidy2$ASFIS_spcode)
```

```
## [1] 1551
```


<br>

***12. Which country had the largest overall catch in the year 2000?***



```r
global_total_catch_2000 <- fisheries_tidy2 %>% 
  group_by(country) %>%
  filter(year=="2000") %>% 
  summarize (
    total_catch = sum(catch_tonnes, na.rm=TRUE) 
  ) %>% 
  arrange(desc(total_catch))
```


```r
head(global_total_catch_2000)
```

```
## # A tibble: 6 x 2
##   country                  total_catch
##   <fct>                          <dbl>
## 1 Peru                        10625010
## 2 Japan                        4921013
## 3 United States of America     4692229
## 4 Chile                        4297928
## 5 Indonesia                    3761769
## 6 Russian Federation           3678828
```
In 2000, Peru was the country with the largest total catch (in tonnes).

<br>


***13. Which country caught the most sardines (_Sardina_) between the years 1990-2000?***


<br>
***14. Which five countries caught the most cephalopods between 2008-2012?***

<br>
***15. Given the top five countries from question 12 above, which species was the highest catch total? The lowest?***

<br>
***16. In some cases, the taxonomy of the fish being caught is unclear. Make a new data frame called `coastal_fish` that shows the taxonomic composition of "Miscellaneous coastal fishes" within the ISSCAAP_spgroupname column.***

<br>
***17. Use the data to do at least one exploratory analysis of your choice. What can you learn?***


<br><br><br>
