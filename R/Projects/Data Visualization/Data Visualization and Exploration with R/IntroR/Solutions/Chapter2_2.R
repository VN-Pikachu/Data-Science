dfCrime <- read_csv("Crime_Data.csv", col_names = TRUE)
nrow(dfCrime)
View(dfCrime)
dfCrime <- select(dfCrime, 'Reported Date', 'Crime Subcategory', 'Primary Offense Description', 'Precinct', 'Sector', 'Beat', 'Neighborhood')
dfCrime <- select(dfCrime, 'CrimeDate' = 'Reported Date', 'Category' = 'Crime Subcategory', 'Description' = 'Primary Offense Description', 'Precinct', 'Sector', 'Beat', 'Neighborhood')