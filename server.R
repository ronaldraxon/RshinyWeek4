
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  
  
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
  output$plot1 <- renderPlot({
    set.seed(2016-05-25)
    number_of_points <- input$numeric
    minX <- input$sliderX[1]
    maxX <- input$sliderX[2]
    minY <- input$sliderY[1]
    maxY <- input$sliderY[2]
    dataX <- runif(number_of_points, minX, maxX)
    dataY <- runif(number_of_points, minY, maxY)
    xlab <- ifelse(input$show_xlab,"X Axis","")
    ylab <- ifelse(input$show_ylab,"Y Axis","")
    main <- ifelse(input$show_main, "Tittle","")
    plot(dataX,dataY,xlab =xlab,ylab=ylab, main = main,
         xlim = c(-100,100), ylim = c(-100,100))
  })
  
  output$text1 = renderText(input$bins)
})
