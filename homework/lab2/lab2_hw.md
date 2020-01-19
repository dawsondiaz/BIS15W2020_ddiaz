---
title: "Lab 2 Homework"
author: "Dawson Diaz"
date: "Winter 2020"
output:
  html_document:
    keep_md: yes
    theme: spacelab
---
<br>

### Load the tidyverse

```r
#install.packages("tidyverse")
#install.packages("knitr")
library("tidyverse")
```

```
## ── Attaching packages ─────────────────────────────────────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✔ ggplot2 3.2.1     ✔ purrr   0.3.3
## ✔ tibble  2.1.3     ✔ dplyr   0.8.3
## ✔ tidyr   1.0.0     ✔ stringr 1.4.0
## ✔ readr   1.3.1     ✔ forcats 0.4.0
```

```
## ── Conflicts ────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

```r
library("knitr")
```

<br>

### Mammals Sleep Dataset
For this assignment, we are going to use built-in data on mammal sleep patterns.  

```r
msleep
```

```
## # A tibble: 83 x 11
##    name  genus vore  order conservation sleep_total sleep_rem sleep_cycle awake
##    <chr> <chr> <chr> <chr> <chr>              <dbl>     <dbl>       <dbl> <dbl>
##  1 Chee… Acin… carni Carn… lc                  12.1      NA        NA      11.9
##  2 Owl … Aotus omni  Prim… <NA>                17         1.8      NA       7  
##  3 Moun… Aplo… herbi Rode… nt                  14.4       2.4      NA       9.6
##  4 Grea… Blar… omni  Sori… lc                  14.9       2.3       0.133   9.1
##  5 Cow   Bos   herbi Arti… domesticated         4         0.7       0.667  20  
##  6 Thre… Brad… herbi Pilo… <NA>                14.4       2.2       0.767   9.6
##  7 Nort… Call… carni Carn… vu                   8.7       1.4       0.383  15.3
##  8 Vesp… Calo… <NA>  Rode… <NA>                 7        NA        NA      17  
##  9 Dog   Canis carni Carn… domesticated        10.1       2.9       0.333  13.9
## 10 Roe … Capr… herbi Arti… lc                   3        NA        NA      21  
## # … with 73 more rows, and 2 more variables: brainwt <dbl>, bodywt <dbl>
```
<br>

### Problems

***1. From which publication are these data taken from? Don't do an internet search; show the code that you would use to find out in R.***



```r
help(msleep)
```

This pulls up the "help" viewer on the right hand side of R studio which provides documentation about each of the column variables. It also states that this data comes from *V. M. Savage and G. B. West. A quantitative, theoretical framework for understanding mammalian sleep. Proceedings of the National Academy of Sciences, 104 (3):1051-1056, 2007.*

<br>

***2. Put these data into a new object `sleep`. Make sure they are organized as a data frame.***


```r
sleep <- data.frame(msleep)
```

<br>
**3. Show a list of the column names is this data frame.**


```r
names(sleep)
```

```
##  [1] "name"         "genus"        "vore"         "order"        "conservation"
##  [6] "sleep_total"  "sleep_rem"    "sleep_cycle"  "awake"        "brainwt"     
## [11] "bodywt"
```
<br>


***4. Use `glimpse()` to summarize the data in `sleep`.***


```r
glimpse(sleep)
```

```
## Observations: 83
## Variables: 11
## $ name         <chr> "Cheetah", "Owl monkey", "Mountain beaver", "Greater sho…
## $ genus        <chr> "Acinonyx", "Aotus", "Aplodontia", "Blarina", "Bos", "Br…
## $ vore         <chr> "carni", "omni", "herbi", "omni", "herbi", "herbi", "car…
## $ order        <chr> "Carnivora", "Primates", "Rodentia", "Soricomorpha", "Ar…
## $ conservation <chr> "lc", NA, "nt", "lc", "domesticated", NA, "vu", NA, "dom…
## $ sleep_total  <dbl> 12.1, 17.0, 14.4, 14.9, 4.0, 14.4, 8.7, 7.0, 10.1, 3.0, …
## $ sleep_rem    <dbl> NA, 1.8, 2.4, 2.3, 0.7, 2.2, 1.4, NA, 2.9, NA, 0.6, 0.8,…
## $ sleep_cycle  <dbl> NA, NA, NA, 0.1333333, 0.6666667, 0.7666667, 0.3833333, …
## $ awake        <dbl> 11.9, 7.0, 9.6, 9.1, 20.0, 9.6, 15.3, 17.0, 13.9, 21.0, …
## $ brainwt      <dbl> NA, 0.01550, NA, 0.00029, 0.42300, NA, NA, NA, 0.07000, …
## $ bodywt       <dbl> 50.000, 0.480, 1.350, 0.019, 600.000, 3.850, 20.490, 0.0…
```

<br>

***5. Use `summary()` to summarize the data in `sleep`.***


```r
summary(sleep)
```

```
##      name              genus               vore              order          
##  Length:83          Length:83          Length:83          Length:83         
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##  conservation        sleep_total      sleep_rem      sleep_cycle    
##  Length:83          Min.   : 1.90   Min.   :0.100   Min.   :0.1167  
##  Class :character   1st Qu.: 7.85   1st Qu.:0.900   1st Qu.:0.1833  
##  Mode  :character   Median :10.10   Median :1.500   Median :0.3333  
##                     Mean   :10.43   Mean   :1.875   Mean   :0.4396  
##                     3rd Qu.:13.75   3rd Qu.:2.400   3rd Qu.:0.5792  
##                     Max.   :19.90   Max.   :6.600   Max.   :1.5000  
##                                     NA's   :22      NA's   :51      
##      awake          brainwt            bodywt        
##  Min.   : 4.10   Min.   :0.00014   Min.   :   0.005  
##  1st Qu.:10.25   1st Qu.:0.00290   1st Qu.:   0.174  
##  Median :13.90   Median :0.01240   Median :   1.670  
##  Mean   :13.57   Mean   :0.28158   Mean   : 166.136  
##  3rd Qu.:16.15   3rd Qu.:0.12550   3rd Qu.:  41.750  
##  Max.   :22.10   Max.   :5.71200   Max.   :6654.000  
##                  NA's   :27
```

<br>

***6. Print out the first column of the data frame and then print out the first row.***

First  column:

```r
(sleep[,1])
```

```
##  [1] "Cheetah"                        "Owl monkey"                    
##  [3] "Mountain beaver"                "Greater short-tailed shrew"    
##  [5] "Cow"                            "Three-toed sloth"              
##  [7] "Northern fur seal"              "Vesper mouse"                  
##  [9] "Dog"                            "Roe deer"                      
## [11] "Goat"                           "Guinea pig"                    
## [13] "Grivet"                         "Chinchilla"                    
## [15] "Star-nosed mole"                "African giant pouched rat"     
## [17] "Lesser short-tailed shrew"      "Long-nosed armadillo"          
## [19] "Tree hyrax"                     "North American Opossum"        
## [21] "Asian elephant"                 "Big brown bat"                 
## [23] "Horse"                          "Donkey"                        
## [25] "European hedgehog"              "Patas monkey"                  
## [27] "Western american chipmunk"      "Domestic cat"                  
## [29] "Galago"                         "Giraffe"                       
## [31] "Pilot whale"                    "Gray seal"                     
## [33] "Gray hyrax"                     "Human"                         
## [35] "Mongoose lemur"                 "African elephant"              
## [37] "Thick-tailed opposum"           "Macaque"                       
## [39] "Mongolian gerbil"               "Golden hamster"                
## [41] "Vole "                          "House mouse"                   
## [43] "Little brown bat"               "Round-tailed muskrat"          
## [45] "Slow loris"                     "Degu"                          
## [47] "Northern grasshopper mouse"     "Rabbit"                        
## [49] "Sheep"                          "Chimpanzee"                    
## [51] "Tiger"                          "Jaguar"                        
## [53] "Lion"                           "Baboon"                        
## [55] "Desert hedgehog"                "Potto"                         
## [57] "Deer mouse"                     "Phalanger"                     
## [59] "Caspian seal"                   "Common porpoise"               
## [61] "Potoroo"                        "Giant armadillo"               
## [63] "Rock hyrax"                     "Laboratory rat"                
## [65] "African striped mouse"          "Squirrel monkey"               
## [67] "Eastern american mole"          "Cotton rat"                    
## [69] "Mole rat"                       "Arctic ground squirrel"        
## [71] "Thirteen-lined ground squirrel" "Golden-mantled ground squirrel"
## [73] "Musk shrew"                     "Pig"                           
## [75] "Short-nosed echidna"            "Eastern american chipmunk"     
## [77] "Brazilian tapir"                "Tenrec"                        
## [79] "Tree shrew"                     "Bottle-nosed dolphin"          
## [81] "Genet"                          "Arctic fox"                    
## [83] "Red fox"
```

<br>

First row:

```r
kable(sleep[1,])
```



name      genus      vore    order       conservation    sleep_total   sleep_rem   sleep_cycle   awake   brainwt   bodywt
--------  ---------  ------  ----------  -------------  ------------  ----------  ------------  ------  --------  -------
Cheetah   Acinonyx   carni   Carnivora   lc                     12.1          NA            NA    11.9        NA       50

<br>

***7. We are interested in two groups; small and large mammals. Let's define small as less than or equal to 1kg body weight and large as greater than or equal to 200kg body weight. Make two new dataframes (large and small) based on these parameters.***



```r
large <- subset(sleep, bodywt>=200)
large
```

```
##                name         genus  vore          order conservation sleep_total
## 5               Cow           Bos herbi   Artiodactyla domesticated         4.0
## 21   Asian elephant       Elephas herbi    Proboscidea           en         3.9
## 23            Horse         Equus herbi Perissodactyla domesticated         2.9
## 30          Giraffe       Giraffa herbi   Artiodactyla           cd         1.9
## 31      Pilot whale Globicephalus carni        Cetacea           cd         2.7
## 36 African elephant     Loxodonta herbi    Proboscidea           vu         3.3
## 77  Brazilian tapir       Tapirus herbi Perissodactyla           vu         4.4
##    sleep_rem sleep_cycle awake brainwt   bodywt
## 5        0.7   0.6666667 20.00   0.423  600.000
## 21        NA          NA 20.10   4.603 2547.000
## 23       0.6   1.0000000 21.10   0.655  521.000
## 30       0.4          NA 22.10      NA  899.995
## 31       0.1          NA 21.35      NA  800.000
## 36        NA          NA 20.70   5.712 6654.000
## 77       1.0   0.9000000 19.60   0.169  207.501
```


```r
small <- subset(sleep, bodywt<=1)
kable(small)
```

     name                             genus          vore      order             conservation    sleep_total   sleep_rem   sleep_cycle   awake   brainwt   bodywt
---  -------------------------------  -------------  --------  ----------------  -------------  ------------  ----------  ------------  ------  --------  -------
2    Owl monkey                       Aotus          omni      Primates          NA                     17.0         1.8            NA     7.0   0.01550    0.480
4    Greater short-tailed shrew       Blarina        omni      Soricomorpha      lc                     14.9         2.3     0.1333333     9.1   0.00029    0.019
8    Vesper mouse                     Calomys        NA        Rodentia          NA                      7.0          NA            NA    17.0        NA    0.045
12   Guinea pig                       Cavis          herbi     Rodentia          domesticated            9.4         0.8     0.2166667    14.6   0.00550    0.728
14   Chinchilla                       Chinchilla     herbi     Rodentia          domesticated           12.5         1.5     0.1166667    11.5   0.00640    0.420
15   Star-nosed mole                  Condylura      omni      Soricomorpha      lc                     10.3         2.2            NA    13.7   0.00100    0.060
16   African giant pouched rat        Cricetomys     omni      Rodentia          NA                      8.3         2.0            NA    15.7   0.00660    1.000
17   Lesser short-tailed shrew        Cryptotis      omni      Soricomorpha      lc                      9.1         1.4     0.1500000    14.9   0.00014    0.005
22   Big brown bat                    Eptesicus      insecti   Chiroptera        lc                     19.7         3.9     0.1166667     4.3   0.00030    0.023
25   European hedgehog                Erinaceus      omni      Erinaceomorpha    lc                     10.1         3.5     0.2833333    13.9   0.00350    0.770
27   Western american chipmunk        Eutamias       herbi     Rodentia          NA                     14.9          NA            NA     9.1        NA    0.071
29   Galago                           Galago         omni      Primates          NA                      9.8         1.1     0.5500000    14.2   0.00500    0.200
37   Thick-tailed opposum             Lutreolina     carni     Didelphimorphia   lc                     19.4         6.6            NA     4.6        NA    0.370
39   Mongolian gerbil                 Meriones       herbi     Rodentia          lc                     14.2         1.9            NA     9.8        NA    0.053
40   Golden hamster                   Mesocricetus   herbi     Rodentia          en                     14.3         3.1     0.2000000     9.7   0.00100    0.120
41   Vole                             Microtus       herbi     Rodentia          NA                     12.8          NA            NA    11.2        NA    0.035
42   House mouse                      Mus            herbi     Rodentia          nt                     12.5         1.4     0.1833333    11.5   0.00040    0.022
43   Little brown bat                 Myotis         insecti   Chiroptera        NA                     19.9         2.0     0.2000000     4.1   0.00025    0.010
44   Round-tailed muskrat             Neofiber       herbi     Rodentia          nt                     14.6          NA            NA     9.4        NA    0.266
46   Degu                             Octodon        herbi     Rodentia          lc                      7.7         0.9            NA    16.3        NA    0.210
47   Northern grasshopper mouse       Onychomys      carni     Rodentia          lc                     14.5          NA            NA     9.5        NA    0.028
55   Desert hedgehog                  Paraechinus    NA        Erinaceomorpha    lc                     10.3         2.7            NA    13.7   0.00240    0.550
57   Deer mouse                       Peromyscus     NA        Rodentia          NA                     11.5          NA            NA    12.5        NA    0.021
64   Laboratory rat                   Rattus         herbi     Rodentia          lc                     13.0         2.4     0.1833333    11.0   0.00190    0.320
65   African striped mouse            Rhabdomys      omni      Rodentia          NA                      8.7          NA            NA    15.3        NA    0.044
66   Squirrel monkey                  Saimiri        omni      Primates          NA                      9.6         1.4            NA    14.4   0.02000    0.743
67   Eastern american mole            Scalopus       insecti   Soricomorpha      lc                      8.4         2.1     0.1666667    15.6   0.00120    0.075
68   Cotton rat                       Sigmodon       herbi     Rodentia          NA                     11.3         1.1     0.1500000    12.7   0.00118    0.148
69   Mole rat                         Spalax         NA        Rodentia          NA                     10.6         2.4            NA    13.4   0.00300    0.122
70   Arctic ground squirrel           Spermophilus   herbi     Rodentia          lc                     16.6          NA            NA     7.4   0.00570    0.920
71   Thirteen-lined ground squirrel   Spermophilus   herbi     Rodentia          lc                     13.8         3.4     0.2166667    10.2   0.00400    0.101
72   Golden-mantled ground squirrel   Spermophilus   herbi     Rodentia          lc                     15.9         3.0            NA     8.1        NA    0.205
73   Musk shrew                       Suncus         NA        Soricomorpha      NA                     12.8         2.0     0.1833333    11.2   0.00033    0.048
76   Eastern american chipmunk        Tamias         herbi     Rodentia          NA                     15.8          NA            NA     8.2        NA    0.112
78   Tenrec                           Tenrec         omni      Afrosoricida      NA                     15.6         2.3            NA     8.4   0.00260    0.900
79   Tree shrew                       Tupaia         omni      Scandentia        NA                      8.9         2.6     0.2333333    15.1   0.00250    0.104

<br>

***8. What is the mean weight for both the large and small mammals?***


Large mammals:

```r
mean(large$bodywt)
```

```
## [1] 1747.071
```

Small mammals:

```r
mean(small$bodywt)
```

```
## [1] 0.2596667
```

Mean weight of large and small mammals combined:

```r
total_weight <- (sum(large$bodywt) + sum(small$bodywt))

total_obs <- (length(large$bodywt) + length(small$bodywt))

print(total_weight/total_obs)
```

```
## [1] 284.6243
```


<br>

***9. Let's try to figure out if large mammals sleep, on average, longer than small mammals. What is the average sleep duration for large mammals as we have defined them?***


```r
mean(large$sleep_total)
```

```
## [1] 3.3
```

<br>

***10. What is the average sleep duration for small mammals as we have defined them?***



```r
mean(small$sleep_total)
```

```
## [1] 12.65833
```

<br>

***11. Which animals are the sleepiest? Which sleep least 18 hours per day?***


```r
if (mean(large$sleep_total) > mean(small$sleep_total))
  print("Large animals are the sleepiest") 

if (mean(large$sleep_total) < mean(small$sleep_total))
  print("Small animals are the sleepiest")
```

```
## [1] "Small animals are the sleepiest"
```

<br>

These animals sleep at least 18 hours per day:

```r
small$name[small$sleep_total>18]
```

```
## [1] "Big brown bat"        "Thick-tailed opposum" "Little brown bat"
```

```r
large$name[large$sleep_total>18]
```

```
## character(0)
```





<br><br><br>
