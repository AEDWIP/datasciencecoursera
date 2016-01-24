library( shiny) 
shinyUI( pageWithSidebar( 
            headerPanel(" Hello Shiny!"), 
            
            sidebarPanel( 
                h3(' Sidebar text'),
                sliderInput('mu', 'Center of Mass', value = 65, min = 62, max = 74, step = 0.5)
            ), 
            
            mainPanel( 
                plotOutput('newHist')
            )
    ))
