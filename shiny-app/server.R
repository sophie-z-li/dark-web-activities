#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# Load libraries in ui.R, not server.R

milestone <- read_excel("data/poverty_rate_SSA_new.xlsx", 4)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # carPlot is a made-up name
    output$angolaPlot <- renderPlot({
      
      # Just read in data!!!!
        
        ggplot(milestone, aes(x = year, y = povrate)) +
        geom_line(color = "green") +
        facet_wrap(~type) +
        scale_x_continuous(breaks = 2019:2021,
                           labels = c("2019", "2020", "2021")) +
        theme_dark() +
        labs(title = "Poverty Projections for the Country of Angola",
             x = "Year",
             y = "Poverty Rate")
    })

})
