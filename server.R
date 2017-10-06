
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   

  
  output$distPlot <- renderPlot({
    
    x <- seq(input$sliderX[1],input$sliderX[2], length= input$sliderLenght)
    y <- seq(input$sliderY[1],input$sliderY[2], length= 30)
    f <- function(x, y) { r <- sqrt(x^2+y^2); 10 * sin(r)/r }
    z <- outer(x, y, f)
    z[is.na(z)] <- 1
    op <- par(bg = "white")
    persp(x, y, z, theta = input$theta, phi = input$phi, 
          expand = 0.8,ltheta = input$sliderLtheta, shade = input$sliderShade, col = "lightblue")
    
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
