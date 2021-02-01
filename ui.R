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
            menuItem("Subcategory", tabName = "Tab2"),
            menuItem("Distribution of Category", tabName = "Tab3"),
            menuItem("Distribution of SubCategory", tabName = "Tab4"),
            menuItem("Duration of Permit per Year", tabName = "Tab5")
            
        )),
    
        dashboardBody(
            tabItems(
                tabItem(tabName = "Tab1", 
                h5("The following app is an Exploratory Data Analysis of NYC Film Permits 2015 - 2021"),
            box(plotOutput("plot1"))),
            
                tabItem(tabName = "Tab2",
            box(plotOutput("plot2"), width = 100)),
            
            tabItem(tabName = "Tab3", 
                    box(plotOutput("plot3"))),
            
            tabItem(tabName = "Tab4", 
                    box(plotOutput("plot4"), width = 100)),
            
            tabItem(tabName = "Tab5", 
                    box(plotOutput("plot5"), width = 100))
))))

