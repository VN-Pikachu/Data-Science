ggplot(data=sm, aes(x=YEAR_, y=log(totalacres))) + geom_point() + geom_smooth(method=lm, se=FALSE)
ggplot(data=sm, aes(x=YEAR_, y=log(totalacres))) + geom_point() + geom_smooth(method=loess, se=FALSE)
ggplot(data=sm, aes(x=YEAR_, y=log(totalacres))) + geom_point() + geom_smooth(method=loess, se=TRUE)