library(dplyr)
f <- read.table(file = "household_power_consumption.txt", sep = ';', header = T ,  na.strings = '?',colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")  )

f <- mutate(f, dt = paste(f$Date, f$Time))
f$dt <- strptime ( f$dt, "%d/%m/%Y %H:%M:%S")  

s <- f[f$dt>="2007-02-01" & f$dt<"2007-02-03",]

png(filename = "plot1.png", width = 480, height = 480)
hist(x = s$Global_active_power, col = c("Red") , main="Global Active Power", xlab = "Global Active Power (killowatt)")
dev.off()
