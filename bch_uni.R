rm(list=ls())
library(readxl)
library(forecast)
library(urca)
library(fUnitRoots)
library(tseries)
library(devtools)
library(FinTS)
library(fGarch)
library(rugarch)
btc=read.table("C:\\Users\\76783\\Desktop\\CRIX\\BCH.txt",header=T)
btc_price<-btc$price
btc_date<-as.Date(btc$date)
btc<-as.data.frame(cbind(btc_price,btc_date))

png("graph_bch.png", width=20, height=15, units="cm", res=800, bg="transparent")#
plot(btc_date,btc_price,main = "BCH",xlab=" ",ylab="daily price",type='l',col='blue')
dev.off()
#
daily_return<-diff(log(btc_price),1)
png("bch_logreturn.png", width=20, height=15, units="cm", res=800, bg="transparent")#
plot(btc_date[-1],daily_return,type = 'l',pch=19, col='blue', main = "BCH",xlab=" ",ylab="log return")
dev.off()
#
png("bch_acf.png", width=20, height=15, units="cm", res=800, bg="transparent")#
par(mfcol=c(2,1))
acf(daily_return, main = "")
pacf(daily_return,main = "")
dev.off()
#
Box.test(daily_return,lag=12,type='Ljung')# p-value = 0.04979
#
adfTest(daily_return,lags=12)#p-value=0.01
kpss.test(daily_return, null = c("Trend"), lshort = TRUE)#p-value=0.06
#
png("bch_logreturn_acf.png", width=20, height=15, units="cm", res=800, bg="transparent")
par(mfcol=c(2,1))
acf(daily_return^2,main='')
pacf(daily_return^2,main='')
dev.off()
#
Box.test(daily_return^2,lag=12,type='Ljung')# p-value = 1.83e-05
ArchTest(daily_return,lag=12,demean=TRUE)# p-value = 0.0005313
#
fit1=garchFit(~garch(1,0),data=daily_return,trace=F) 
fit1








