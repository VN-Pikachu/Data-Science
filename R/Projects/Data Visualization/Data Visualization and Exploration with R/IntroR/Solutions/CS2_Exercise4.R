library(readr)
library(dplyr)
library(ggplot2)

dfHomeVals <- read_csv("County_Zhvi_SingleFamilyResidence.csv",col_names = TRUE)
dfHomeVals %>%
  select(RegionName, State, Metro,`2010` = `2010-12`, `2011` = `2011-12`, `2012` = `2012-12`, `2013` = `2013-12`, `2014` = `2014-12`, `2015` = `2015-12`, `2016` = `2016-12`, `2017` = `2017-12`) %>%
  filter(State == 'TX' & Metro %in% c("Austin", "San Antonio", "Dallas-Fort Worth", "Houston")) %>%
  #filter(Metro %in% c("Austin", "Denver", "Phoenix", "Portland", "Salt Lake City")) %>%
  gather(`2010`, `2011`, `2012`, `2013`, `2014`, `2015`, `2016`, `2017`,key='YR', value='ZHVI') %>%
  group_by(Metro) %>%
  ggplot(mapping = aes(x=Metro, y=ZHVI)) + geom_violin() + geom_boxplot(width=0.1) + ggtitle("ZHVI for Selected U.S. Metro Areas") + xlab("Metro") + ylab("ZHVI")