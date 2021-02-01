#Shiny_Project
#Objective: Analyzing Film Permit Data to investigate trends in location

library(tidyverse)
library(lubridate)
library(RColorBrewer)

Permits <- read.csv("Film_Permit.csv")


Permits <- Permits %>% mutate(Start.Date.Time = mdy_hms(StartDateTime, tz = Sys.timezone()),
                              End.Date.Time = mdy_hms(EndDateTime, tz = Sys.timezone()),
                              Difference.In.Time = as.numeric(End.Date.Time - Start.Date.Time, units = 'hours'),
                              Start.Month = month(Start.Date.Time), 
                              Start.Year = year(Start.Date.Time), 
                              End.Month = month(End.Date.Time), 
                              End.Year = year(End.Date.Time))
                             
                              

