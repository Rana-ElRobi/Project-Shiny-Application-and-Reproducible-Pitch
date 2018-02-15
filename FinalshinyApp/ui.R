#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(" Car Finder App "),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      helpText("Select one or more option for your prefered car type"),
      checkboxGroupInput('am', 
                          'Car Type', 
                          c("Automatic"= 0, "Manual"= 1), 
                          selected = 0 ),
      helpText("Select one or more option for prefered numver of cylinders in car"),
      checkboxGroupInput('cyl',
                          'Select cylinders number',
                          c("Four"=4, "Six"=6, "Eight"=8),
                          selected = c(4,8)),
      helpText("Slide the slider from both sides, the right set the max rang while the left set the min range"),
      sliderInput('disp', 
                   'Displacement', 
                   min=70, 
                   max=480, 
                   value= c(160,325),
                   step=5),
      helpText("Enter the value of gasoline cost you prefr"),
      numericInput('cost',
                    'Range for Gasoline Price (per gallon)',
                    min = 2,
                    max = 5,
                    step=0.01,
                    value = 3.2),
      helpText("Enter the value you want the distance covered by the car in miles"),
      numericInput('dis',
                    'Distance Range (in miles)',
                    min = 1,
                    max = 500,
                    value = 30)
      ),
    # Show a plot of the generated distribution
    mainPanel( 
      helpText("Filtered Results here"),
      dataTableOutput('table') 
    ) 
  )
))
