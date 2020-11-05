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
library(ggthemes)
library(readxl)

region_poverty <- read_excel("data/poverty_rate_SSA_new.xlsx", 1)
country_poverty <- read_excel("data/poverty_rate_SSA_new.xlsx", 2)
country_GDPpc <- read_excel("data/poverty_rate_SSA_new.xlsx", 3)

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
               will be published in a short practice note. The data I will be using involves
               a collection of household surveys and GDP projections from the World Bank and 
               the International Monetary Fund's Economic Outlook, which will be utilized to
               forecast the impact of COVID-19 on poverty levels in the
               Sub-Saharan Africa region. For reference, last year's practice note
               from the World Bank for Sub-Saharan Africa can be found",
               a("here.", href = "https://elibrary.worldbank.org/doi/abs/10.1596/33765")),
             p(),
             p("For my Shiny App, I plan on plotting both macro-level and country-level comparisons of
                poverty based on a variety of metrics pulled from the International Monetary Fund,
                the World Economic Outlook, and the World Bank's PovCalNet database."),
               ), 

    tabPanel(
      "Data",
      plotOutput("angolaPlot"),
      p(),
      p("For Milestone #6, here is a plot I have created that plots the forecast for 
        poverty rates in the the country of Angola. The poverty forecast numbers span from the years
        2019 to 2021 (although I'm considering plotting prior years as well based on what the World Bank team decides
        ). Additionally, these calculations are based on three differents sets of data. The first, baseline, refers
        to the estimated poverty rate forecast pre-Covid. The second, MPO, refers to the post-COVID
        poverty forecast with consideration to country-specific poverty lines. The final, 
        WEO, refers to the post-COVID poverty forecast with consideration to a universal poverty line
        for all SSA countries."),
    )

))
