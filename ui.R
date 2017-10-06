library(shiny)

#Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    # Application title
    titlePanel("3D plot parameters"),
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
      sidebarPanel(
        h4("Options bar "),
        numericInput("sliderLenght","Sequence lenght:",value=30,min=2,max=100,step=1),
        sliderInput("theta","Theta rotation:",min = 1,max = 350,value = 24),
        sliderInput("phi","Phi rotation:",min = 1,max = 350,value = 20),
        sliderInput("sliderX","Min and max X:",min = -100,max = 100,value = c(-25,25)),
        sliderInput("sliderY","Min and max Y",min = -100,max = 100,value = c(-25,25)),
        sliderInput("sliderLtheta","Ltheta",min = -180,max = 180,value = -120),
        sliderInput("sliderShade","Shade",min = 0,max = 3,value = 0.75,step=0.1),
        checkboxInput("show_xlab","show or hide x label", value=TRUE),
        checkboxInput("show_ylab","show or hide y label", value=TRUE),
        checkboxInput("show_main","show or hide main", value=TRUE)
        #submitButton("Submit")# New!
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("distPlot",width = "100%", height = "800px")
        
      )
    )
  )
)
