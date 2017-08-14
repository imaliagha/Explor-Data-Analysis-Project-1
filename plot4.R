r1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
r1$Date <- as.Date(r1$Date, format="%d/%m/%Y")
r2 <- subset (r1, r1$Date == '2007-02-01' | r1$Date == '2007-02-02' )

r3 <- data.frame (paste(r2$Date, r2$Time),r2$Global_active_power,r2$Voltage, 
                  r2$Sub_metering_1, r2$Sub_metering_2, r2$Sub_metering_3, r2$Global_reactive_power)

r3$paste.r2.Date..r2.Time. <- as.POSIXct(r3$paste.r2.Date..r2.Time.)

par(mfrow = c(2,2))

#1st plot
plot(r3$paste.r2.Date..r2.Time., r3$r2.Global_active_power, type = 'l',xlab= '', ylab ="Global Active Power")

#2nd plot
plot(r3$paste.r2.Date..r2.Time., r3$r2.Voltage,type = 'l', xlab = "datetime", ylab = "Voltage")

#3rd plot
plot(r3$paste.r2.Date..r2.Time.,as.numeric(as.character(r3$r2.Sub_metering_1)), type  = 'l', xlab = '', ylab = "Energy sub metering")
lines(r3$paste.r2.Date..r2.Time., as.numeric(as.character(r3$r2.Sub_metering_2)), col ='red')
lines(r3$paste.r2.Date..r2.Time., as.numeric(as.character(r3$r2.Sub_metering_3)), col ="blue")


legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4th plot
plot(r3$paste.r2.Date..r2.Time., r3$r2.Global_reactive_power, type ='l',xlab= "datetime", ylab ="Global_reactive_power")


#make png file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()