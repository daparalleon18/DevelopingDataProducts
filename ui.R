#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Iris DataSet Analysis Tool"),
  
  sidebarPanel(
    
    textOutput("doc"),
    
    selectInput("var1", strong("Select Iris Variable A:"), selected = c("Sepal Length"),
                choices = c("Sepal Length", "Sepal Width", "Petal Length", "Petal Width")),
    
    selectInput("var2", strong("Select Iris Variable B:"), selected = c("Sepal Width"), 
                choices = c("Sepal Length", "Sepal Width", "Petal Length", "Petal Width")),
    
    tags$ul(
      tags$li("Sepal Length: Sepal length in centimeters"),
      tags$li("Sepal Width: Sepal Width in centimeters"),
      tags$li("Petal Length: Petal length in centimeters"),
      tags$li("Petal Width: Petal Width in centimeters")
    )
    
  ),
  
  mainPanel(
    
    tabsetPanel(
      tabPanel("Scatter Plot", plotlyOutput("plot")), 
      tabPanel("Data", tableOutput("view"))
    )
    
  )
))