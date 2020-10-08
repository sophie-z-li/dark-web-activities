#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
# We changed page below from fluidPage to navbarPage
shinyUI(navbarPage(
  
  # Here, we are setting a theme for our Shiny App via: 
  # https://rstudio.github.io/shinythemes/
  # The package is shinythemes, but the function is shinytheme (it's bipolar)
  theme = shinytheme("slate"),

# Sets title of website (by default on the top left)  
"Dark Web Activties",

    # Application title
    # We changed from titlePanel to tabPanel
    tabPanel("About", a("link", href = "https://www.w3schools.com/TAGS/default.ASP"),
             p("Hello world"),
             h1("Don't relect the Orange")
             ),
    tabPanel(
      "Plot",
      plotOutput("carPlot")
    )

))
