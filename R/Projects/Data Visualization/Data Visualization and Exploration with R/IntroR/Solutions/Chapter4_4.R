library(lubridate) #lubridate needs to be installed as well before you load it
dfFires <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)
df <- select(dfFires, ORGANIZATI, STATE, YEAR_, TOTALACRES, CAUSE, STARTDATED)
df <- filter(df, TOTALACRES >= 1000 & CAUSE %in% c('Human', 'Natural'))
df <- mutate(df, DOY = yday(as.Date(df$STARTDATED, format='%m/%d/%y %H:%M')))
View(df)