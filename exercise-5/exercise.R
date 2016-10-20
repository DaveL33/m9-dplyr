# Exercise 5: DPLYR Grouped Operations

# Install the nycflights13 package and read it in. Require the dplyr package.
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)
View(flights)
# In which month was the average departure delay the greatest?
# Hint: you'll have to perform a grouping operation before summarizing your data
greatest.mo <- group_by(flights, month) %>% 
               summarize(mean = mean(dep_delay, na.rm = TRUE)) %>% 
               arrange(desc(mean))


# If you create a data.frame with the columns "month", and "delay" above, you should be able to create 
# a scatterplot by passing it to the 'plot' function
mon.delay <- select(flights, month, dep_delay)
plot(mon.delay)

# In which airport were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
avg.arrival.delay <- flights %>% 
                     group_by(carrier) %>% 
                     summarize(mean = mean(arr_delay, na.rm = TRUE)) %>% 
                     arrange(desc(mean))

### Bonus ###
# Which city was flown to with the highest average speed?
city.speed <- flights %>% 
              group_by(dest) %>% 
              mutate(speed = distance/air_time * 60) %>% 
              summarize(mean = mean(speed, na.rm = TRUE)) %>% 
              arrange(desc(mean))
