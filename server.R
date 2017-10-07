
library(shiny)

# Define server logic required to draw a 3d PLot
shinyServer(function(input, output) {
  
  output$plot <- renderPlot({
    x <- seq(input$sliderX[1],input$sliderX[2], length= input$sliderLenght)
    y <- seq(input$sliderY[1],input$sliderY[2], length= 30)
    f <- function(x, y) { r <- sqrt(x^2+y^2); 10 * sin(r)/r }
    z <- outer(x, y, f)
    z[is.na(z)] <- 1
    op <- par(bg = "white")
    persp(x, y, z, theta = input$theta, phi = input$phi, 
          expand = 0.8,ltheta = input$sliderLtheta, 
          shade = input$sliderShade, col = input$Color)
  })
  
  
  output$text1 = renderText(input$bins)
})
