library(tidyverse)
library(lubridate)
mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
head(mloa)
mloa2 = mloa %>%
  filter(rel_humid != -99) %>%
  filter(temp_C_2m != -999.9) %>%
  filter(windSpeed_m_s != -999.9) %>%
  mutate(datetime=ymd_hm(paste(year,"-",month,"-",day,"",hour24,":",min))) %>% 
  mutate(datetimelocal=with_tz(datetime,tz="Pacific/Honolulu"))
mloa2$datetimelocal
mloa2 %>%
  mutate(hstmonth=month(datetimelocal,label=TRUE)) %>% 
  mutate(hsthour=hour(datetimelocal)) %>%
  group_by(hstmonth,hsthour) %>% 
  summarise(meanhourlytemp=mean(temp_C_2m)) %>% 
  ggplot(aes(x = hstmonth,
             y = meanhourlytemp)) +
  geom_point(aes(col = hsthour))