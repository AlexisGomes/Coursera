library(statsr)
library(dplyr)
library(ggplot2)

data(kobe_basket)
kobe_basket

kobe_streak <- calc_streak(kobe_basket$shot)

ggplot(data = kobe_streak, aes(x = length)) +
  geom_histogram(binwidth = 1)

#simulate shots
shots_outcomes <- c("H", "M")
sim_basket <- sample(shots_outcomes, size = 133, replace = TRUE, prob = c(0.45, 0.55))
sim_streak <- calc_streak(sim_basket)
ggplot(data = sim_streak, aes(x = length)) +
  geom_histogram(binwidth = 1)