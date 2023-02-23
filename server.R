library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$PDF <- renderPlotly({
  	x <- seq(from = 0, to = 1, length = 1000)
    plotData <- data.frame(x = x, PDF = 3*x^2)

    shortseq<-seq(from=0,to=input$slide,length=100)
 		plot_ly(source = "PDFPlot", plotData, x = ~x,y = ~PDF, type = "scatter", mode = 'lines') %>% 
    			layout(title="Probabilities for PDF are areas Under the Curve",xaxis=list(title="x"),yaxis=list(title="f(x)"),showlegend=FALSE)%>%
    			add_lines(x=shortseq, y = 3*shortseq^2,fill="tozeroy")
    })
    
    
  output$CDF <- renderPlotly({
  	x <- seq(from = 0, to = 1, length = 1000)
  	plotData <- data.frame(x = x, CDF = x^3)
  	
  	plot_ly(source = "CDFPlot", plotData, x = ~x,y = ~CDF, type = "scatter", mode = 'lines') %>% 
  		layout(title = "CDF gives Cumulative Probability up to (and including - \n important for discrete distributions) that x Value", xaxis = list(title = "x"), yaxis = list(title = "F(x)"), showlegend = FALSE) %>%
  		add_lines(x = c(0, input$slide), y = rep(input$slide^3, 2)) %>%
  		add_lines(x = rep(input$slide, 2), y = c(0, input$slide^3))
  })
  
  output$PDFprob <- renderUI({
    withMathJax(paste0("$$P(X\\leq", input$slide, ") = \\int_0^{", input$slide, "}3x^2dx = ", input$slide^3, "$$"))
  })  
  
  output$CDFprob <- renderUI({
 		withMathJax(paste0("$$F(", input$slide, ") = ", input$slide^3, "$$"))
  })  
  
})
