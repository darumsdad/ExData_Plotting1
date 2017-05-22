library(dplyr)
f <- read.table(file = "household_power_consumption.txt", sep = ';', header = T ,  na.strings = '?',colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")  )

f <- mutate(f, dt = paste(f$Date, f$Time))
f$dt <- strptime ( f$dt, "%d/%m/%Y %H:%M:%S")  

s <- f[f$dt>="2007-02-01" & f$dt<"2007-02-03",]

png(filename = "plot3.png", width = 480, height = 480)
xrange <- range(s$dt) 
yrange <- range(s$Sub_metering_1)
plot(xrange, yrange, type="n", ylab="Energy Sub Metering" , xlab="") 
lines(s$dt, s$Sub_metering_1, type="l", lwd=1.5,col="black")
lines(s$dt, s$Sub_metering_2, type="l", lwd=1.5,col="orange")
lines(s$dt, s$Sub_metering_3, type="l", lwd=1.5,col="purple")
legend("topright", legend =  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","orange","purple") , lty=1, cex=0.8)
dev.off()
