file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url, destfile = "household_power_consumption.zip")
unzip('household_power_consumption.zip')

f1 <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
f1 <- subset(f1, Date == "1/2/2007" | Date == "2/2/2007")

png(filename='plot1.png', width=480, height=480, units='px')
with(f1, hist(Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)"))
dev.off()