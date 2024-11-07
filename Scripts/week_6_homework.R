library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv") #ONLY change the "data" part of this path if necessary
gapminder %>% 
  group_by(continent,year) %>% 
  summarise(avg_lifespan= mean(lifeExp)) %>% 
ggplot()+
         geom_point(aes(x=year, y= avg_lifespan,color=continent))+
         geom_smooth(aes(x=year, y= avg_lifespan,color=continent))
#scale_x_log10() seems to be taking the log base 10 of the x values and making those the new x axis values
#the geom_smooth() function is creating a regression line
gapminder %>% 
  filter(country==c("Brazil","China","El Salvador","Niger","United States")) %>% 
ggplot(aes(x=country, y= lifeExp))+
  geom_boxplot()+
  geom_jitter(alpha=0.1)+theme_minimal()
  ggtitle("Life expectancy of Five Countries")+
  xlab("Country")+ylab("Life Expectancy")
