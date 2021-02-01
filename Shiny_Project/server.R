#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

## server.R ##
shinyServer(function(input, output){
  
  output$plot1 <- renderPlot({    
    Permits %>%
      ggplot() + geom_bar(aes(x = Category,fill = Category), position = "dodge")+ 
      theme(axis.text.x = element_blank(), axis.ticks = element_blank())
  
})
  output$plot2 <- renderPlot({    
    Permits %>%
      ggplot() + geom_bar(aes(Borough, fill = SubCategoryName), position = "dodge")+
      theme(axis.text.x = element_text(angle = 90))+scale_fill_discrete(name = "Subcategory")
  
})
     output$plot3 <- renderPlot({    
    Permits %>%
      ggplot() + geom_boxplot(aes(Category, Start.Year, alpha = 0.1, color = "yellow") ) + theme(axis.text.x = element_text(angle = 90), legend.position="none")+labs(y= "Year")
    
    })
     
     output$plot4 <- renderPlot({    
       Permits %>%
         ggplot() + geom_boxplot(aes(SubCategoryName, Start.Year, alpha = 0.1, color = "yellow") ) + 
         theme(axis.text.x = element_text(angle = 90), legend.position="none" )+labs(y= "Year", x= "SubCategory")
})
     output$plot5 <- renderPlot({    
       Permits%>%
         ggplot() + geom_boxplot(aes(Category, Difference.In.Time, color = Category))+ylim(0, 2000)+facet_wrap(~Start.Year)+labs(y= "Duration of Film Permit (Hrs)", x = "")+theme(axis.text.x = element_blank(), axis.ticks = element_blank())
       
     })
})     