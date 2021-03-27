library(readr)
library(dplyr)
library(ggplot2)

df <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)
df %>%
  select(STATE, YR = YEAR_, ACRES = TOTALACRES, CAUSE) %>%
  filter(ACRES >= 1000) %>%
  group_by(YR) %>%
  summarize(count=n()) %>%
  ggplot(mapping = aes(x=YR, y=count)) + geom_point() + geom_smooth(method=lm, se=TRUE) + ggtitle("Large Fires Are Becoming More Common in the West - 1980-2016") + xlab("Year") + ylab("Number of Wildfires")