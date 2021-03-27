dfCrime2 = filter(dfCrime, Neighborhood == 'QUEEN ANNE')
nrow(dfCrime2)
dfCrime3 = filter(dfCrime, Neighborhood == 'QUEEN ANNE', Category == 'BURGLARY-RESIDENTIAL')