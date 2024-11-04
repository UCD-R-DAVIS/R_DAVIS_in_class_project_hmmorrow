library(tidyverse)
library(readr)
data <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv")
head(data)
running_data=data %>% 
  filter(sport=='running')
head(running_data)
no_walking=running_data %>% 
  filter(minutes_per_mile<=10) %>% 
  filter(minutes_per_mile>5) %>% 
  filter(total_elapsed_time_s>60)
head(no_walking$total_elapsed_time_s)
pace_form=no_walking %>% 
  mutate(pace=case_when(minutes_per_mile<6 ~ "fast",minutes_per_mile>=6 & minutes_per_mile<=8 ~ "medium", minutes_per_mile>8 ~ "slow")) %>% 
  mutate(form=case_when(year>=2024 ~ "new", year<2024 ~ "old"))
pace_form$pace
pace_form
pace_form_1 <- pace_form %>% 
  group_by(pace,form) %>% 
  summarise(average_steps = mean(steps_per_minute))
pace_form_1 %>% 
  pivot_wider(names_from = pace, values_from = average_steps)
