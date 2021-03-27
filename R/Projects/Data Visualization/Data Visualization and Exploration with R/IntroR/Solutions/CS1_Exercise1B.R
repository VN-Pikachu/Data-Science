library(readr)
library(dplyr)
library(ggplot2)

df <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)
df %>%
  select(STATE, YR = YEAR_, ACRES = TOTALACRES, CAUSE) %>%
  filter(ACRES >= 1000) %>%
  group_by(STATE, YR) %>%
  summarize(cnt = n()) %>%
  ggplot(mapping = aes(x=YR, y=cnt)) + geom_point() + facet_wrap(~STATE) + geom_smooth(method=lm, se=TRUE) + ggtitle("Number of Fires by State and Year") + xlab("Year") + ylab("Number of Fires")