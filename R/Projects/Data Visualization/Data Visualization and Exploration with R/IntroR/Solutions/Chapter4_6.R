library(lubridate)
df <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE) %>%
select(ORGANIZATI, STATE, YEAR_, TOTALACRES, CAUSE, STARTDATED) %>%
filter(TOTALACRES >= 1000 & CAUSE %in% c('Human', 'Natural')) %>%
mutate(DOY = yday(as.Date(STARTDATED, format='%m/%d/%y %H:%M')))
View(df)

