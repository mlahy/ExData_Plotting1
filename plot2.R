library(data.table)
if(!file.exists('dt.zip')){
  url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(url, destfile = "dt.zip")
}
unzip("dt.zip")

dt = fread("household_power_consumption.txt", header = T)

dt = dt[dt$Date %in% c("1/2/2007","2/2/2007"),]

dt = cbind(dt, td = strptime(paste(dt$Date, dt$Time, sep=" "),"%d/%m/%Y %H:%M:%S"))

plot(dt$td, dt$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


