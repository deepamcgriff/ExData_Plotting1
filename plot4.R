setwd("~/Coursera Assignments/Exploratory Data Analysis/Week 1 HW")
#Read in text file
hp <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
#Convert time/date fields to date format and create one variable for 
##date/time

hp$Date <- strptime(hp$Date, "%d/%m/%Y")
hp$Time <- strptime(hp$Time, "%H:%M:%S")
hp$time <- format(hp$Time, "%H:%M:%S")
hp$Datetime <- as.POSIXct(paste(hp$Date, hp$time), format="%Y-%m-%d %H:%M:%S")
sub <- hp[which(hp$Date=="2007-02-01" | hp$Date=="2007-02-02"),]
#Recode relevant variables as numeric
sub$Global_active_power = as.numeric(sub$Global_active_power)
sub$gakw <- sub$Global_active_power/1000 #convert to kW
sub$Voltage = as.numeric(sub$Voltage)
sub$Global_reactive_power = as.numeric(sub$Global_reactive_power)

par(mfrow=c(2,2))
##Number 1
plot(sub$gakw ~ sub$Datetime, 
     ylab="Global Active Power (kilowatts)", xlab="", type="l", ylim=c(0,6))
##Number 2
plot(sub$Voltage ~ sub$Datetime, type="l", xlab="datetime", ylab="Voltage")
##Number 3
plot(sub$Sub_metering_1~sub$Datetime, type="l", ylab="Energy sub metering", xlab="")
lines(sub$Sub_metering_2~sub$Datetime, col="red")
lines(sub$Sub_metering_3~sub$Datetime, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##Number 4
plot(sub$Global_reactive_power ~ sub$Datetime, type="l", xlab="datetime", ylab="Global_reactive_power")
