# ref: http://web.stanford.edu/~cengel/cgi-bin/anthrospace/building-my-first-shiny-application-with-ggplot
library(shiny) 
library(UsingR) # I think this loads hist
library(ggplot2) # load ggplot

data(galton)
library(datasets) # car and driver data set

dat <- data.frame(
    y = c(
        dnorm(xvals, mean = 0, sd = 1),
        dnorm(xvals, mean = 0, sd = 2),
        dnorm(xvals, mean = 0, sd = 3),
        dnorm(xvals, mean = 0, sd = 4)
    ),
    x = rep(xvals, 4),
    factor = factor(rep(1 : 4, rep(length(xvals), 4)))
)

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

