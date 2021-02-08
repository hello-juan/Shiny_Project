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
      theme(axis.text.x = element_blank(), axis.ticks = element_blank(), panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())+labs(x = "")
  
})
  output$plot2 <- renderPlot({    
    Permits %>%
      ggplot() + geom_bar(aes(x = Category,fill = Category), position = "dodge")+ 
      theme(axis.text.x = element_blank(), axis.ticks = element_blank(), panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())+facet_wrap(~Borough)+labs(x = "")
 })
  output$plot3 <- renderPlot({    
    Permits %>% 
      ggplot() + geom_bar(aes(Borough, fill = SubCategoryName), position = position_dodge(60), width = 50)+
      scale_fill_discrete(name = "Subcategory")+facet_wrap(~Borough)+ theme(axis.text.x = element_blank(), axis.ticks = element_blank(), panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())+labs(x = "")
  
})
     output$plot4 <- renderPlot({    
       Permits %>%
         filter(Start.Year == 2018:2020)%>%
         ggplot() + geom_bar(aes(Category, fill = Category) ) + theme(axis.text.x = element_blank(), axis.ticks = element_blank(), panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())+facet_wrap(~Start.Year)+labs(x = "")
    })
     
     output$plot5 <- renderPlot({    
       Permits %>%
         filter(Start.Year == 2018:2020)%>%
         ggplot() + geom_bar(aes(SubCategoryName, fill = SubCategoryName) ) + theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank(), axis.text.x = element_blank(), axis.ticks = element_blank() )+facet_wrap(~Start.Year) + scale_fill_discrete(name = "Subcategory") + labs(x = "")
})
     output$plot6 <- renderPlot({    
       Permits%>%
         ggplot() + geom_boxplot(aes(Category, Difference.In.Time, color = Category))+ylim(0, 50)+facet_wrap(~Start.Year)+labs(y= "Duration of Film Permit (Hrs)", x = "")+theme(axis.text.x = element_blank(), axis.ticks = element_blank())
       
     })
})     