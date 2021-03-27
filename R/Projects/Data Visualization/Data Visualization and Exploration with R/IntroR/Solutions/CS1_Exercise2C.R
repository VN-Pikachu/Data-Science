library(readr)
library(dplyr)
library(ggplot2)

df <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)
df %>%
  select(STATE, YR = YEAR_, ACRES = TOTALACRES, CAUSE) %>%
  filter(ACRES >= 1000 & CAUSE %in% c('Human', 'Natural')) %>%
  group_by(CAUSE, YR) %>%
  summarize(totalacres = sum(ACRES)) %>%
  ggplot(mapping = aes(x=YR, y=log(totalacres), colour=CAUSE)) + geom_point() + geom_smooth(method=lm, se=TRUE) + ggtitle("Total Acres Burned") + xlab("Year") + ylab("Log of Total Acres Burned")
