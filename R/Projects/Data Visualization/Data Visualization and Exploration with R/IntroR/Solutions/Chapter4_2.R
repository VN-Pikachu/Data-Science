dfFires <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)
dfFires2 <- select(dfFires, FIRENAME, TOTALACRES, YEAR_)
head(dfFires2)

dfFires2 <- select(dfFires, "FIRE" = "FIRENAME", "ACRES" = "TOTALACRES", "YR" =  "YEAR_")
head(dfFires2)

dfFires3 <- select(dfFires, contains("DATE"))
head(dfFires3)

dfFires3 <- select(dfFires, contains("DATE"), starts_with("TOTAL"))
head(dfFires3)