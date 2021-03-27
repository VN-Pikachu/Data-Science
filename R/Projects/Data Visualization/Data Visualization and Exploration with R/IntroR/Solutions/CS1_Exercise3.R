library(readr)
library(dplyr)
library(ggplot2)

dfWildfires <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)
df <- select(dfWildfires, STATE, YR = YEAR_, ACRES = TOTALACRES, CAUSE)
df <- filter(df, ACRES >= 1000)
grp <- group_by(df, CAUSE, YR)
sm <- summarize(grp, mean(ACRES))
colnames(sm)[3] <- 'MEAN'
ggplot(data=sm, mapping = aes(x=YR, y=MEAN)) + geom_point() + geom_smooth(method=lm, se=TRUE) + ggtitle("Average Size of Wildfires Has Increased for both Human and Natural Causes") + xlab("Year") + ylab("Average Wildfire Size")