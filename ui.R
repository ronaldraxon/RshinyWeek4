library(shiny)

#Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    # Application title
    titlePanel("3D plot parameters"),
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
      sidebarPanel(
        h5("Set values or drag the sliders to change features or visualization on the 3d plot."),
        numericInput("sliderLenght","Sequence lenght:",value=30,min=2,max=500,step=1),
        sliderInput("theta","Theta rotation:",min = 1,max = 350,value = 24),
        sliderInput("phi","Phi rotation:",min = 1,max = 350,value = 20),
        sliderInput("sliderX","Min and max X:",min = -100,max = 100,value = c(-25,25)),
        sliderInput("sliderY","Min and max Y",min = -100,max = 100,value = c(-25,25)),
        sliderInput("sliderLtheta","Ltheta",min = -180,max = 180,value = -120),
        sliderInput("sliderShade","Shade",min = 0,max = 3,value = 0.75,step=0.1),
        selectInput("Color", "Set a color:",
                    c("Light blue" = "lightblue",
                      "Red" = "red",
                      "Green" = "green"))
        #submitButton("Submit")# New!
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("plot",width = "100%", height = "800px")
        
      )
    )
  )
)
