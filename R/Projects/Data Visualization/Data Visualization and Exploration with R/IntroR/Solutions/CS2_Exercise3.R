library(readr)
library(dplyr)
library(ggplot2)

dfHomeVals <- read_csv("County_Zhvi_SingleFamilyResidence.csv",col_names = TRUE)
dfHomeVals <- select(dfHomeVals, RegionName, State, Metro,`2010` = `2010-12`, `2011` = `2011-12`, `2012` = `2012-12`, `2013` = `2013-12`, `2014` = `2014-12`, `2015` = `2015-12`, `2016` = `2016-12`, `2017` = `2017-12`)
dfHomeVals <- filter(dfHomeVals, State == 'TX' & Metro == 'Austin' & RegionName == 'Travis')
dfHomeVals <- gather(dfHomeVals, `2010`, `2011`, `2012`, `2013`, `2014`, `2015`, `2016`, `2017`,key='YR', value='ZHVI')

dfRentVals <- read_csv("County_Zri_SingleFamilyResidenceRental.csv",col_names = TRUE)
dfRentVals <- select(dfRentVals, RegionName, State, Metro, `2010` = `2010-12`, `2011` = `2011-12`, `2012` = `2012-12`, `2013` = `2013-12`, `2014` = `2014-12`, `2015` = `2015-12`, `2016` = `2016-12`, `2017` = `2017-12`)
dfRentVals <- filter(dfRentVals, State == 'TX' & Metro == 'Austin' & RegionName == 'Travis')
dfRentVals <- gather(dfRentVals, `2010`, `2011`, `2012`, `2013`, `2014`, `2015`, `2016`, `2017`,key='YR', value='ZRI')

#join the two df
df <- inner_join(dfHomeVals, dfRentVals, by = 'YR')
df <- mutate(df, PriceRentRatio = ZHVI / (12 * ZRI))
ggplot(data=df) + geom_col(mapping = aes(x=YR, y=PriceRentRatio), fill="red")