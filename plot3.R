#plot3

install.packages("lubrydate")

library(lubridate)

dir.create("./plottingwithR")

setwd("./plottingwithR")

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileurl, destfile = "householdpowerc.zip", method = "curl")

unzip("householdpowerc.zip")

power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?" )

power$Date <- dmy(power$Date)

power2 <- power[(power$Date >= "2007-02-01" & power$Date <= "2007-02-02"),]

power2$mergeddatesandtimeposix <- as.POSIXct(strptime(paste(power2$Date,power2$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S"))

png(file = "plot3.png", width = 480, height = 480, units = "px")

with(power2, plot(power2$Sub_metering_1~power2$mergeddatesandtimeposix, type = "l", ylab = "Energy sub metering", xlab = ""))

lines(power2$Sub_metering_2~power2$mergeddatesandtimeposix, col="red")

lines(power2$Sub_metering_3~power2$mergeddatesandtimeposix, col="blue")

legend("topright", col = c("black", "red", "blue"), lty = 1 , lwd = 2, legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex = 0.7)

dev.off()

#ending






