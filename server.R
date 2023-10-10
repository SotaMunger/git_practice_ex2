library(plotly)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$geyserPlot <- renderPlotly({
    
    bins <- seq(min(faithful$waiting), max(faithful$waiting), length.out = input$bins + 1)
    xrange <- range(pretty(faithful$waiting))
    
    if(input$labels == TRUE) {
      plot_ly(data = faithful, 
              x = ~ waiting, 
              type = "histogram",
              color = I(input$colors),
              xbins = list(
                start = xrange[1],
                end = xrange[2],
                size = (xrange[2] - xrange[1])/input$bins
              )
      ) %>% 
        layout(bargap = 0.1)
    }
    
    else {
      plot_ly(data = faithful, 
              x = ~ waiting, 
              type = "histogram",
              color = I(input$colors),
              xbins = list(
                start = xrange[1],
                end = xrange[2],
                size = (xrange[2] - xrange[1])/input$bins
              )
      ) %>% 
        layout(bargap = 0.1) %>%
        style(hoverinfo = 'none')
      
    }
    
  })
  
}