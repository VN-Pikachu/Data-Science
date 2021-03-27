#chart of crimes by year
dfCrime <- read_csv("Crime_Data.csv", col_names = TRUE)
dfCrime <- select(dfCrime, 'CrimeDate' = 'Reported Date', 'Category' = 'Crime Subcategory', 'Description' = 'Primary Offense Description', 'Precinct', 'Sector', 'Beat', 'Neighborhood')
dfCrime2 <- filter(dfCrime, Neighborhood == 'QUEEN ANNE', Category == 'BURGLARY-RESIDENTIAL')
dfCrime3 <- mutate(dfCrime2, YEAR = year(as.Date(dfCrime2$CrimeDate, format='%m/%d/%Y')))
View(dfCrime3)
dfCrime4 <- group_by(dfCrime3, YEAR)
dfCrime4 <- summarise(dfCrime4, n = n())
View(dfCrime4)
ggplot(data=dfCrime4) + geom_col(mapping = aes(x=YEAR, y=n), fill="red")

#chart of crimes by month
dfCrime3 <- mutate(dfCrime2, MONTH = month(as.Date(dfCrime2$CrimeDate, format='%m/%d/%Y')))
View(dfCrime3)
dfCrime4 <- group_by(dfCrime3, MONTH)
dfCrime4 <- summarise(dfCrime4, n = n())
ggplot(data=dfCrime4) + geom_col(mapping = aes(x=MONTH, y=n), fill="red")