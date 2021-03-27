df <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)
df <- filter(df, TOTALACRES >= 1000, YEAR_ %in% c(2010, 2011, 2012, 2013, 2014, 2015, 2016))
ggplot(data = df) + geom_bar(mapping = aes(x = YEAR_))
View(count(df, YEAR_))