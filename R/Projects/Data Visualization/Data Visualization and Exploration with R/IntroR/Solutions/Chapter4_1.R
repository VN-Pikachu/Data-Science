dfFires <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)
nrow(dfFires)

df25k <- filter(dfFires, TOTALACRES >= 25000)
nrow(df25k)

df1k <- filter(dfFires, TOTALACRES >= 1000, YEAR_ == 2016)
nrow(df1k)

df1k <- filter(dfFires, TOTALACRES >= 1000 & YEAR_ == 2016)
dfYear <- filter(dfFires,YEAR_ %in% c(2010, 2011, 2012))
View(dfYear)