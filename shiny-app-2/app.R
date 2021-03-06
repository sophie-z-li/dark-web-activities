#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot"),

           
        )
    )
)

ui <- navbarPage(
  "Final Project Title",
  tabPanel("Model",
           fluidPage(
             titlePanel("Model Title"),
             sidebarLayout(
               sidebarPanel(
                 selectInput(
                   "plot_type",
                   "Plot Type",
                   c("Option A" = "a", "Option B" = "b")
                 )),
               mainPanel(plotOutput("line_plot")))
           )),
  tabPanel("Discussion",
           titlePanel("Discussion Title"),
           p("Tour of the modeling choices you made and 
              an explanation of why you made them")),
  tabPanel("About", 
           titlePanel("About"),
           h3("Project Background and Motivations"),
           p("Hello, this is where I talk about my project."),
           h3("About Me"),
           p("My name is ______ and I study ______. 
             You can reach me at ______@college.harvard.edu.")))


# Define server logic required to draw a histogram
server <- function(input, output) {
  output$line_plot <- renderPlot({
    # Generate type based on input$plot_type from ui
    
    ifelse(
      input$plot_type == "a",
      
      # If input$plot_type is "a", plot histogram of "waiting" column 
      # from the faithful dataframe
      
      x   <- faithful[, 2],
      
      # If input$plot_type is "b", plot histogram of "eruptions" column
      # from the faithful dataframe
      
      x   <- faithful[, 1]
    )
    
    # Draw the histogram with the specified number of bins
    
    hist(x, col = 'darkgray', border = 'white')
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
