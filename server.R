
library(shiny)
library(ggplot2)

data("mtcars")
mtcars <- mtcars
mtcars$cyl <- paste(mtcars$cyl,"cylinder",sep = " ")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  newinput <- reactive({
   switch(
     input$select,
     "4 cylinder" = "4 cylinder",
     "6 cylinder" = "6 cylinder",
     "8 cylinder" = "8 cylinder"
   ) 
  })
  newinput2 <- reactive({
    input$bins
  })
  output$scatter <- renderPlot(
    ggplot(data = mtcars[mtcars$cyl==newinput(),],aes(x=mpg,y=wt,col=hp)) +geom_point()+labs(title="Scatterplot")
  )
  output$hist <- renderPlot(
    ggplot(mtcars,aes(x=mpg)) +geom_histogram(binwidth = newinput2(),col="black",fill="green")+labs(title="Histogram")
  )
})
