#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# Use WWWusage dataset

library(datasets)
function(input, output) {
  
  output$main_plot <- renderPlot({
    
    hist(WWWusage,
         probability = TRUE,
         breaks = as.numeric(input$n_breaks),
         xlab = "User Count",
         main = "Users connected to the Internet through a server every minute")
    
    if (input$individual_obs) {
      rug(WWWusage)
    }
    
    if (input$density) {
      dens <- density(WWWusage,
                      adjust = input$bw_adjust)
      lines(dens, col = "blue")
    }
    
  })
}