library(data.table)
if(!file.exists('dt.zip')){
  url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(url, destfile = "dt.zip")
}
unzip("dt.zip")

dt = fread("household_power_consumption.txt", header = T)

dt = dt[dt$Date %in% c("1/2/2007","2/2/2007"),]

dt = cbind(dt, td = strptime(paste(dt$Date, dt$Time, sep=" "),"%d/%m/%Y %H:%M:%S"))

par(mfrow=c(2,2))
plot(dt$td, dt$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(dt$td, dt$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(dt$td, dt$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dt$td, dt$Sub_metering_2, type="l", col="red")
lines(dt$td, dt$Sub_metering_3, type="l", col="blue")
legend("topright", 
       bty = "n", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,
       col = c("black","red","blue"))
plot(dt$td, dt$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")



dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
