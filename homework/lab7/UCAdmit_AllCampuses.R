#NOTE: These Packages ARE REQUIRED for the app to run. If you do not have them installed, please uncomment the following lines of code to install them.

#install.packages("tidyverse")
#install.packages("shiny")
#install.packages("shinydashboard")


library(tidyverse)
library(shiny)
library(shinydashboard)

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