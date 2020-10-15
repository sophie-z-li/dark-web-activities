#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# Load libraries in ui.R, not server.R

x <- mtcars

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # carPlot is a made-up name
    output$carPlot <- renderPlot({
      
      # Just read in data!!!!
      
        ggplot(x, aes(x = mpg, y = disp)) +
        geom_line()
    })

})
