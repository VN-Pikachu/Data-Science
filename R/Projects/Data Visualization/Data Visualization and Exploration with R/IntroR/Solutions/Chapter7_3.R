grp <- group_by(df, STATE, YEAR_)
sm <- summarize(grp, totalacres = sum(TOTALACRES))
ggplot(data=sm, aes(x=YEAR_, y=totalacres, colour=STATE)) + geom_point(aes(colour = STATE)) + stat_smooth(method=lm, se=FALSE)