
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