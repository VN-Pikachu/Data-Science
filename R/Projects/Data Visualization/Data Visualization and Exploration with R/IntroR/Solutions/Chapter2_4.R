dfCrime = group_by(dfCrime, Beat)
dfCrime = summarise(dfCrime, n = n())
head(dfCrime)