# Exploratory data analysis programming assignment 1 plot 1

##Install and load packages and load libraries

if(!require(pacman)) install.packages("pacman")
pacman::p_load(dplyr, lubridate)

## Read the data table and change the date format

my_data <- read.table("~/household_power_consumption.txt", sep=";", head=TRUE, stringsAsFactors=FALSE)
my_data$Date <- dmy(my_data$Date)

## Subset the dates of interest. Change the Global Active Power from character to numeric
dates <- my_data %>% filter(Date == "2007-2-1" | Date == "2007-2-2")
dates$Global_active_power <- as.numeric(dates$Global_active_power)

## Plot the histogram
hist(dates$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Save the plot 

png(filename = "plot1.png", width = 480, height = 480)

dev.off()