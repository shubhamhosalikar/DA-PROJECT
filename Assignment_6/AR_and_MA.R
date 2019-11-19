data("AirPassengers")
library('Metrics')
is.ts(AirPassengers)
print(AirPassengers)
summary(AirPassengers)
ts.plot(AirPassengers, xlab="Year", ylab="Number of Passengers", main="Monthly totals of international airline passengers, 1949-1960")
abline(reg=lm(AirPassengers~time(AirPassengers)))
acf(AirPassengers)
plot(acf(AirPassengers))
plot(pacf(AirPassengers))
AR <- arima(AirPassengers, order = c(1,0,0))
summary(AR)

print(AR)
ts.plot(AirPassengers)
AR_fit <- AirPassengers - residuals(AR)


points(AR_fit, type = "l", col = 2, lty = 2)
predict_AR <- predict(AR)
predict_AR$pred[1]
predict(AR, n.ahead = 10)

MA <- arima(AirPassengers, order = c(0,0,1))
print(MA)

summary(MA)

ts.plot(AirPassengers)
MA_fit <- AirPassengers - resid(MA)
points(MA_fit, type = "l", col = 2, lty = 2)
predict_MA <- predict(MA)
predict(MA,n.ahead=10)

cor(AR_fit, MA_fit)
AIC(AR) #Akaike Info Criterion
BIC(AR) #Bayesian Info Criterion
AIC(MA)
BIC(MA)


#Therefore for this data AR model is better.


 






