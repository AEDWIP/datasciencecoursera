# author Andrew E. Davidson
# 1/23/2016
library( shiny) 
shinyUI( pageWithSidebar( 
            headerPanel("Explore how changes in variance effect the shape of a Gaussian Distribution"), 
            sidebarPanel( 
                h3('standard deviation'),
                sliderInput('standarDeviation', 'Standard Deviation', value = 1, min = 0.1, max = 5, step = 0.1)
            ), 
            
            mainPanel( 
                p("The standard deviation is equal to the square root of the variance."),
                plotOutput('varianceGraph')
            )
    ))
