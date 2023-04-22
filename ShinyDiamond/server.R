#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(ggplot2)

# Get a subset of the database with only the variables that interest us
diamondData <- diamonds[, c("carat", "cut", "color", "clarity", "price")]

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("price ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("price ~", "as.integer(", input$variable, ")")
#    paste("price ~", input$variable)
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=diamondData)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$diamondBoxPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = diamondData,
            outline = input$outliers)
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$diamondPlot <- renderPlot({
    with(diamondData, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })
  
})
