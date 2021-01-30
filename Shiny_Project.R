#Shiny_Project
#Objective: Analyzing Film Permit Data to investigate trends in location

library(tidyverse)
library(lubridate)

Permits <- read.csv("Film_Permit.csv")

Permits <- Permits%>%select(., -15, -16, -18)

Permits <- Permits %>% mutate(Start.Date.Time = mdy_hms(StartDateTime, tz = Sys.timezone()))

Permits <- Permits %>% mutate(End.Date.Time = mdy_hms(EndDateTime, tz = Sys.timezone()))

Permits <- Permits %>% mutate(Difference_In_Time = End.Date.Time - Start.Date.Time, )

Permits <- Permits %>% mutate(Start.Month = month(Permits$Start.Date.Time), Start.Year = year(Start.Date.Time), End.Month = month(End.Date.Time), End.Year = year(End.Date.Time))

Permits <- Permits %>% mutate(Start.Hour = hour(Start.Date.Time), End.Hour = hour(End.Date.Time))

Permits %>%
  ggplot() + geom_bar(aes(Permits$Borough, fill = Permits$Category), position = "dodge")

Permits %>%
  ggplot() + geom_bar(aes(Permits$Borough, fill = Permits$SubCategory), position = "dodge")

Permits %>%
  ggplot() + geom_bar(aes(Permits$Borough))

Permits%>%
  ggplot() + geom_bar(aes(Permits$Category))

Permits %>%
  ggplot() + geom_bar(aes(Permits$SubCategoryName))

Permits%>%
  ggplot()
  

View(Permits) 

Permits%>%
  ggplot() + geom_histogram(aes(EventType))
