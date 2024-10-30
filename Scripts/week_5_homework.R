library("tidyverse")
surveys <- read_csv("data/portal_data_joined.csv")

#1
surveys_wide <- surveys %>% 
  group_by(genus, plot_type) %>% 
  summarise(mean_hindfoot_length = mean(hindfoot_length)) 
 surveys_wide
 surveys_wide <- surveys %>% 
   filter(!is.na(hindfoot_length)) %>% 
   group_by(genus, plot_type) %>% 
   summarise(mean_hindfoot = mean(hindfoot_length)) 
 surveys_wide
surveys_wide %>% 
  pivot_wider(names_from = plot_type, values_from = mean_hindfoot)
surveys_wide %>% 
  arrange("Control")
surveys_wide %>% 
  pivot_wider(names_from = plot_type, values_from = mean_hindfoot) %>% 
  arrange(Control)

#2
surveys %>%
  summary(weight)
#1st quart=20, 3rd quart= 48
surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_cat= case_when(weight<=20 ~ "small", weight>20 & weight<48 ~ "medium", weight>=48 ~ "big")) %>% 
  select(weight, weight_cat) %>% 
  head()