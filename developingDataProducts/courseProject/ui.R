library( shiny) 
shinyUI( pageWithSidebar( 
            headerPanel(" Hello Shiny!"), 
            
            sidebarPanel( 
                h3(' Sidebar text'),
                numericInput('glucose', 'Numeric input, labeled id1', 65, 
                             min = 62, max = 74, step = 0.5)
            ), 
            
            mainPanel( 
                h3(' Main Panel text'),
                h3(' Illustrating outputs'), 
                h4(' You entered'), 
                verbatimTextOutput("inputValue"),
                h4(' Which resulted in a prediction of '), 
                verbatimTextOutput("prediction")
            )
    ))
