data("AirPassengers")
library('Metrics')
is.ts(AirPassengers)
print(AirPassengers)
summary(AirPassengers)
ts.plot(AirPassengers, xlab="Year", ylab="Number of Passengers", main="Monthly totals of international airline passengers, 1949-1960")
abline(reg=lm(AirPassengers~time(AirPassengers)))
acf(AirPassengers)
plot(acf(diff(AirPassengers)))
plot(pacf(AirPassengers))

ARIMA<-arima(AirPassengers, order = c(1,1,1))
summary(ARIMA)

ts.plot(AirPassengers)
ARIMA_fit <- AirPassengers - residuals(ARIMA)
points(ARIMA_fit, type = "l", col = 2, lty = 2)

predict_ARIMA <- predict(ARIMA)
predict_ARIMA$pred[1]
predict(ARIMA, n.ahead = 11)


