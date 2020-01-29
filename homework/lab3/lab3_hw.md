---
title: "Lab 3 Homework"
author: "Dawson Diaz"
date: "Winter 2020"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---
<br>



**Load the tidyverse**


```r
library(tidyverse)
```

<br>

**1. Load the data into a new object called `homerange`.**  


```r
homerange <- readr::read_csv("data/Tamburelloetal_HomeRangeDatabase.csv")
```

<br>

**2. Use `spec()` to see the full details of the columns.**


```r
spec(homerange)
```

```
## cols(
##   taxon = col_character(),
##   common.name = col_character(),
##   class = col_character(),
##   order = col_character(),
##   family = col_character(),
##   genus = col_character(),
##   species = col_character(),
##   primarymethod = col_character(),
##   N = col_character(),
##   mean.mass.g = col_double(),
##   log10.mass = col_double(),
##   alternative.mass.reference = col_character(),
##   mean.hra.m2 = col_double(),
##   log10.hra = col_double(),
##   hra.reference = col_character(),
##   realm = col_character(),
##   thermoregulation = col_character(),
##   locomotion = col_character(),
##   trophic.guild = col_character(),
##   dimension = col_character(),
##   preymass = col_double(),
##   log10.preymass = col_double(),
##   PPMR = col_double(),
##   prey.size.reference = col_character()
## )
```

<br>

**3. Explore the data. Show the dimensions, column names, classes for each variable, and a statistical summary. Keep these as separate code chunks. **

Dimensions

```r
dim(homerange)
```

```
## [1] 569  24
```
<br>
Column Names

```r
colnames(homerange)
```

```
##  [1] "taxon"                      "common.name"               
##  [3] "class"                      "order"                     
##  [5] "family"                     "genus"                     
##  [7] "species"                    "primarymethod"             
##  [9] "N"                          "mean.mass.g"               
## [11] "log10.mass"                 "alternative.mass.reference"
## [13] "mean.hra.m2"                "log10.hra"                 
## [15] "hra.reference"              "realm"                     
## [17] "thermoregulation"           "locomotion"                
## [19] "trophic.guild"              "dimension"                 
## [21] "preymass"                   "log10.preymass"            
## [23] "PPMR"                       "prey.size.reference"
```
<br>
Classes

the  `lapply()` function applies the `class()` function to the dataframe columns of `homerange`.

```r
lapply(homerange, class)
```

```
## $taxon
## [1] "character"
## 
## $common.name
## [1] "character"
## 
## $class
## [1] "character"
## 
## $order
## [1] "character"
## 
## $family
## [1] "character"
## 
## $genus
## [1] "character"
## 
## $species
## [1] "character"
## 
## $primarymethod
## [1] "character"
## 
## $N
## [1] "character"
## 
## $mean.mass.g
## [1] "numeric"
## 
## $log10.mass
## [1] "numeric"
## 
## $alternative.mass.reference
## [1] "character"
## 
## $mean.hra.m2
## [1] "numeric"
## 
## $log10.hra
## [1] "numeric"
## 
## $hra.reference
## [1] "character"
## 
## $realm
## [1] "character"
## 
## $thermoregulation
## [1] "character"
## 
## $locomotion
## [1] "character"
## 
## $trophic.guild
## [1] "character"
## 
## $dimension
## [1] "character"
## 
## $preymass
## [1] "numeric"
## 
## $log10.preymass
## [1] "numeric"
## 
## $PPMR
## [1] "numeric"
## 
## $prey.size.reference
## [1] "character"
```
<br>
Stastical Summaries

```r
summary(homerange)
```

```
##     taxon           common.name           class              order          
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##     family             genus             species          primarymethod     
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##       N              mean.mass.g        log10.mass     
##  Length:569         Min.   :      0   Min.   :-0.6576  
##  Class :character   1st Qu.:     50   1st Qu.: 1.6990  
##  Mode  :character   Median :    330   Median : 2.5185  
##                     Mean   :  34602   Mean   : 2.5947  
##                     3rd Qu.:   2150   3rd Qu.: 3.3324  
##                     Max.   :4000000   Max.   : 6.6021  
##                                                        
##  alternative.mass.reference  mean.hra.m2          log10.hra     
##  Length:569                 Min.   :0.000e+00   Min.   :-1.523  
##  Class :character           1st Qu.:4.500e+03   1st Qu.: 3.653  
##  Mode  :character           Median :3.934e+04   Median : 4.595  
##                             Mean   :2.146e+07   Mean   : 4.709  
##                             3rd Qu.:1.038e+06   3rd Qu.: 6.016  
##                             Max.   :3.551e+09   Max.   : 9.550  
##                                                                 
##  hra.reference         realm           thermoregulation    locomotion       
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##  trophic.guild       dimension            preymass         log10.preymass   
##  Length:569         Length:569         Min.   :     0.67   Min.   :-0.1739  
##  Class :character   Class :character   1st Qu.:    20.02   1st Qu.: 1.3014  
##  Mode  :character   Mode  :character   Median :    53.75   Median : 1.7304  
##                                        Mean   :  3989.88   Mean   : 2.0188  
##                                        3rd Qu.:   363.35   3rd Qu.: 2.5603  
##                                        Max.   :130233.20   Max.   : 5.1147  
##                                        NA's   :502         NA's   :502      
##       PPMR         prey.size.reference
##  Min.   :  0.380   Length:569         
##  1st Qu.:  3.315   Class :character   
##  Median :  7.190   Mode  :character   
##  Mean   : 31.752                      
##  3rd Qu.: 15.966                      
##  Max.   :530.000                      
##  NA's   :502
```

<br>

**4. Are there NA's in your data? Show the code that you would use to verify this, please.**

Yes, there are NA values in the data. This is verified by running the `anyNA` function

```r
anyNA(homerange)
```

```
## [1] TRUE
```

<br>
**5. Change the class of the variables `taxon` and `order` to factors and display their levels.**


```r
homerange$taxon <- as.factor(homerange$taxon)
levels(homerange$taxon)
```

```
## [1] "birds"         "lake fishes"   "lizards"       "mammals"      
## [5] "marine fishes" "river fishes"  "snakes"        "tortoises"    
## [9] "turtles"
```

<br>


```r
homerange$order <- as.factor(homerange$order)
levels(homerange$order)
```

```
##  [1] "accipitriformes"    "afrosoricida"       "anguilliformes"    
##  [4] "anseriformes"       "apterygiformes"     "artiodactyla"      
##  [7] "caprimulgiformes"   "carnivora"          "charadriiformes"   
## [10] "columbidormes"      "columbiformes"      "coraciiformes"     
## [13] "cuculiformes"       "cypriniformes"      "dasyuromorpha"     
## [16] "dasyuromorpia"      "didelphimorphia"    "diprodontia"       
## [19] "diprotodontia"      "erinaceomorpha"     "esociformes"       
## [22] "falconiformes"      "gadiformes"         "galliformes"       
## [25] "gruiformes"         "lagomorpha"         "macroscelidea"     
## [28] "monotrematae"       "passeriformes"      "pelecaniformes"    
## [31] "peramelemorphia"    "perciformes"        "perissodactyla"    
## [34] "piciformes"         "pilosa"             "proboscidea"       
## [37] "psittaciformes"     "rheiformes"         "roden"             
## [40] "rodentia"           "salmoniformes"      "scorpaeniformes"   
## [43] "siluriformes"       "soricomorpha"       "squamata"          
## [46] "strigiformes"       "struthioniformes"   "syngnathiformes"   
## [49] "testudines"         "tetraodontiformes\xa0" "tinamiformes"
```

<br>


**6. Make a new dataframe `deer` that is limited to the mean mass, log10 mass, family, genus, and species of deer in the database. The family for deer is cervidae. Arrange the data in descending order by log10 mass. Which is the largest deer?** 


```r
deer <-homerange %>%
  select(family, genus, species, mean.mass.g, log10.mass) %>% 
  filter(family == "cervidae") %>% 
  arrange(desc(log10.mass))
```


```r
deer
```

```
## # A tibble: 12 x 5
##    family   genus      species     mean.mass.g log10.mass
##    <chr>    <chr>      <chr>             <dbl>      <dbl>
##  1 cervidae alces      alces           307227.       5.49
##  2 cervidae cervus     elaphus         234758.       5.37
##  3 cervidae rangifer   tarandus        102059.       5.01
##  4 cervidae odocoileus virginianus      87884.       4.94
##  5 cervidae dama       dama             71450.       4.85
##  6 cervidae axis       axis             62823.       4.80
##  7 cervidae odocoileus hemionus         53864.       4.73
##  8 cervidae ozotoceros bezoarticus      35000.       4.54
##  9 cervidae cervus     nippon           29450.       4.47
## 10 cervidae capreolus  capreolus        24050.       4.38
## 11 cervidae muntiacus  reevesi          13500.       4.13
## 12 cervidae pudu       puda              7500.       3.88
```

<br>

To find the largest deer...

```r
largest_deer <- max(deer$mean.mass.g, na.rm=TRUE)
filter(deer, mean.mass.g == largest_deer)
```

```
## # A tibble: 1 x 5
##   family   genus species mean.mass.g log10.mass
##   <chr>    <chr> <chr>         <dbl>      <dbl>
## 1 cervidae alces alces       307227.       5.49
```

<br>

**7. As measured by the data, which snake species has the smallest homerange? Show all of your work, please. Look this species up online and tell me about it!**  


```r
snakes <- homerange %>% 
    select(taxon, family, genus, species, mean.hra.m2) %>% 
    filter(taxon == "snakes") %>% 
    arrange(mean.hra.m2)
```
<br>

```r
min_hra.m2_snake <- min(snakes$mean.hra.m2)
filter(snakes, mean.hra.m2 == min_hra.m2_snake)
```

```
## # A tibble: 1 x 5
##   taxon  family    genus species    mean.hra.m2
##   <fct>  <chr>     <chr> <chr>            <dbl>
## 1 snakes viperidae bitis schneideri         200
```
The snake species with the smallest homerange is *Bitis schenideri*. Found in the coastal regions of Namibia and South Africa, it has an average homerange of 200 square meters. It has an average length of 10-25cm, which might make it the world's smallest viperid. It was named after Dr. Oskar Schneider.
<br><br>
**8. You suspect that homerange and mass are correlated in birds. We need a ratio that facilitates exploration of this prediction. First, build a new dataframe called `hra_ratio` that is limited to genus, species, mean.mass.g, log10.mass, log10.hra. Arrange it in ascending order by mean mass in grams.**


<br>
**9. Replace the existing `hra_ratio` dataframe with a new dataframe that adds a column calculating the ratio of log 10 hra to log 10 mass. Call it `hra.mass.ratio`. Arrange it in descending order by mean mass in grams.** 


<br>
**10. What is the lowest mass for birds with a `hra.mass.ratio` greater than or equal to 4.0?**


<br>
**11. Do a search online; what is the common name of the bird from #8 above? Place a link in your markdown file that takes us to a webpage with information on its biology.**  

<br>
**12. What is the `hra.mass.ratio` for an ostrich? Show your work, please.**  

<br><br><br> 
