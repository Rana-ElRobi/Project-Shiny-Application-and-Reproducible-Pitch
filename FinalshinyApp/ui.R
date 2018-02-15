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
       checkboxGroupInput('am', 
                          'Car Type', 
                          c("Automatic"= 0, "Manual"= 1), 
                          selected = 0 ),
       checkboxGroupInput('cyl',
                          'Select cylinders number',
                          c("Four"=4, "Six"=6, "Eight"=8),
                          selected = c(6,8)), 
       sliderInput('disp', 
                   'Displacement', 
                   min=70, 
                   max=480, 
                   value=c(50,300),
                   step=5),
       numericInput('cost',
                    'Range for Gasoline Price (per gallon)',
                    min = 2,
                    max = 5,
                    step=0.01,
                    value = 3.2),
       numericInput('dis',
                    'Distance Range (in miles)',
                    min = 1,
                    max = 500,
                    value = 30)
       #numericInput('gas', 'Maximum expenditure on gasoline:', 60, min=1, max=1000), 

       #sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10), 
       ),
    
    # Show a plot of the generated distribution
    mainPanel( 
      dataTableOutput('table') 
    ) 
  )
))
