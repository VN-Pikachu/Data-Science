ggplot(data=sm, aes(x=YEAR_, y=log(totalacres), color=STATE)) + geom_point() + labs(title=paste("Acreage Burned by Wildfires Has Increased In the Past Few Decades"), subtitle=paste("1980-2016"), caption="Data from USGS") + scale_y_continuous(name="Log of Total Acres Burned") + scale_x_continuous(name="Burn Year") + theme(legend.position="bottom")
ggplot(data=sm, aes(x=YEAR_, y=log(totalacres), color=STATE)) +
   geom_point() +
   labs(title=paste("Acreage Burned by Wildfires Has Increased In the Past Few Decades"), subtitle=paste("1980-2016"), caption="Data from USGS") +
   scale_y_continuous(name="Log of Total Acres Burned") +
   scale_x_continuous(name="Burn Year") +
   theme(legend.position = "bottom") +
   guides(color=guide_legend(nrow=2,override.aes=list(size=4)))
