#plot 2

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

png(file = "plot2.png", width = 480, height = 480, units = "px")

with(power2, plot(mergeddatesandtimeposix,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" ))

dev.off()

#ending
