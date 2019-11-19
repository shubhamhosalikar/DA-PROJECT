library('stats')
library('quantmod')
library('readxl')

USMacroSWQ <- read_xlsx("/Users/GOUTHAM SEKAR/Desktop/us_macro_quarterly.xlsx",
                        sheet = 1,
                        col_types = c("text", rep("numeric", 9)))
USMacroSWQ$...1 <- as.yearqtr(USMacroSWQ$...1, format = "%Y:0%q")

colnames(USMacroSWQ) <- c("Date", "GDPC96", "JAPAN_IP", "PCECTPI", 
                          "GS10", "GS1", "TB3MS", "UNRATE", "EXUSUK", "CPIAUCSL")

GDP <- xts(USMacroSWQ$GDPC96, USMacroSWQ$Date)["1960::2013"]
GDPGrowth <- xts(400 * log(GDP/lag(GDP)))

GDPGRSub <- GDPGrowth["1962::2012"]
print(GDPGRSub)

AR<-ar.ols(GDPGRSub, 
       order.max = 1, 
       demean = F, 
       intercept = T)
AR1<-arima(GDPGRSub, order = c(1,0,0))
print(AR)
acf(GDPGRSub)
pacf(GDPGRSub)

summary(AR1)

     

N <-length(GDPGRSub)
GDPGR_level <- as.numeric(GDPGRSub[-1])
GDPGR_lags <- as.numeric(GDPGRSub[-N])
armod <- lm(GDPGR_level ~ GDPGR_lags)
print(armod)

library(forecast)
new <- data.frame("GDPGR_lags" = GDPGR_level[N-1])

forecast(armod, newdata = new)
forecast(armod, newdata = new)$mean - GDPGrowth["2013"][1]

summary(armod)$r.squared
summary(armod)$sigma^2
summary(armod)
accuracy(armod)


plot(armod)
