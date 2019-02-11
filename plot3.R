# Exploratory data analysis programming assignment 1 plot 3

##Install and load packages and load libraries

if(!require(pacman)) install.packages("pacman")
pacman::p_load(dplyr)

## Read the data table and change the date format

my_data <- read.table("~/household_power_consumption.txt", sep=";", head=TRUE, stringsAsFactors=FALSE)

## Subset the dates of interest. Change the Global Active Power from character to numeric
dates <- my_data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
dates$Global_active_power <- as.numeric(dates$Global_active_power)

## Get the dates, days and time information
datetime <- strptime(paste(dates$Date, dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Separate the meters
submeter1 <- as.numeric(dates$Sub_metering_1)
submeter2 <- as.numeric(dates$Sub_metering_2)
submeter3 <- as.numeric(dates$Sub_metering_3)

## Plot the lines
plot(datetime, submeter1, type = "l", ylab = "Energy Submetering", xlab="")
lines(datetime,submeter2,type = "l",col="red")
lines(datetime,submeter3,type = "l", col="blue")

## Add legend to the plot
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd=3, col = c("black","red","blue"))

## Save the plot 

png(filename = "plot3.png", width = 480, height = 480)

dev.off()
