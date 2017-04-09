setwd("~/Coursera Assignments/Exploratory Data Analysis/Week 1 HW")
hp <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Change date format for time and date variables; create one string for date/time
hp$Date <- strptime(hp$Date, "%d/%m/%Y")
hp$Time <- strptime(hp$Time, "%H:%M:%S")
hp$time <- format(hp$Time, "%H:%M:%S")
hp$Datetime <- as.POSIXct(paste(hp$Date, hp$time), format="%Y-%m-%d %H:%M:%S")
#subset observations for a given date range
sub <- hp[which(hp$Date=="2007-02-01" | hp$Date=="2007-02-02"),]
#Recode variable as numeric; transform into kW
sub$Global_active_power = as.numeric(sub$Global_active_power)
sub$gakw <- sub$Global_active_power/1000
##PLOT 2
plot(sub$gakw ~ sub$Datetime, 
     ylab="Global Active Power (kilowatts)", xlab="", type="l", ylim=c(0,6))

