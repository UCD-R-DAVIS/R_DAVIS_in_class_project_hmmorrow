library(tidyverse)
setwd("C:/Users/harri/OneDrive/Documents/R-Projects/R Projects/R_DAVIS_in_class_project_hmmorrow")
gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv") 
popchange <- gapminder %>%
  filter(continent!='Oceania') %>% 
  filter(year %in% c(2002, 2007)) %>%
  select(continent, country, year, pop) %>%
  pivot_wider(names_from = year, values_from = pop) %>%
  group_by(continent) %>% 
  arrange(continent, country) %>% 
  mutate(pop_difference = `2007` - `2002`)
popchange
ggplot(data = popchange, mapping = aes(x =reorder(country, pop_difference) , y = pop_difference)) +
  geom_col(aes(fill = continent)) +
  facet_wrap(~ continent, scales = 'free')+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  xlab("Country") +
  ylab("Change in Population Between 2002 and 2007")
