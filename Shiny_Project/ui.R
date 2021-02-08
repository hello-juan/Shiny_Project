# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

shinyUI(dashboardPage(
    
        dashboardHeader(title = "Dashboard"),
    
        dashboardSidebar(sidebarMenu(
            menuItem("Introduction", tabName = "Tab1"),
            menuItem("Category By Borough", tabName = "Tab2"),
            menuItem("Subcategory By Borough", tabName = "Tab3"),
            menuItem("Category from 2018-2020", tabName = "Tab4"),
            menuItem("Subcategory from 2018-2020", tabName = "Tab5"),
            menuItem("Duration of Permit per Year", tabName = "Tab6")
            
        )),
    
        dashboardBody(
            tabItems(
                tabItem(tabName = "Tab1", 
                h5("The following app is an Exploratory Data Analysis of NYC Film Permits 2015 - 2021"),
            box(plotOutput("plot1"))),
                
            tabItem(tabName = "Tab2", 
                box(plotOutput("plot2"))),
            
                tabItem(tabName = "Tab3",
            box(plotOutput("plot3"), width = 100)),
            
            tabItem(tabName = "Tab4", 
                    box(plotOutput("plot4"))),
            
            tabItem(tabName = "Tab5", 
                    box(plotOutput("plot5"), width = 100)),
            
            tabItem(tabName = "Tab6", 
                    box(plotOutput("plot6"), width = 100))
))))

