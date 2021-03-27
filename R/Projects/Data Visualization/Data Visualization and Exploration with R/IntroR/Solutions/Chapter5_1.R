dfPop <- read_csv("CountryPopulation.csv", col_names = TRUE)
View(dfPop)
dfPop2 <- gather(dfPop, `2010`, `2011`, `2012`, `2013`, `2014`, `2015`, `2016`, `2017`, key = 'YEAR', value = 'POPULATION')
View(dfPop2)