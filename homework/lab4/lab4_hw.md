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
  filter(year==2000) %>% 
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


```r
fisheries_tidy2$year <- as.numeric(fisheries_tidy2$year)
fisheries_tidy2$ASFIS_sciname <- as.character(fisheries_tidy2$ASFIS_sciname)
```


```r
sardine_total <- fisheries_tidy2 %>% 
  select(year, ASFIS_sciname, ISSCAAP_spgroupname, country, catch_tonnes) %>%
  filter(year >=1990, year<=2000, ASFIS_sciname=="Sardina pilchardus") %>% 
  group_by(country) %>% 
  summarize(sardina_catch_tonnes = sum(catch_tonnes, na.rm=TRUE)) %>% 
  arrange(desc(sardina_catch_tonnes))
```


```r
head(sardine_total)
```

```
## # A tibble: 6 x 2
##   country            sardina_catch_tonnes
##   <fct>                             <dbl>
## 1 Morocco                         4785190
## 2 Spain                           1425317
## 3 Russian Federation              1035139
## 4 Portugal                         926318
## 5 Ukraine                          784730
## 6 Italy                            377907
```
Between 1990 and 2000, Morocco caught the most Sardina pilchardus with 4785190 tonnes caught.



<br>
***14. Which five countries caught the most cephalopods between 2008-2012?***


```r
 cephalopod_total <- fisheries_tidy2 %>% 
  select(country, year, ISSCAAP_spgroupname, catch_tonnes) %>% 
  filter(ISSCAAP_spgroupname == "Squids, cuttlefishes, octopuses") %>% 
  filter(year >=2008, year <=2012) %>% 
  group_by(country) %>% 
  summarize(cephalopod_catch_tonnes = sum(catch_tonnes, na.rm=TRUE)) %>% 
  arrange(desc(cephalopod_catch_tonnes))
```


```r
head(cephalopod_total)
```

```
## # A tibble: 6 x 2
##   country            cephalopod_catch_tonnes
##   <fct>                                <dbl>
## 1 China                              4785139
## 2 Peru                               2274232
## 3 Korea, Republic of                 1535454
## 4 Japan                              1394041
## 5 Chile                               723186
## 6 Indonesia                           684567
```

Between 2008 and 2012, China caught the most cepalopods with 4785139 tonnes caught.


<br>
***15. Given the top five countries from question 12 above, which species was the highest catch total? The lowest?***

The top five countries with the highest global catch in 2000 are: Peru, Japan, The United States, Chile, and Indonesia. 


```r
top5 <- c("Peru", "Japan","United States of America", "Chile", "Indonesia")
```



```r
top5_catch <- fisheries_tidy2 %>% 
  select(country, year, ASFIS_sciname, catch_tonnes) %>% 
  filter(year==2000) %>% 
  filter(country %in% top5) %>% 
  group_by(ASFIS_sciname) %>% 
  summarize(
    catch_tonnes = max(catch_tonnes, na.rm=TRUE)
  ) %>% 
  arrange(desc(catch_tonnes))
```

Among the top 5 countries with the highest catch in 2000, `Engraulis ringens` was the most caught fish.

```r
top_n(top5_catch, 5, catch_tonnes)
```

```
## # A tibble: 5 x 2
##   ASFIS_sciname         catch_tonnes
##   <chr>                        <dbl>
## 1 Engraulis ringens          9575717
## 2 Trachurus murphyi          1234299
## 3 Theragra chalcogramma      1182438
## 4 Strangomera bentincki       722522
## 5 Brevoortia patronus         591434
```



```r
top_n(top5_catch,-19, catch_tonnes)
```

```
## # A tibble: 19 x 2
##    ASFIS_sciname              catch_tonnes
##    <chr>                             <dbl>
##  1 Brotula barbata                       1
##  2 Carcharias taurus                     1
##  3 Carcharodon carcharias                1
##  4 Caulolatilus microps                  1
##  5 Lobotes surinamensis                  1
##  6 Pleuronichthys decurrens              1
##  7 Tawera gayi                           1
##  8 Tresus spp                            1
##  9 Ammodytes spp                      -Inf
## 10 Asteroidea                         -Inf
## 11 Carcharhinus falciformis           -Inf
## 12 Carcharhinus leucas                -Inf
## 13 Euthynnus lineatus                 -Inf
## 14 Ginglymostoma cirratum             -Inf
## 15 Lachnolaimus maximus               -Inf
## 16 Microgadus proximus                -Inf
## 17 Orthopristis chrysoptera           -Inf
## 18 Osmerus mordax                     -Inf
## 19 Rhizoprionodon terraenovae         -Inf
```

Among the top 5 countries with the highest catch in 2000, `Tresus spp`, `Tawera gayi`, `Pleuronichthys decurrens`, `Lobotes surinamensis`, `Caulolatilus microps`, `Carcharodon carcharias` `Carcharias taurus` and `Brotula barbata` were all tied for the least caught.


<br>
***16. In some cases, the taxonomy of the fish being caught is unclear. Make a new data frame called `coastal_fish` that shows the taxonomic composition of "Miscellaneous coastal fishes" within the ISSCAAP_spgroupname column.***



```r
coastal_fish <- fisheries_tidy2 %>% 
  select(ISSCAAP_spgroupname, ASFIS_sciname) %>% 
  filter(ISSCAAP_spgroupname == "Miscellaneous coastal fishes") %>% 
  pivot_longer(cols = ASFIS_sciname,
               names_to = "species",
               values_to= "taxa"
  )
```


```r
coastal_fish$taxa <- as.factor(coastal_fish$taxa)
```


```r
nlevels(coastal_fish$taxa)
```

```
## [1] 412
```


Miscellaneous coastal fishes  are comprised of the following `412` species:

```r
levels(coastal_fish$taxa)
```

```
##   [1] "Acanthistius brasilianus"      "Acanthopagrus berda"          
##   [3] "Acanthopagrus bifasciatus"     "Acanthopagrus latus"          
##   [5] "Acanthopagrus schlegeli"       "Acanthuridae"                 
##   [7] "Acanthurus sohal"              "Aethaloperca rogaa"           
##   [9] "Albula vulpes"                 "Alepisaurus ferox"            
##  [11] "Ambassidae"                    "Ammodytes personatus"         
##  [13] "Ammodytes spp"                 "Amphichthys cryptocentrus"    
##  [15] "Aphareus rutilans"             "Aphia minuta"                 
##  [17] "Aplodactylus punctatus"        "Apogonidae"                   
##  [19] "Aprion virescens"              "Apsilus fuscus"               
##  [21] "Archosargus probatocephalus"   "Archosargus rhomboidalis"     
##  [23] "Argyrops spinifer"             "Argyrosomus hololepidotus"    
##  [25] "Argyrosomus regius"            "Argyrozona argyrozona"        
##  [27] "Ariidae"                       "Arius thalassinus"            
##  [29] "Arripis georgianus"            "Arripis trutta"               
##  [31] "Atractoscion aequidens"        "Atractoscion nobilis"         
##  [33] "Atrobucca nibe"                "Balistes carolinensis"        
##  [35] "Balistidae"                    "Batrachoididae"               
##  [37] "Bolbometopon muricatum"        "Boops boops"                  
##  [39] "Brachydeuterus auritus"        "Caesionidae"                  
##  [41] "Calamus spp"                   "Cantherhines (=Navodon) spp"  
##  [43] "Caprodon longimanus"           "Centrolabrus exoletus"        
##  [45] "Centropomus spp"               "Centropomus undecimalis"      
##  [47] "Centropristis striata"         "Cephalopholis argus"          
##  [49] "Cephalopholis boenak"          "Cephalopholis fulva"          
##  [51] "Cephalopholis hemistiktos"     "Cephalopholis miniata"        
##  [53] "Chaetodipterus zonatus"        "Cheilinus undulatus"          
##  [55] "Cheimerius nufar"              "Chelon haematocheilus"        
##  [57] "Chelon labrosus"               "Chrysoblephus spp"            
##  [59] "Cilus gilberti"                "Clepticus parrae"             
##  [61] "Conodon nobilis"               "Coris julis"                  
##  [63] "Cottidae"                      "Cottoperca gobio"             
##  [65] "Crenidens crenidens"           "Cromileptes altivelis"        
##  [67] "Ctenolabrus rupestris"         "Cymatoceps nasutus"           
##  [69] "Cynoscion acoupa"              "Cynoscion analis"             
##  [71] "Cynoscion arenarius"           "Cynoscion guatucupa"          
##  [73] "Cynoscion jamaicensis"         "Cynoscion leiarchus"          
##  [75] "Cynoscion nebulosus"           "Cynoscion regalis"            
##  [77] "Cynoscion spp"                 "Cynoscion striatus"           
##  [79] "Cynoscion virescens"           "Dactylopterus volitans"       
##  [81] "Dentex angolensis"             "Dentex congoensis"            
##  [83] "Dentex dentex"                 "Dentex macrophthalmus"        
##  [85] "Dentex spp"                    "Diagramma pictum"             
##  [87] "Diapterus auratus"             "Dicentrarchus labrax"         
##  [89] "Dicentrarchus punctatus"       "Dicentrarchus spp"            
##  [91] "Diplodus annularis"            "Diplodus argenteus"           
##  [93] "Diplodus puntazzo"             "Diplodus sargus"              
##  [95] "Diplodus spp"                  "Diplodus vulgaris"            
##  [97] "Drepane africana"              "Drepane punctata"             
##  [99] "Eleginops maclovinus"          "Eleutheronema tetradactylum"  
## [101] "Elops lacerta"                 "Elops saurus"                 
## [103] "Ephippidae"                    "Epinephelus adscensionis"     
## [105] "Epinephelus aeneus"            "Epinephelus analogus"         
## [107] "Epinephelus areolatus"         "Epinephelus caeruleopunctatus"
## [109] "Epinephelus caninus"           "Epinephelus chlorostigma"     
## [111] "Epinephelus coioides"          "Epinephelus drummondhayi"     
## [113] "Epinephelus fasciatus"         "Epinephelus flavolimbatus"    
## [115] "Epinephelus fuscoguttatus"     "Epinephelus goreensis"        
## [117] "Epinephelus guttatus"          "Epinephelus marginatus"       
## [119] "Epinephelus merra"             "Epinephelus morio"            
## [121] "Epinephelus morrhua"           "Epinephelus multinotatus"     
## [123] "Epinephelus mystacinus"        "Epinephelus nigritus"         
## [125] "Epinephelus niveatus"          "Epinephelus polylepis"        
## [127] "Epinephelus polyphekadion"     "Epinephelus spp"              
## [129] "Epinephelus striatus"          "Epinephelus summana"          
## [131] "Epinephelus tauvina"           "Eptatretus cirrhatus"         
## [133] "Etelis oculatus"               "Eucinostomus melanopterus"    
## [135] "Fistularia commersonii"        "Fistularia corneta"           
## [137] "Fistularia tabacaria"          "Galeichthys feliceps"         
## [139] "Galeoides decadactylus"        "Genyonemus lineatus"          
## [141] "Gerreidae"                     "Gerres nigri"                 
## [143] "Gerres oblongus"               "Gerres oyena"                 
## [145] "Gerres spp"                    "Girella nigricans"            
## [147] "Girella tricuspidata"          "Gobiidae"                     
## [149] "Grammoplites suppositus"       "Gymnocranius spp"             
## [151] "Haemulidae (=Pomadasyidae)"    "Haemulon album"               
## [153] "Haemulon plumierii"            "Haemulon spp"                 
## [155] "Halobatrachus didactylus"      "Harpadon nehereus"            
## [157] "Hexagrammos decagrammus"       "Holocentridae"                
## [159] "Hoplopagrus guentherii"        "Hypoptychus dybowskii"        
## [161] "Isacia conceptionis"           "Isopisthus parvipinnis"       
## [163] "Joturus pichardi"              "Kyphosidae"                   
## [165] "Labridae"                      "Labrus bergylta"              
## [167] "Labrus merula"                 "Lachnolaimus maximus"         
## [169] "Lagocephalus sceleratus"       "Lagodon rhomboides"           
## [171] "Larimichthys croceus"          "Larimichthys polyactis"       
## [173] "Larimus breviceps"             "Lateolabrax japonicus"        
## [175] "Leiognathidae"                 "Leiognathus spp"              
## [177] "Leiostomus xanthurus"          "Lepidoperca pulchella"        
## [179] "Leptomelanosoma indicum"       "Lethrinidae"                  
## [181] "Lethrinus atlanticus"          "Lethrinus borbonicus"         
## [183] "Lethrinus harak"               "Lethrinus lentjan"            
## [185] "Lethrinus mahsena"             "Lethrinus microdon"           
## [187] "Lethrinus miniatus"            "Lethrinus nebulosus"          
## [189] "Lethrinus obsoletus"           "Lethrinus xanthochilus"       
## [191] "Lithognathus lithognathus"     "Lithognathus mormyrus"        
## [193] "Lithognathus spp"              "Liza aurata"                  
## [195] "Liza klunzingeri"              "Liza saliens"                 
## [197] "Lutjanidae"                    "Lutjanus analis"              
## [199] "Lutjanus argentimaculatus"     "Lutjanus argentiventris"      
## [201] "Lutjanus bohar"                "Lutjanus buccanella"          
## [203] "Lutjanus campechanus"          "Lutjanus cyanopterus"         
## [205] "Lutjanus gibbus"               "Lutjanus griseus"             
## [207] "Lutjanus guttatus"             "Lutjanus johnii"              
## [209] "Lutjanus kasmira"              "Lutjanus malabaricus"         
## [211] "Lutjanus peru"                 "Lutjanus purpureus"           
## [213] "Lutjanus quinquelineatus"      "Lutjanus spp"                 
## [215] "Lutjanus synagris"             "Lutjanus vitta"               
## [217] "Lutjanus vivanus"              "Macrodon ancylodon"           
## [219] "Macrozoarces americanus"       "Malacanthus plumieri"         
## [221] "Megalops atlanticus"           "Megalops cyprinoides"         
## [223] "Mene maculata"                 "Menticirrhus americanus"      
## [225] "Menticirrhus littoralis"       "Menticirrhus saxatilis"       
## [227] "Menticirrhus spp"              "Mesogobius batrachocephalus"  
## [229] "Micropogonias furnieri"        "Micropogonias spp"            
## [231] "Micropogonias undulatus"       "Miichthys miiuy"              
## [233] "Monacanthidae"                 "Monotaxis grandoculis"        
## [235] "Mugil cephalus"                "Mugil curema"                 
## [237] "Mugil incilis"                 "Mugil liza"                   
## [239] "Mugil soiuy"                   "Mugilidae"                    
## [241] "Mullidae"                      "Mulloidichthys flavolineatus" 
## [243] "Mullus argentinae"             "Mullus barbatus"              
## [245] "Mullus spp"                    "Mullus surmuletus"            
## [247] "Muraena helena"                "Muraenidae"                   
## [249] "Mycteroperca bonaci"           "Mycteroperca microlepis"      
## [251] "Mycteroperca phenax"           "Mycteroperca spp"             
## [253] "Mycteroperca venenosa"         "Mycteroperca xenarcha"        
## [255] "Myoxocephalus scorpius"        "Myoxocephalus spp"            
## [257] "Myxinidae"                     "Naso unicornis"               
## [259] "Nemipteridae"                  "Nemipterus japonicus"         
## [261] "Nemipterus randalli"           "Nemipterus spp"               
## [263] "Nemipterus virgatus"           "Nibea mitsukurii"             
## [265] "Normanichthys crockeri"        "Notothenia acuta"             
## [267] "Notothenia coriiceps"          "Notothenia gibberifrons"      
## [269] "Notothenia kempi"              "Notothenia neglecta"          
## [271] "Notothenia rossii"             "Notothenia squamifrons"       
## [273] "Nototheniidae"                 "Nototheniops larseni"         
## [275] "Nototheniops mizops"           "Nototheniops nudifrons"       
## [277] "Nototheniops nybelini"         "Oblada melanura"              
## [279] "Ocyurus chrysurus"             "Ophichthidae"                 
## [281] "Ophiodon elongatus"            "Orthopristis chrysoptera"     
## [283] "Ostraciidae"                   "Otolithes ruber"              
## [285] "Pagellus acarne"               "Pagellus bellottii"           
## [287] "Pagellus bogaraveo"            "Pagellus erythrinus"          
## [289] "Pagellus spp"                  "Pagothenia hansoni"           
## [291] "Pagrus auratus"                "Pagrus caeruleostictus"       
## [293] "Pagrus pagrus"                 "Pagrus spp"                   
## [295] "Paralabrax humeralis"          "Paralabrax spp"               
## [297] "Paralonchurus peruanus"        "Parapercis colias"            
## [299] "Parapristipoma octolineatum"   "Parika scaber"                
## [301] "Pelates quadrilineatus"        "Pennahia anea"                
## [303] "Pennahia argentata"            "Pentanemus quinquarius"       
## [305] "Percoidei"                     "Percophis brasiliensis"       
## [307] "Petrus rupestris"              "Pinguipes brasilianus"        
## [309] "Pinguipes chilensis"           "Platax spp"                   
## [311] "Platycephalidae"               "Platycephalus indicus"        
## [313] "Plectorhinchus gaterinus"      "Plectorhinchus macrolepis"    
## [315] "Plectorhinchus mediterraneus"  "Plectorhinchus pictus"        
## [317] "Plectorhinchus schotaf"        "Plectorhinchus sordidus"      
## [319] "Plectorhinchus spp"            "Plectropomus areolatus"       
## [321] "Plectropomus leopardus"        "Plectropomus pessuliferus"    
## [323] "Pleuragramma antarcticum"      "Pleurogrammus azonus"         
## [325] "Pleurogrammus monopterygius"   "Plotosus spp"                 
## [327] "Pogonias cromis"               "Polydactylus quadrifilis"     
## [329] "Polynemidae"                   "Pomacanthidae"                
## [331] "Pomacanthus maculosus"         "Pomadasys argenteus"          
## [333] "Pomadasys incisus"             "Pomadasys jubelini"           
## [335] "Pomadasys kaakan"              "Pomadasys stridens"           
## [337] "Pomatoschistus microps"        "Priacanthus macracanthus"     
## [339] "Priacanthus spp"               "Pristipomoides spp"           
## [341] "Prolatilus jugularis"          "Protemblemaria bicirris"      
## [343] "Pseudopercis semifasciata"     "Pseudotolithus elongatus"     
## [345] "Pseudotolithus senegalensis"   "Pseudotolithus senegallus"    
## [347] "Pseudotolithus spp"            "Pseudupeneus prayensis"       
## [349] "Pterogymnus laniarius"         "Pteroscion peli"              
## [351] "Pterothrissus belloci"         "Rhabdosargus globiceps"       
## [353] "Rhabdosargus haffara"          "Rhomboplites aurorubens"      
## [355] "Sargocentron spiniferum"       "Sarpa salpa"                  
## [357] "Saurida tumbil"                "Saurida undosquamis"          
## [359] "Scaridae"                      "Scarus ghobban"               
## [361] "Scarus persicus"               "Scatophagus spp"              
## [363] "Sciaena umbra"                 "Sciaenidae"                   
## [365] "Sciaenops ocellatus"           "Scolopsis spp"                
## [367] "Scolopsis taeniata"            "Scorpaenichthys marmoratus"   
## [369] "Semicossyphus pulcher"         "Serranidae"                   
## [371] "Serranus atricauda"            "Serranus cabrilla"            
## [373] "Serranus scriba"               "Serranus spp"                 
## [375] "Siganus spp"                   "Sillaginidae"                 
## [377] "Sillago sihama"                "Sparidae"                     
## [379] "Sparidentex hasta"             "Sparisoma cretense"           
## [381] "Sparus aurata"                 "Sphoeroides maculatus"        
## [383] "Sphoeroides spp"               "Spicara maena"                
## [385] "Spicara smaris"                "Spicara spp"                  
## [387] "Spondyliosoma cantharus"       "Stenotomus chrysops"          
## [389] "Stephanolepis cirrhifer"       "Stereolepis gigas"            
## [391] "Symphodus melops"              "Synodontidae"                 
## [393] "Synodus saurus"                "Tautoga onitis"               
## [395] "Tautogolabrus adspersus"       "Terapon spp"                  
## [397] "Tetraodontidae"                "Totoaba macdonaldi"           
## [399] "Trachinidae"                   "Trachinus draco"              
## [401] "Trachinus spp"                 "Tragulichthys jaculiferus"    
## [403] "Trematomus eulepidotus"        "Trematomus spp"               
## [405] "Umbrina canariensis"           "Umbrina canosai"              
## [407] "Umbrina cirrosa"               "Upeneus spp"                  
## [409] "Valamugil seheli"              "Variola louti"                
## [411] "Xyrichtys novacula"            "Zoarces viviparus"
```


<br>
***17. Use the data to do at least one exploratory analysis of your choice. What can you learn?***

Following the Fukishima nuclear diseaser in Japan did fishing levels immediately drop? -- Since data only goes until 2012, I will compare 2012 levels to 2011 and 2010 levels.


```r
fisheries_tidy2 %>% 
  select(country, year, ASFIS_sciname, catch_tonnes) %>% 
  filter(country=="Japan") %>% 
  filter(year <=2012, year>=2010) %>% 
  group_by(year) %>% 
  summarize(
    total_catch_japan = sum(catch_tonnes, na.rm=TRUE)
  )
```

```
## # A tibble: 3 x 2
##    year total_catch_japan
##   <dbl>             <dbl>
## 1  2010           3996016
## 2  2011           3714832
## 3  2012            531113
```

Wow! The fishing industry seems to have been really affected by the nucelear diseaser.



<br><br><br><br>
