#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)

shinyUI(
  navbarPage("Shiny Application",
             tabPanel("Diamond Characteristics",
                      fluidPage(
                        titlePanel("The relationship between diamond price (in USD) and its characteristics."),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Weight " = "carat",
                                          "Cut Quality" = "cut",
                                          "Colour" = "color",
                                          "Clarity" = "clarity"
                                        )
                            ),
                            p("Note: Box Plots for all variables can be displayed but may not make sense"),
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE),
                            submitButton("Submit")
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("diamondBoxPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("diamondPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             
             tabPanel("About the Data",
                      h2("Prices of over 50,000 round cut diamonds"),
                      hr(),
                      h3("Description"),
                      helpText("A dataset containing the prices and other attributes of almost 54,000 diamonds."),
                      h3("Format"),
                      p("A data frame with 53940 rows and 10 variables."),
                      
                      p("  [1]   price    price in US dollars (326–18,823)"),
                      p("  [2]	 carat    weight of the diamond (0.2–5.01)"),
                      p("  [3]	 cut  	  quality of the cut (Fair, Good, Very Good, Premium, Ideal)"),
                      p("  [4]	 color	  diamond colour, from D (best) to J (worst)"),
                      p("  [5]	 clarity	a measurement of how clear the diamond is (I1 (worst), SI2, SI1, VS2, VS1, VVS2, VVS1, IF (best))"),
                      
                      h3("Source"),
                      
                      p("ggplot2 Dataset"),
                      
             ),
             tabPanel("Link to the Github Repository",
                      a("https://github.com/hisscaredbrain/ddpW4/"),
                      hr(),
                      h4("Have fun analysing diamond prices using Shiny App!")
             )
  )
)