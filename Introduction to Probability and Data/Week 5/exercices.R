library(ggplot2)
library(dplyr)
library(magrittr)

load("/Users/alexisgomes/www/Co ursera/Introduction to Probability and Data/Week 5/brfss2013.RData")

head(brfss2013)

#Q1
brfss2013 %>%
  select(sleptim1) %>%
  filter(sleptim1 != "NA") %>%
  summarise(mean_dd = mean(sleptim1), sd_dd = sd(sleptim1), n = n(), interquartile_range = IQR(sleptim1))
#7.052099 //1.60411

brfss2013 %>%
  select(sleptim1, smoke100, smokday2) %>%
  filter(sleptim1 != "NA", smoke100 == "Yes") %>%
  summarise(mean_dd = mean(sleptim1), sd_dd = sd(sleptim1), n = n(), interquartile_range = IQR(sleptim1))
#7.002538 // 1.555443

brfss2013 %>%
  select(sleptim1, smoke100, smokday2) %>%
  filter(sleptim1 != "NA", smokday2 == "Every day") %>%
  summarise(mean_dd = mean(sleptim1), sd_dd = sd(sleptim1), n = n(), interquartile_range = IQR(sleptim1))
#6.752346 // 1.757048

brfss2013 %>%
  select(sleptim1, smoke100, smokday2) %>%
  filter(sleptim1 != "NA", smokday2 == "Some days") %>%
  summarise(mean_dd = mean(sleptim1), sd_dd = sd(sleptim1), n = n(), interquartile_range = IQR(sleptim1))
#6.876494 // 1.737714

brfss2013 %>%
  select(sleptim1, smoke100, smokday2) %>%
  filter(sleptim1 != "NA", smokday2 == "Not at all") %>%
  summarise(mean_dd = mean(sleptim1), sd_dd = sd(sleptim1), n = n(), interquartile_range = IQR(sleptim1))
#7.122769 // 1.444219

#Q2
brfss2013 %>%
  filter(avedrnk2 != "NA") %>%
  summarise(mean_dd = mean(avedrnk2), sd_dd = sd(avedrnk2), n = n(), interquartile_range = IQR(avedrnk2), max = max(avedrnk2))

ggplot(data = brfss2013, aes(x = avedrnk2)) +
  geom_histogram(binwidth = 1)

brfss2013 %>%
  filter(X_frutsum != "NA") %>%
  summarise(mean_dd = mean(X_frutsum), sd_dd = sd(X_frutsum), n = n(), interquartile_range = IQR(X_frutsum), max = max(X_frutsum))

brfss2013 %>%
  filter(X_frutsum != "NA", X_frutsum < 1000, smokday2 == "Some days") %>%
  ggplot(aes(x = X_frutsum)) +
      geom_histogram(binwidth = 10)

brfss2013 %>%
  group_by(lastsmk2) %>%
  filter(sleptim1 != "NA") %>%
  summarise(mean_sleep = mean(sleptim1), std_sleep = sd(sleptim1)) %>%
  arrange(desc(lastsmk2)) %>%
  ggplot(aes(x = lastsmk2,  y = mean_sleep)) +
  geom_bar(stat="identity")

#Q3
brfss2013 %>%
  ggplot(aes(x = diabage2)) +
  geom_histogram(binwidth = 1)

brfss2013 %>%
  filter(asthmage != "NA") %>%
  mutate(asthmage = ifelse(asthmage == 97, 10, asthmage)) %>%
  ggplot(aes(x = asthmage)) +
  geom_bar(aes(y = (..count..)/sum(..count..))) +
  scale_y_continuous(labels = scales::percent)
