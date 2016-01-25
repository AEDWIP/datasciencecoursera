library( shiny) 
shinyUI( pageWithSidebar( 
            headerPanel(" Hello Shiny!"), 
            
            sidebarPanel( 
                h3('mu Sidebar text'),
                sliderInput('mu', 'Center of Mass', value = 65, min = 62, max = 74, step = 0.5),                
                
                h3('standard deviation'),
                sliderInput('standarDeviation', 'Standard Deviation', value = 1, min = 0.1, max = 5, step = 0.1)
            ), 
            
            mainPanel( 
                plotOutput('newHist'),
                h3('AEDWIP'),
                plotOutput('varianceGraph')
            )
    ))
