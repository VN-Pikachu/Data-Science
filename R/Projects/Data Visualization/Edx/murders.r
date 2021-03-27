library(ggplot2)
library(dslabs)
View(murders)
library(dplyr)

#Murder rate per 100000 peple
murders <- murders %>% mutate(rate = total / population * 100000)

#Murder rate distribution
ggplot(murders, aes(rate)) + 
  geom_histogram(binwidth = 1, color = 'gray') +
  labs(title = 'Muder rate histogram')

#Check if murder rate can be well-approximated by a normal distribution by using quantile quantile plot
ggplot(murders, aes(sample = rate)) + 
  geom_qq() +
  geom_qq_line(color = 'red', size = 1)

#Boxplot for murder rate
ggplot(murders, aes(y = rate)) + geom_boxplot()
