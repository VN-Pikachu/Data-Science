library(readr)
library(dplyr)
library(ggplot2)

df <- read_csv("County_Zhvi_SingleFamilyResidence.csv",col_names = TRUE)
df %>%
  select(RegionName, State, Metro, `1996` = `1996-05`, `1997` = `1997-05`, `1998` = `1998-05`, `1999` = `1999-05`,`2000` = `2000-05`, `2001` = `2001-05`, `2002`= `2002-05`, `2003`= `2003-05`, `2004` = `2004-05`, `2005` = `2005-05`, `2006` = `2006-05`, `2007` = `2007-05`, `2008` = `2008-05`, `2009` = `2009-05`, `2010` = `2010-05`, `2011` = `2011-05`, `2012` = `2012-05`, `2013` = `2013-05`, `2014` = `2014-05`, `2015` = `2015-05`, `2016` = `2016-05`, `2017` = `2017-05`, `2018` = `2018-05`) %>%
  filter(State == 'TX' & Metro == 'Austin') %>%
  gather(`1996`, `1997`, `1998`, `1999`, `2000`, `2001`, `2002`, `2003`, `2004`, `2005`, `2006`, `2007`, `2008`, `2009`, `2010`, `2011`, `2012`, `2013`, `2014`, `2015`, `2016`, `2017`, `2018`,key='YR', value='ZHVI') %>%
  #ggplot(mapping = aes(x=YR, y=ZHVI, colour=RegionName)) + geom_point() + ggtitle("Single Family Homes Values Have Increased in the Austin Metro Area") + xlab("Year") + ylab("Home Values")
  ggplot(mapping = aes(x=YR, y=ZHVI, colour=RegionName)) + geom_col() + ggtitle("Single Family Homes Values Have Increased in the Austin Metro Area") + xlab("Year") + ylab("Home Values")
