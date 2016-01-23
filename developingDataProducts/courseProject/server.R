library(shiny) 
shinyServer( 
        function( input, output) { 
            output $outputId1 = renderPrint({input$id1})
        } 
)
