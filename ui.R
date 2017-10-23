#In this Shiny app, I will use R built in dataset mtcars and demonstrate what the relationship between mpg and
#weight looks like depending on the cylinder chosen as well as a histogram of mpg allowing user to choose
# the number of bins

library(shiny)
library(ggplot2)
library(datasets)

data("mtcars")
mtcars <- mtcars
mtcars$cyl <- paste(mtcars$cyl,"cylinder",sep = " ")

# Define UI for application that shows a line chart
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Demonstration of Scatterplot and Histogram"),
  
  # Sidebar
  sidebarLayout(
    sidebarPanel(
      selectInput("select", label = "Choose a cylinder:",
                  choices = c("4 cylinder","6 cylinder","8 cylinder")
      ),
      sliderInput("bins",
                   "Binwidth:",
                   min = 1,
                   max = 10,
                   value = 5)
    ),
    
    # Show plots
    mainPanel(
      h3("To start, select cylinder options from the dropdown menu on the left"),
      h3("This will change the scatterplot on the main panel"),
      h3("To change the histogram, use the slider option"),
      h3("This will choose the binwidth and histogram will change based on this"),
      plotOutput("scatter"),
      plotOutput("hist")
    )
  )
))
