library(shiny) 

diabetesRisk <- function( glucose) glucose / 10

shinyServer( 
        function( input, output) { 
            # display the value the user entered
            output$inputValue <- renderPrint({ input$glucose}) 
            
            # call function passing value user iput
            output$prediction <- renderPrint({ diabetesRisk( input$glucose)})
        } 
)
