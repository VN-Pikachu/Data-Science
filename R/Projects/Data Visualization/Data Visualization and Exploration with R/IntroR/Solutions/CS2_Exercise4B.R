library(readr)
library(dplyr)
library(ggplot2)

dfHomeVals <- read_csv("County_Zhvi_SingleFamilyResidence.csv",col_names = TRUE)
dfHomeVals %>%
  select(RegionName, State, Metro, `2000` = `2000-05`, `2001` = `2001-05`, `2002`= `2002-05`, `2003`= `2003-05`, `2004` = `2004-05`, `2005` = `2005-05`, `2006` = `2006-05`, `2007` = `2007-05`, `2008` = `2008-05`, `2009` = `2009-05`, `2010` = `2010-05`, `2011` = `2011-05`, `2012` = `2012-05`, `2013` = `2013-05`, `2014` = `2014-05`, `2015` = `2015-05`, `2016` = `2016-05`, `2017` = `2017-05`, `2018` = `2018-05`) %>%
  filter(Metro %in% c("Austin", "Denver", "Phoenix", "Portland", "Salt Lake City")) %>%
  gather(`2000`, `2001`, `2002`, `2003`, `2004`, `2005`, `2006`, `2007`, `2008`, `2009`, `2010`, `2011`, `2012`, `2013`, `2014`, `2015`, `2016`, `2017`,key='YR', value='ZHVI') %>%
  group_by(Metro) %>%
  ggplot(mapping = aes(x=YR, y=ZHVI)) + geom_point() + facet_wrap(~Metro) + geom_smooth(method=lm, se=TRUE) + ggtitle("ZHVI by Metro Area") + xlab("Year") + ylab("ZHVI")

  