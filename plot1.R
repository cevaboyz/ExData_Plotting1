## plot1

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

power2$Global_active_power = as.numeric(as.character(power2$Global_active_power))

png("plot1.png", width = 480, height = 480, units = "px")

hist(power2$Global_active_power, main = "Global Active Power", col = "#fb0007", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()

#ending
