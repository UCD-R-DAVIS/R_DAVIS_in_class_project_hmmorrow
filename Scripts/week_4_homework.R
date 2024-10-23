library("tidyverse")
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)
surveys2 = filter(surveys, weight>=30 & weight<=60)
surveys[1:6,]
surveys(weight)
surveys[weight]
surveys2[weight]
surveys2[weight,]
select(surveys,weight)
select(surveys2,weight)
surveys3= filter(surveys2,!is.na(weight)
select(surveys3,weight)
surveys3(is.na(weight))
surveys3[is.na(weight)]
is.na(surveys3(weight))
surveys3[is.na(surveys3$weight)]
is.na(surveys3[8,])
is.na(surveys3[,8])
surveys3[,9]
is.na(surveys3[,9])
surveys3 %>% group_by(sex,species_id) %>% summarise(max_weight=max(weight, na.rm = TRUE))
print(n=34)
print?
  surveys3 %>%
  group_by(sex,species_id)%>%
  summarise(max_weight=max(weight, na.rm = TRUE))  %>% 
  print(n=34)
biggest_critters=surveys3 %>%
  group_by(sex,species_id)%>%
  summarise(max_weight=max(weight, na.rm = TRUE))
biggest_critters %>% 
  arrange(desc(max_weight))
surveys %>% 
  filter(weight>30 & weight<60)
surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id,sex) %>% 
  summarise(avg_weight=mean(weight))
surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id,sex) %>% 
  mutate(avg_weight=mean(weight)) %>% 
  summarise(avg_weight)
surveys_avg_weight=surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id,sex) %>% 
  mutate(avg_weight=mean(weight)) %>% 
  select(species_id,sex,weight,avg_weight)
surveys_avg_weight %>% 
  mutate(above_average=weight>avg_weight)
