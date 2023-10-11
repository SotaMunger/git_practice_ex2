library(ggplot2)

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
    
    if(input$labels == TRUE) {
      ggplot(data = faithful, aes(y = waiting)) +
        geom_histogram(breaks = bins,
                       fill = input$colors,
                       col = "white"
                       ) +
        theme_classic() +
        scale_x_continuous(expand = c(0,0)) +
        scale_y_continuous(expand = c(0,0)) +
        stat_bin(aes(label = ..count..),
                 breaks = bins,
                 geom = "text",
                 color = "white",
                 position = position_stack(vjust = 0.8)
                 )
    }
    
    else {
      ggplot(data = faithful, aes(y = waiting)) +
        geom_histogram(breaks = bins,
                       fill = input$colors,
                       col = "white"
        ) +
        theme_classic() +
        scale_x_continuous(expand = c(0,0)) +
        scale_y_continuous(expand = c(0,0))
    }

  })
  
}