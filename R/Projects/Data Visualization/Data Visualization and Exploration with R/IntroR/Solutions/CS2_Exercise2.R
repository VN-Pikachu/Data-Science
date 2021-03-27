library(readr)
library(dplyr)
library(ggplot2)

df <- read_csv("County_Zri_SingleFamilyResidenceRental.csv",col_names = TRUE)
df %>%
  select(RegionName, State, Metro, `2010` = `2010-12`, `2011` = `2011-12`, `2012` = `2012-12`, `2013` = `2013-12`, `2014` = `2014-12`, `2015` = `2015-12`, `2016` = `2016-12`, `2017` = `2017-12`) %>%
  filter(State == 'TX' & Metro == 'Austin') %>%
  gather(`2010`, `2011`, `2012`, `2013`, `2014`, `2015`, `2016`, `2017`,key='YR', value='ZRI') %>%
  ggplot(mapping = aes(x=YR, y=ZRI, colour=RegionName)) + geom_point() + geom_text(aes(label=ZRI, vjust = -0.5), size=3) +  ggtitle("Single Family Rental Values Have Increased in the Austin Metro Area") + xlab("Year") + ylab("Rental Values")
  #ggplot() + geom_bar(mapping = aes(x=YR, y=ZRI), fill='red')