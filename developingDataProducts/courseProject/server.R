# author Andrew E. Davidson
# 1/23/2016
# ref: http://web.stanford.edu/~cengel/cgi-bin/anthrospace/building-my-first-shiny-application-with-ggplot
# ref: https://www.coursera.org/learn/statistical-inference/ lec 05_Variance
library(shiny) 
library(UsingR) # I think this loads hist
library(ggplot2) # load ggplot

shinyServer( 
    function(input, output) { 
        output$varianceGraph <- renderPlot({ 
            #ggplot(dat, aes(x = x, y = y, color = factor)) + geom_line(size = 2)
            sd <- input$standarDeviation
            df <- data.frame(
                y = dnorm(xvals, mean = 0, sd),
                x = xvals)
            ggplot(df, aes(x = x, y = y, color = 'red')) + geom_line(size = 2)
            })
    }
)

