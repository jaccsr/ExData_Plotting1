file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url, destfile = "household_power_consumption.zip")
unzip('household_power_consumption.zip')

f1 <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
f1 <- subset(f1, Date == "1/2/2007" | Date == "2/2/2007")
f1$Time <- strptime(paste(f1$Date, f1$Time), format = "%d/%m/%Y %H:%M:%S")

# 在英文系统下作图即可
png(filename='plot4.png', width=480, height=480, units='px')

par(mfcol = c(2, 2))
with(f1, {
    plot(Time, Global_active_power, xlab="", ylab="Global Active Power", type="l")
    
    plot(Time, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
    lines(Time, Sub_metering_2, col="red")
    lines(Time, Sub_metering_3, col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "blue", "red"), bty="n")
    
    plot(Time, Voltage, xlab="datetime", ylab="Voltage", type="l")
    
    plot(Time, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
})

dev.off()