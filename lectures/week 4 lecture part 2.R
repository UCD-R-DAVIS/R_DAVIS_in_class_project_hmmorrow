#learning dplyr and tidyr: select, filter, and pipes
#only do this once ever:
install.packages(
  #We've learned bracket subsetting
  #It can be hard to read and prone to error
  #dplyr is great for data table manipulation!
  #tidyr helps you switch between data formats
  
  #Packages in R are collections of additional functions
  #tidyverse is an "umbrella package" that
  #includes several packages we'll use this quarter:
  #tidyr, dplyr, ggplot2, tibble, etc.
  
  #benefits of tidyverse
  #1. Predictable results (base R functionality can vary by data type) 
  #2. Good for new learners, because syntax is consistent. 
  #3. Avoids hidden arguments and default settings of base R functions
  
  #To load the package type:
  library(tidyverse)
    #now let's work with a survey dataset
    surveys <- read_csv("data/portal_data_joined.csv")
      
      
      str(surveys)
        
        
        
        
        
        
        
        
        
        #select columns
        month_day_year <- select(surveys,month,day,year)
          
          #filtering by equals
          year_1981 <- filter(surveys,year==1981)
          sum(year_1981$year!=1981, na.rm=T)
            
            #filtering by range
         the80stidy=   filter(surveys,year%in% 1981:1983)
                   #5033 results
                   
                   
                   #review: why should you NEVER do:
                the80srecycle=   filter(surveys, year == c(1981:1983))
nrow(the80srecycle)
                          #1685 results
                          
                          #This recycles the vector 
                          #(index-matching, not bucket-matching)
                          #If you ever really need to do that for some reason,
                          #comment it ~very~ clearly and explain why you're 
                          #recycling!
                          
                          #filtering by multiple conditions
                          bigfoot_with_weight <- filter(surveys, hindfoot_length>40&!is.na(weight))
                                                        
                                                        #multi-step process
                                                        small_animals <- filter(surveys, weight<5)
                                                                                #this is slightly dangerous because you have to remember 
                                                                                #to select from small_animals, not surveys in the next step
                                                                                small_animal_ids <- select(small_animals, record_id,plot_id,species_id)
                                                                                                           
                                                                                                           #same process, using nested functions
                                                                                                           small_animal_ids <- select(filter(surveys,weight<5),record_id,plot_id,species_id)
                                                                                                             
                                                                                                             #same process, using a pipe
                                                                                                             #Cmd Shift M
                                                                                                           %>% 
                                                                                                             #or |>
                                                                                                             #note our select function no longer explicitly calls the tibble
                                                                                                             #as its first element
                                                                                                             small_animal_ids <- surveys %>% filter( weight < 5) %>% 
                                                                                                               select(record_id,plot_id,species_id)
                                                                                                                 
                                                                                                                 #same as
                                                                                                                 small_animal_ids <- surveys %>% filter(
                                                                                                                   
                                                                                                                   
                                                                                                                   
                                                                                                                   #how to do line breaks with pipes
                                                                                                                   surveys %>% filter(
                                                                                                                  month==1)
                                                                                                                     
                                                                                                                     #good:
                                                                                                                     surveys %>% 
                                                                                                                       filter(month==1)
                                                                                                                     
                                                                                                                     #not good:
                                                                                                                     surveys 
                                                                                                                     %>% filter(month==1)
                                                                                                                     #what happened here?
                                                                                                                     
                                                                                                                     #line break rules: after open parenthesis, pipe,
                                                                                                                     #commas, 
                                                                                                                     #or anything that shows the line is not complete yet
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                                                                     #check out cute_rodent_photos!
                                                                                                                     #will be updated throughout the quarter
                                                                                                                     #as a bonus for checking out these videos
                                                                                                                     #and visiting the code demos on my repository
                                                                                                                     
                                                                                                                     
                                                                                                                     #one final review of an important concept we learned last week
                                                                                                                     #applied to the tidyverse
                                                                                                                     
                                                                                                                     mini <- surveys[190:209,]
                                                                                                                     table(mini$species_id)
                                                                                                                     #how many rows have a species ID that's either DM or NL?
                                                                                                                     nrow(mini)
                                                                                                                  test=   mini %>% filter(species_id %in% c("DM","NL"))
                                                                                                                     nrow(test)
                                                                                                                     # Data Manipulation Part 1b ----
                                                                                                                     # Goals: learn about mutate, group_by, and summarize
                                                                                                                     library(tidyverse)
                                                                                                                     surveys <- read_csv("data/portal_data_joined.csv")
                                                                                                                     str(surveys)
                                                                                                                     
                                                                                                                     
                                                                                                                     # Adding a new column
                                                                                                                     # mutate: adds a new column
                                                                                                                     surveys <- surveys %>%
                                                                                                                       mutate(weight_kg = weight/1000)
                                                                                                                     str(surveys)
                                                                                                                     # Add other columns
                                                                                                                     surveys <- surveys %>%
                                                                                                                       mutate(weight_kg = weight/1000, weight_kg2=weight_kg*2)
                                                                                                                     
                                                                                                                     # Filter out the NA's
                                                                                                                    ave_weight= surveys %>% filter(!is.na(weight)) %>% mutate(mean_weight=mean(weight))
                                                                                                                     
                                                                                                                     str(ave_weight)
                                                                                                                     nrow(ave_weight)
                                                                                                                     # Group_by and summarize ----
                                                                                                                     # A lot of data manipulation requires us to split the data into groups, apply some analysis to each group, and then combine the results
                                                                                                                     # group_by and summarize functions are often used together to do this
                                                                                                                     # group_by works for columns with categorical variables 
                                                                                                                     # we can calculate mean by certain groups
                                                                                                                     surveys %>%
                                                                                                                       group_by(sex) %>%
                                                                                                                       mutate(mean_weight = mean(weight, na.rm = TRUE)) 
                                                                                                                     
                                                                                                                     surveys %>%
                                                                                                                       group_by(sex) %>%
                                                                                                                       summarize(mean_weight = mean(weight, na.rm = TRUE)) 
                                                                                                                     # multiple groups
                                                                                                                    df= surveys %>%
                                                                                                                       group_by(sex, species_id) %>%
                                                                                                                       summarize(mean_weight = mean(weight, na.rm = TRUE))
                                                                                                                     
                                                                                                                     summary(df)
                                                                                                                     # remove na's
                                                                                                                     surveys=surveys(!is.na())
                                                                                                                     
                                                                                                                     # sort/arrange order a certain way
                                                                                                                    surveys %>%
                                                                                                                       group_by(sex, species_id) %>%
                                                                                                                       filter(sex!="") %>% 
                                                                                                                       summarize(mean_weight = mean(weight, na.rm = TRUE)) %>% 
                                                                                                                     arrange(-mean_weight)
                                                                                                                     # Challenge
                                                                                                                     #What was the weight of the heaviest animal measured in each year? 
                                                                                                                    #Return a table with three columns: year, weight of the heaviest animal in grams, and weight in kilograms, arranged (arrange()) in descending order, from heaviest to lightest. (This table should have 26 rows, one for each year)
                                                                                                                    d= surveys %>% select(year,record_id,weight) %>% 
                                                                                                                       group_by(year) %>%
                                                                                                                      summarize(max_weight_g=max(weight),max_weight_kg=max(weight)) %>% 
                                                                                                                      filter(!is.na(weight)) %>% 
                                                                                                                     mutate(weight_kg=weight/1000) 
                                                                                                                     
                                                                                                                    
                                                                                                                       nrow(d)
                                                                                                                       
                                                                                                                       
                                                                                                                     #Try out a new function, count(). Group the data by sex and pipe the grouped data into the count() function. How could you get the same result using group_by() and summarize()? Hint: see ?n.
                                                                                                                     