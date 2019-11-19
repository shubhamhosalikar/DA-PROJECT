#Moving Averages with varying value for m.

install.packages('tidyverse')
install.packages('fpp2')
library('fpp2')
autoplot(elecsales) + xlab("Year") + ylab("GWh") +
  ggtitle("Annual electricity sales: South Australia")

autoplot(elecsales, series="Data") +
  autolayer(ma(elecsales,7), series="7-MA") +
  xlab("Year") + ylab("GWh") +
  ggtitle("Annual electricity sales: South Australia") +
  scale_colour_manual(values=c("Data"="grey50","7-MA"="red"),
                      breaks=c("Data","7-MA"))