library(readr)
library(lubridate)
library(dplyr)
library(ggplot2)

df <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)
df %>%
  select(ORGANIZATI, STATE, YR = YEAR_, ACRES = TOTALACRES, CAUSE, STARTDATED) %>%
  filter(ACRES >= 1000) %>%
  #filter(ACRES >= 1000 & STATE == 'Arizona') %>%
  mutate(DOY = yday(as.Date(STARTDATED, format='%m/%d/%y %H:%M'))) %>%
  group_by(YR) %>%
  summarize(dtEarly = min(DOY, na.rm=TRUE), dtLate = max(DOY, na.rm=TRUE)) %>%
  ggplot()  + geom_line(mapping = aes(x=YR, y=dtEarly, color='B'))  + geom_line(mapping = aes(x=YR, y=dtLate, color='R')) + geom_smooth(method=lm, se=TRUE, aes(x=YR, y=dtEarly, color="B")) + geom_smooth(method=lm, se=TRUE, aes(x=YR, y=dtLate, color="R")) + xlab("Year") + ylab("Day of Year") + scale_colour_manual(name = "Legend", values = c("R" = "#FF0000", "B" = "#000000"), labels = c("First Fire", "Last Fire")) 