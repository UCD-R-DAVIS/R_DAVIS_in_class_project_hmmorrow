library(tidyverse)
library(lubridate)
url <- "https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv"
laps <- read.csv(url)
write.csv(laps, file = "laps.csv", row.names = FALSE)

head(laps)

laps = laps %>% filter(sport=='running') %>% 
filter(minutes_per_mile<=10) %>% 
  filter(minutes_per_mile>5) %>% 
  filter(total_elapsed_time_s>60) %>% 
  mutate(date = make_date(year = year, month = month, day = day)) %>%
  mutate(time_period = case_when(
    date < as.Date("2024-01-01") ~ "Pre-2024",
    date >= as.Date("2024-01-01") & date < as.Date("2024-07-01") ~ "Initial Rehab",
    date >= as.Date("2024-07-01") ~ "Recent"
  )) %>% group_by(time_period)

laps %>% 
  ggplot(aes(x = minutes_per_mile,
           y = steps_per_minute, color=time_period)) +
  geom_point(alpha=0.1)+    geom_smooth(
    aes(group = time_period), 
    method = "lm", 
    se = FALSE, 
    size = 2, 
    color = "black" 
  ) + 
  geom_smooth(
    aes(group = time_period), 
    method = "lm", 
    se = FALSE, 
    size = 1 
  )+theme_minimal()


Recent = laps %>%
  filter(time_period == "Recent")%>%
  group_by(year, month, day) %>%
  mutate(lap = rank(timestamp)) %>%
  ungroup() %>% 
  filter(lap <= 3) 

  Recent %>% ggplot(aes(x = minutes_per_mile,
                   y = steps_per_minute, color= factor(lap))) +
  geom_point()

