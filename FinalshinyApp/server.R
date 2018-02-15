#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(datasets)

# Define server filter data with input requirments
shinyServer(function(input, output) {
   
  output$table <- renderDataTable({
    
    # generat sequance data in range between min and max
    disp_seq <- seq(from = input$disp[1], to = input$disp[2], by = 0.1) 
    
    # perform some calculations on the input in server.R
    # & Re-shape the data
    reshaped.data <- transmute(mtcars,
                      Car = rownames(mtcars),
                      MilesPerGallon = mpg,  
                      GasolineExpenditure = input$dis/mpg*input$cost, 
                      Cylinders = cyl, 
                      Displacement = disp,  
                      Transmission = am) 
    # Filter target data
    filtered.data <- filter(reshaped.data ,
                   Cylinders %in% input$cyl,
                   Displacement %in% disp_seq, 
                   Transmission %in% input$am) 
    
    # change transmission to labels 0/1
    labelled.data <- mutate(filtered.data, 
                   Transmission = ifelse(Transmission==0,
                                         "Automatic",
                                         "Manual"))
    
    # Sort/re-arrange data by GasolineExpenditure 
    resultant.data <- arrange(labelled.data, GasolineExpenditure) 
    # return final resultant data
    resultant.data 
    
  },
  # customize page lenght
  options = list(lengthMenu = c(5, 15, 30), pageLength = 30) )
  
})
