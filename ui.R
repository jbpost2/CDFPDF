library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(withMathJax(),
  
  # Application title
  titlePanel("Visualizing the Relationship Between a CDF and a PDF"),
  
   fluidRow(
   	column(6,
   				 plotlyOutput("PDF")
   				 ),
   	column(6,
   				 plotlyOutput("CDF")   				 
   				 )
   	),
  fluidRow(
  	column(3, sliderInput("slide", "Realization in which we want the probability of being less than or equal to:", value = 0, min = 0, max = 1, step = 0.025, animate = animationOptions(interval= 500, loop = TRUE))),
  	column(3, uiOutput("PDFprob")),
  	column(3, uiOutput("CDFprob"))
  )
))
