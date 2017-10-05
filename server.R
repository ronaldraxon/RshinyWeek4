
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  mtcars$mpgsp <- ifelse(mtcars$mpg - 20 > 0, mtcars$mpg -20,0)
  model1 <- lm(hp~mpg,data=mtcars)
  model2 <- lm(hp~mpgsp + mpg, data = mtcars)
  
  model1pred <- reactive({
    mpgInput <- input$sliderMPG
    predict(model1,newdata= data.frame(mpg=mpgInput))
  })
  
  model2pred <- reactive({
    mpgInput <- input$sliderMPG
    predict(model2, newdata= 
              data.frame(mpg=mpgInput,
                         mpgsp = ifelse(mpgInput-20 >0,
                                        mpgInput-20,0)))
  })
  output$plotPrediction1 <- renderPlot({
    mpgInput <- input$sliderMPG
    
    plot(mtcars$mpg, mtcars$hp, xlab = "Miles per gallon",
         ylab = "Horsepower", bty = "n", pch =16,
         xlim = c(10,35), ylim = c(50,350))
    
    if(input$showModel1){
      abline(model1, col = "red", lwd = 2)
    }
    if(input$showModel2){
      model2lines <- predict(model2, newdata = data.frame(
        mpg = 10:35, mpgsp = ifelse(10:35 - 20 > 0, 10:35 - 20, 0) 
      ))
      lines(10:35, model2lines, col ="blue", lwd =2)
    }
    legend(25,250,c("model 1 prediction","Model 2 prediction"), pch = 16,
           col = c("red","blue"), bty = "n", cex = 1.2)
    points(mpgInput, model1pred(),col = "red", pch =16, cex = 2)
    points(mpgInput, model2pred(),col = "blue", pch =16, cex = 2)
  })
  
  output$pred1 <- renderText({
    model1pred()
  })
  
  output$pred2 <- renderText({
    model2pred()
  })
  
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
