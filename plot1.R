library(data.table)
library(dplyr)
#
# plot1.r - Produce histogram of Global Active Power usage for days of
#    2007-02-01 - 2007-02-02
#
# Files are read from and written to the current working directory
#   Input File =  household_power_consumption.txt.   
#        This file must be downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#        and then unzipped to the current working directory where this is run.
#   Output File = plot1.png

# Read input file & filter out desired days
dataFileName <- "./household_power_consumption.txt"
powerData <- read.table(dataFileName, sep=";", header=TRUE,na.strings="?")

powerSubset <- filter(powerData, Date == "1/2/2007" | Date == "2/2/2007")

# Create histogram and write to png
hist(powerSubset$Global_active_power,  xlab="Global Active Power (killowats)",  main="Global Active Power",col="red")
dev.print(device=png,width=480, height=480,"plot1.png")
