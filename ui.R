library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Hello Shiny!"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
      
      # Input: Dropdown for the bar colors ----
      selectInput(inputId = "colors",
                  label = "Bar color:",
                  choices = list(
                    "Blue" = "blue",
                    "Red" = "red",
                    "Green" = "green"
                  ),
                  selected = "blue"
      ),
      
      # Input: Radio buttons for count display ----
      radioButtons(inputId = "labels",
                   label = "Display count",
                   choices = list(
                     "False" = FALSE,
                     "True" = TRUE
                   ),
                   selected = FALSE
      ),
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "geyserPlot")
      
    )
  )
)