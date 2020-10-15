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
library(tidyverse)
library(janitor)

# Define UI for application that draws a histogram
# We changed page below from fluidPage to navbarPage
shinyUI(navbarPage(
  
  # Here, we are setting a theme for our Shiny App via: 
  # https://rstudio.github.io/shinythemes/
  # The package is shinythemes, but the function is shinytheme (it's bipolar)
  theme = shinytheme("slate"),

# Sets title of website (by default on the top left)  
"2020 Poverty Projections for Sub-Saharan Africa",

    # Application title
    # We changed from titlePanel to tabPanel
    tabPanel("About",
             a("Link to my Github Repo", href = "https://github.com/sophie-z-li/dark-web-activities"),
             p("My project is with the World Bank's Global Poverty and Equity Practice.
               I will be working with their Sub-Saharan Africa team to update the
               Bank's country-level poverty projections for 2020. The analysis
               will be published in a short practice note. Last year's practice note
               from the World Bank for Sub-Saharan Africa can be found here"),
               ),
    tabPanel(
      "Data",
      plotOutput("carPlot"),
      p(),
      p("I just had a meeting with the World Bank's SSA team, and they will be sending over
        data next week."),
      p("Wyatt told me to do a placeholder with the mtcars dataset for now lol."),
    )

))
