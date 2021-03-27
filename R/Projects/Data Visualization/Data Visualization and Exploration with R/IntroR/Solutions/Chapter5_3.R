df <- read_csv("usco2005.csv", col_names = TRUE)
View(df)
df2 <- separate(df,"State-County Name",into = c("StateAbbrev", "CountyName"))
View(df2)