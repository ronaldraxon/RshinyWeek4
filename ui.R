library(shiny)

#Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    # Application title
    titlePanel("3D plot - persp() function"),
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
      sidebarPanel(width = 4,
        fluidRow(
          tags$div(class = "header", checked = NA,align ="justify",
          tags$h4("Briefing"),
          tags$p("This is a shiny app to show a 3d plot made with the ",
                 tags$a(href = "https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/persp.html", "persp"),
                  " funtion. The mathematical function used to create this plot was 10*sin(sqrt(x^2+y^2))/sqrt(x^2+y^2). ",
                  "In order to change the features such as number of polygons rendered, x and y values among others. 
                   This kind of graphic can be useful for surface analysis or hyperplane of solutions analysis.")
          )    
        ),
          
        fluidRow(
          tags$div(class = "header", checked = NA,
              tags$p("Sequence lenght referes to the number of polygons rendered 
                     in the plot. In the color control, you can set the graphics 
                     color. Try it out!")
          ),
          column(width = 6,
            numericInput("sliderLenght","Sequence lenght:",value=30,
                         min=2,max=500,step=1)  
          ),
          column(width = 6,
            selectInput("Color", "Color:",
                        c("Light blue" = "lightblue",
                          "Red" = "red",
                          "Green" = "green"))  
          )
        ),
        fluidRow(
          tags$div(class = "header", checked = NA,
                   tags$p("Theta and phi rotation allows the user to change the 
                          visualization angle for the graphic. Check it out!")
          ),
          column(width = 6,
                 sliderInput("theta","Theta rotation:",
                             min = 1,max = 350,value = 24)
          ),
          column(width = 6,
                 sliderInput("phi","Phi rotation:",
                             min = 1,max = 350,value = 20)
          )
        ),
        fluidRow(
          tags$div(class = "header", checked = NA,
                   tags$p("As their name says, Min and Max allows to change the minimun and maximum x
                          and y values. Be free to change them as desired.")
          ),
          column(width = 6,
                 sliderInput("sliderX","Min and max X:",
                             min = -100,max = 100,value = c(-25,25))
          ),
          column(width = 6,
                sliderInput("sliderY","Min and max Y",
                             min = -100,max = 100,value = c(-25,25))
          )                
        ),
        fluidRow(
          tags$div(class = "header", checked = NA,
                   tags$p("Finally, here are two more controls to set the lights and
                          shades of the graphic.")
          ),
          column(width = 6,
                sliderInput("sliderLtheta","Ltheta",
                            min = -180,max = 180,value = -120)
          ),
          column(width = 6,
                sliderInput("sliderShade","Shade",
                            min = 0,max = 3,value = 0.75,step=0.1)
          )      
        )
      ),
      
      # Shows a 3d plot 
      mainPanel(
        plotOutput("plot",width = "100%", height = "800px")
        
      )
    )
  )
)
