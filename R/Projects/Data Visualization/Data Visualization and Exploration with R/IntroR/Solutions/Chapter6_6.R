df <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)

df <- select(df, ORGANIZATI, STATE, YEAR_, TOTALACRES, CAUSE)
df <- filter(df, TOTALACRES >= 1000)
mean(df$TOTALACRES)
median(df$TOTALACRES)
summary(df$TOTALACRES)