library(data.table)
library(dplyr)
#
# plot3.r - Produce chart of hourly sub meter usage for days of
#    2007-02-01 - 2007-02-02
#
# Files are read from and written to the current working directory
#   Input File =  household_power_consumption.txt.   
#        This file must be downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#        and then unzipped to the current working directory where this is run.
#   Output File = plot3.png

# Read input file & filter out desired days
dataFileName <- "./household_power_consumption.txt"
powerData <- read.table(dataFileName, sep=";", header=TRUE,na.strings="?")

powerSubset <- filter(powerData, Date == "1/2/2007" | Date == "2/2/2007")

# Create date/time objects
powerSubset$datetime <- strptime(paste(powerSubset$Date,powerSubset$Time,sep=", "),format="%d/%m/%Y, %H:%M:%S")

# Create plot and write to png
png(filename="plot3.png",width=480, height=480)
plot(powerSubset$datetime, powerSubset$Sub_metering_1, pch=NA,type="l",ylab="Energy sub metering",xlab=NA)
par(new=T)
lines(powerSubset$datetime, powerSubset$Sub_metering_2, col="red")
lines(powerSubset$datetime, powerSubset$Sub_metering_3, col="blue")
legend("topright",col=c("black","red","blue"), lty=1, 
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
par(new=F)
dev.off()
