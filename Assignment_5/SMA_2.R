#Moving averages of moving averages

library('fpp2')
beer2 <- window(ausbeer,start=1992)
ma4 <- ma(beer2, order=4, centre=FALSE)
ma2x4 <- ma(beer2, order=4, centre=TRUE)
show(beer2)
show(ma4)
show(ma2x4)

autoplot(elecequip, series="Data") +
  autolayer(ma(elecequip, 12,FALSE), series="12-MA") +
  xlab("Year") + ylab("New orders index") +
  ggtitle("Electrical equipment manufacturing (Euro area)") +
  scale_colour_manual(values=c("Data"="grey","12-MA"="red"),
                      breaks=c("Data","12-MA"))