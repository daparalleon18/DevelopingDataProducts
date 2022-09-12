#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(plotly)

shinyServer(function(input, output) {
  
  # Choose Iris Variables for plotting
  inputVar1 <- reactive({
    switch(input$var1,
           "Sepal Length" = iris$Sepal.Length,
           "Sepal Width" = iris$Sepal.Width,
           "Petal Length" = iris$Petal.Length,
           "Petal Width" = iris$Petal.Width)
  })
  
  inputVar2 <- reactive({
    switch(input$var2,
           "Sepal Length" = iris$Sepal.Length,
           "Sepal Width" = iris$Sepal.Width,
           "Petal Length" = iris$Petal.Length,
           "Petal Width" = iris$Petal.Width)
  })
  
  # Output Scatter Plot and Data Preview
  output$plot <- renderPlotly({
    plot_ly(iris, 
            x = ~inputVar1(),
            y = ~inputVar2(),
            color = iris$Species) %>%
      layout(xaxis = list(title = 'Variable A'),
             yaxis = list(title = 'Variable B'),
             title = '<b> Scatter Plot of Iris </b>')
  })
  
  output$view <- renderTable({
    df <- data.frame(species = iris$Species, 
                     varA = inputVar1(), 
                     varB = inputVar2())
    df
    #head(df, n = 25)
  })
  
})

