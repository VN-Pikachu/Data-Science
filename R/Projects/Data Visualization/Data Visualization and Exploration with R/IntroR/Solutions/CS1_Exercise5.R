library(readr)
library(dplyr)
library(ggplot2)

df <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)
df %>%
  select(ORG = ORGANIZATI, STATE, YR = YEAR_, ACRES = TOTALACRES, CAUSE, STARTDATED) %>%
  filter(ACRES >= 1000 & ORG %in% c('BIA', 'BLM', 'FS', 'FWS', 'NPS')) %>%
  group_by(ORG, YR) %>%
  summarize(meanacres = mean(ACRES)) %>%
  ggplot(mapping = aes(x=YR, y=log(meanacres))) + geom_point() + facet_wrap(~ORG) + geom_smooth(method=lm, se=TRUE) + ggtitle("Acres Burned by Federal Organziation") + xlab("Year") + ylab("Log of Total Acres Burned")