#Shiny_Project
#Objective: Analyzing Film Permit Data to investigate trends in location

library(tidyverse)
library(lubridate)

Permits <- read.csv("Film_Permit.csv")

Permits %>% mutate(Start.Date = as.Date(StartDateTime,"%m/%d/%Y"))
 
Permits %>% mutate(End.Date = as.Date(EndDateTime,"%m/%d/%Y"))

Permits%>%
  group_by(Borough, EventType)%>%
  ggplot() + geom_histogram(aes(EventType))
