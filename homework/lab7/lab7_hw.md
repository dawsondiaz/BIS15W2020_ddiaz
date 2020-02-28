---
title: "Lab 7 Homework"
author: "Dawson Diaz"
date: "2020-02-27"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---





### Libraries

```r
library(tidyverse)
library(shiny)
library(shinydashboard)
```

### Data
The data for this assignment come from the [University of California Information Center](https://www.universityofcalifornia.edu/infocenter). Admissions data were collected for the years 2010-2019 for each UC campus. Admissions are broken down into three categories: applications, admits, and enrollees. The number of individuals in each category are presented by demographic.  

```r
UC_admit <- readr::read_csv("data/UC_admit.csv")
```

```
## Parsed with column specification:
## cols(
##   Campus = col_character(),
##   Academic_Yr = col_double(),
##   Category = col_character(),
##   Ethnicity = col_character(),
##   `Perc FR` = col_character(),
##   FilteredCountFR = col_double()
## )
```

<br>
**1. Use the function(s) of your choice to get an idea of the overall structure of the data frame, including its dimensions, column names, variable classes, etc. As part of this, determine if there are NA's and how they are treated.**



```r
anyNA(UC_admit)
```

```
## [1] TRUE
```

This data set does have NA values, they are recognized by R as `NA`


<br>

```r
glimpse(UC_admit)
```

```
## Observations: 2,160
## Variables: 6
## $ Campus          <chr> "Davis", "Davis", "Davis", "Davis", "Davis", "Davis",…
## $ Academic_Yr     <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2018,…
## $ Category        <chr> "Applicants", "Applicants", "Applicants", "Applicants…
## $ Ethnicity       <chr> "International", "Unknown", "White", "Asian", "Chican…
## $ `Perc FR`       <chr> "21.16%", "2.51%", "18.39%", "30.76%", "22.44%", "0.3…
## $ FilteredCountFR <dbl> 16522, 1959, 14360, 24024, 17526, 277, 3425, 78093, 1…
```
<br>

```r
UC_admit$Campus <- as.factor(UC_admit$Campus)
levels(UC_admit$Campus)
```

```
## [1] "Berkeley"      "Davis"         "Irvine"        "Los_Angeles"  
## [5] "Merced"        "Riverside"     "San_Diego"     "Santa_Barbara"
## [9] "Santa_Cruz"
```
<br>

```r
UC_admit$Category <- as.factor(UC_admit$Category)
levels(UC_admit$Category)
```

```
## [1] "Admits"     "Applicants" "Enrollees"
```

<br>

```r
UC_admit$Ethnicity <- as.factor(UC_admit$Ethnicity)
levels(UC_admit$Ethnicity)
```

```
## [1] "African American" "All"              "American Indian"  "Asian"           
## [5] "Chicano/Latino"   "International"    "Unknown"          "White"
```


<br>

**2. The president of UC has asked you to build a shiny app that shows admissions by ethnicity across all UC campuses. Your app should allow users to explore year, campus, and admit category as interactive variables. Use shiny dashboard and try to incorporate the aesthetics you have learned in ggplot to make the app neat and clean.**


```r
UC_admit <- readr::read_csv("data/UC_admit.csv")

ui <- dashboardPage(
  dashboardHeader(title = "UC Admissions Data Viewer", titleWidth = 300),
  dashboardSidebar(disable=T),
  dashboardBody(
  tags$head(tags$style(HTML('
        .skin-blue .main-header .navbar {
                              background-color: #355B85;
        }
        .skin-blue .main-header .logo {
                              background-color: #002855;
                              }
                              '))),
  fluidRow(
    box(width = 12,
    plotOutput("plot", width = "800px", height = "500px"))),
  
  fluidRow(
    box(title = "Graph Options", width = 12,
        selectInput("year", "Year", choices = c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019"), selected = "2019"),
        selectInput("ethnicity", "Select Ethnicity", choices = c("African American", "All", "American Indian", "Asian", "Chicano/Latino", "International","Unknown","White"),selected = "All"),
        selectInput("group", "Group", choices = c("Admits", "Applicants", "Enrollees"),selected = "Admits")))),skin="blue")

server <- function(input, output, session) { 
  
  output$plot <- renderPlot({

  UC_admit %>%
    filter(Academic_Yr==input$year) %>% 
    filter(Ethnicity==input$ethnicity) %>%
    filter(Category== input$group) %>% 
    ggplot(aes(x=Campus, y=FilteredCountFR))+geom_bar(stat="identity")+labs(y=NULL, x=NULL)+
    ggtitle(paste("UC-Wide",input$group,"of",input$ethnicity,"Ethnicity for",input$year))+
    theme(plot.title = element_text(size = 24, hjust=.5, vjust = 3.5, margin = margin(t=20)),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 12),
        axis.title.x = element_text(margin = margin(t = 10, r = 0, b = 0, l = 0)),
        axis.text.x = element_text(size=10))})
  
  session$onSessionEnded(stopApp)
  
  }

shinyApp(ui, server)
```
This app can be found in the homework folder titled `UCAdmit_AllCampuses.R`


<br>
**3. Make alternate version of your app above by tracking enrollment at a campus over all of the represented years while allowing users to interact with campus, category, and ethnicity.**



```r
UC_admit <- readr::read_csv("data/UC_admit.csv")

ui <- dashboardPage(
  dashboardHeader(title = "UC Admissions Data Viewer", titleWidth = 300),
  dashboardSidebar(disable=T),
  dashboardBody(
  tags$head(tags$style(HTML('
        .skin-blue .main-header .navbar {
                              background-color: #355B85;
        }
        .skin-blue .main-header .logo {
                              background-color: #002855;
                              }
                              '))),
  fluidRow(
  box(width = 12,
  plotOutput("plot", width = "800px", height = "500px")
  )),
  fluidRow(
  box(title = "Graph Options", width = 12,
  selectInput("campus", "Campus", choices = c("Berkeley", "Davis", "Irvine", "Los_Angeles", "Merced", "Riverside", "San_Diego", "Santa_Barbara", "Santa_Cruz"), 
              selected = "Davis"),
  selectInput("ethnicity", "Select Ethnicity", choices = c("African American", "All", "American Indian", "Asian", "Chicano/Latino", "International", "Unknown", "White"),
              selected = "All"),
  selectInput("group", "Group", choices = c("Admits", "Applicants", "Enrollees"),
                selected = "Admits")
  ))),skin="blue")

server <- function(input, output, session) { 
  
  output$plot <- renderPlot({
    UC_admit %>%
      filter(Campus==input$campus) %>% 
      filter(Ethnicity==input$ethnicity) %>%
      filter(Category== input$group) %>% 
      ggplot(aes(x=Academic_Yr, y=FilteredCountFR))+geom_line()+labs(y=NULL, x="Academic Year")+
      ggtitle(paste(input$group,"of",input$ethnicity,"Ethnicity at UC",input$campus))+
      scale_x_continuous(breaks = seq(2010, 2019, by = 1), limits=c(2010,2019))+
      theme(plot.title = element_text(size = 24, hjust=.5, vjust = 3.5, margin = margin(t=20)),
            axis.text = element_text(size = 12),
            axis.title = element_text(size = 12),
            axis.title.x = element_text(margin = margin(t = 10, r = 0, b = 0, l = 0)))})
  
  session$onSessionEnded(stopApp)

  }

shinyApp(ui, server)
```
This app can be found in the homework folder titled `UCAdmit_ByCampus.R`
<br>

<br><br><br>
