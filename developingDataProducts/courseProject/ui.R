library( shiny) 
shinyUI( pageWithSidebar( 
            headerPanel(" Hello Shiny!"), 
            sidebarPanel( 
                h3(' Sidebar text'),
                numericInput(' id1', 'Numeric input, labeled id1', 0, min = 62, max = 74, step = 0.5)
            ), 
            mainPanel( h3(' Main Panel text') )
    ))
