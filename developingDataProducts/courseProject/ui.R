# author Andrew E. Davidson
# 1/23/2016
library( shiny) 
shinyUI( pageWithSidebar( 
            headerPanel(" Hello Shiny!"), 
            
            sidebarPanel( 
                h3('standard deviation'),
                sliderInput('standarDeviation', 'Standard Deviation', value = 1, min = 0.1, max = 5, step = 0.1)
            ), 
            
            mainPanel( 
                h3('AEDWIP'),
                plotOutput('varianceGraph')
            )
    ))
