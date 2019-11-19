goog.train <- window(goog, end = 900)
goog.test <- window(goog, start = 901)

qcement.train <- window(qcement, end = c(2012, 4))
qcement.test <- window(qcement, start = c(2013, 1))

ses.goog <- ses(goog.train, alpha = .2, h = 100)
autoplot(ses.goog)

accuracy(ses.goog,goog.test)

goog.dif <- diff(goog.train)

ses.goog.dif <- ses(goog.dif, alpha = .2, h = 100)
autoplot(ses.goog.dif)

goog.dif.test <- diff(goog.test)
accuracy(ses.goog.dif, goog.dif.test)



holt.goog <- holt(goog.train, h = 100)
autoplot(holt.goog)

accuracy(holt.goog,goog.test)

holt.goog.opt <- holt(goog.train, h = 100, beta = 0.0601)
accuracy(holt.goog.opt,goog.test)

p1 <- autoplot(holt.goog) +
  ggtitle("Original Holt's Model") +
  coord_cartesian(ylim = c(400, 1000))

p2 <- autoplot(holt.goog.opt) +
  ggtitle("Optimal Holt's Model") +
  coord_cartesian(ylim = c(400, 1000))

gridExtra::grid.arrange(p1, p2, nrow = 1)


autoplot(decompose(qcement))

qcement.hw <- ets(qcement.train, model = "AAA")
autoplot(forecast(qcement.hw))

checkresiduals(qcement.hw)

qcement.f1 <- forecast(qcement.hw, h = 5)
accuracy(qcement.f1, qcement.test)


qcement.hw <- ets(qcement.train, model = "AAN")
autoplot(forecast(qcement.hw))

qcement.f1 <- forecast(qcement.hw, h = 5)
accuracy(qcement.f1, qcement.test)

qcement.hw <- ets(qcement.train, model = "ANA")
autoplot(forecast(qcement.hw))

qcement.f1 <- forecast(qcement.hw, h = 5)
accuracy(qcement.f1, qcement.test)











