# Exploratory data analysis programming assignment 1 plot 2

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

## Plot the lines
plot(datetime, dates$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")

## Save the plot 

png(filename = "plot2.png", width = 480, height = 480)

dev.off()
