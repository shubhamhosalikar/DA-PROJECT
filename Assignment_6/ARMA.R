USMacroSWQ <- read_xlsx("/Users/GOUTHAM SEKAR/Desktop/us_macro_quarterly.xlsx",
                        sheet = 1,
                        col_types = c("text", rep("numeric", 9)))
USMacroSWQ$...1 <- as.yearqtr(USMacroSWQ$...1, format = "%Y:0%q")

colnames(USMacroSWQ) <- c("Date", "GDPC96", "JAPAN_IP", "PCECTPI", 
                          "GS10", "GS1", "TB3MS", "UNRATE", "EXUSUK", "CPIAUCSL")

GDP <- xts(USMacroSWQ$GDPC96, USMacroSWQ$Date)["1960::2013"]
GDPGrowth <- xts(400 * log(GDP/lag(GDP)))

GDPGRSub <- GDPGrowth["1962::2012"]
ts.plot(GDPGRSub)


acf(GDPGRSub) # From graph q = 1
pacf(GDPGRSub) # From graph p is approx 1

ARMA<-arima(GDPGRSub, order = c(1,0,1))
print(ARMA)

summary(ARMA)


predict_ARMA <- predict(ARMA)
predict_ARMA$pred[1]
predict(ARMA, n.ahead = 10)









