library(shiny)

#Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    # Application title
    titlePanel("Any sample"),
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
      sidebarPanel(
        h4("Options bar "),
        numericInput("numeric","How many random numbers?",value=100,min=1,max=1000,step=1),
        sliderInput("bins","Number of bins:",min = 1,max = 50,value = 30),
        sliderInput("sliderX","Min and max X:",min = -100,max = 100,value = c(-50,50)),
        sliderInput("sliderY","Min and max Y",min = -100,max = 100,value = c(-50,50)),
        checkboxInput("show_xlab","show or hide x label", value=TRUE),
        checkboxInput("show_ylab","show or hide y label", value=TRUE),
        checkboxInput("show_main","show or hide main", value=TRUE),
        sliderInput("sliderMPG","What is the MPG of the car?",min = 10,max = 35,value = 20),
        checkboxInput("showModel1","show or hide model 1", value=TRUE),
        checkboxInput("showModel2","show or hide model 2", value=TRUE),
        submitButton("Submit")# New!
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        h3("main panel text"),
        plotOutput("distPlot"),
        plotOutput("plot1"),
        textOutput("text1"),
        h3("Predictions"),
        plotOutput("plotPrediction1"),
        h3("predicted horse power model 1"),
        textOutput("pred1"),
        h3("predicted horse power model 2"),
        textOutput("pred2")
      )
    )
  )
)
