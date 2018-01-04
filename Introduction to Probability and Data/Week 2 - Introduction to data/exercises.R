library(statsr)
library(dplyr)
library(ggplot2)

# load dataframe
data(nycflights)

# gives names of the variables
#names(nycflights)

# get the structure of the dataframe
#str(nycflights)

rdu_flights <- nycflights %>%
  filter(dest == "RDU")
ggplot(data = nycflights, aes(x = dep_delay)) +
  geom_histogram(binwidth = 30)

sfo_feb_flights <- nycflights %>%
  filter(dest == "SFO", month == 2)
ggplot(data = nycflights, aes(x = arr_delay)) +
  geom_histogram(binwidth = 30)

sfo_feb_flights %>%
  group_by(carrier) %>%
  summarise(mean_dd = mean(arr_delay), sd_dd = sd(arr_delay), n = n(), interquartile_range = IQR(arr_delay))


nycflights %>%
  group_by(month) %>%
  summarise(mean_dd = mean(dep_delay), median_dd = median(dep_delay)) %>%
  arrange(desc(mean_dd))


#create new var dep_type
nycflights <- nycflights %>%
  mutate(dep_type = ifelse(dep_delay < 5, "on time", "delayed"))


nycflights %>%
  group_by(origin) %>%
  summarise(ot_dep_rate = sum(dep_type == "on time") / n()) %>%
  arrange(desc(ot_dep_rate))


#create new var avg_speed
nycflights <- nycflights %>%
  mutate(avg_speed = distance / air_time)

nycflights %>%
  arrange(desc(avg_speed)) %>%
  select(avg_speed, tailnum)

ggplot(data = nycflights, aes(x = avg_speed, y = distance)) +
  geom_point()


#create new var arr_type
nycflights <- nycflights %>%
  mutate(arr_type = ifelse(arr_delay <= 0, "on time", "delayed"))

nycflights %>%
  group_by(dep_type) %>%
  summarise(ot_arr_rate = sum(arr_type == "on time") / n()) %>%
  arrange(desc(ot_arr_rate))
