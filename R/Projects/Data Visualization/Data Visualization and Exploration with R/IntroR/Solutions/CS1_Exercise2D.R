library(readr)
library(dplyr)
library(ggplot2)

df <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)
df %>%
  select(ORGANIZATI, STATE, YR = YEAR_, ACRES = TOTALACRES, CAUSE) %>%
  filter(ACRES >= 1000) %>%
  group_by(STATE) %>%
  ggplot(mapping = aes(x=STATE, y=log(ACRES))) + geom_violin() + geom_boxplot(width=0.1) + ggtitle("Wildfires by State Greater than 1,000 Acres") + xlab("State") + ylab("Acres Burned (Log)")