setwd("~/Coursera Assignments/Exploratory Data Analysis/Week 1 HW")
hp <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Change date format for time and date variables; create one string for date/time
hp$Date <- strptime(hp$Date, "%d/%m/%Y")
hp$Time <- strptime(hp$Time, "%H:%M:%S")
hp$time <- format(hp$Time, "%H:%M:%S")
hp$Datetime <- as.POSIXct(paste(hp$Date, hp$time), format="%Y-%m-%d %H:%M:%S")
#subset observations for a given date range
sub <- hp[which(hp$Date=="2007-02-01" | hp$Date=="2007-02-02"),]
#Recode variables as numeric
sub$Sub_metering_1 <- as.numeric(sub$Sub_metering_1)
sub$Sub_metering_2 <- as.numeric(sub$Sub_metering_2)
sub$Sub_metering_3 <- as.numeric(sub$Sub_metering_3)

##PLOT #3
plot(sub$Sub_metering_1~sub$Datetime, type="l", ylab="Energy sub metering", xlab="")
lines(sub$Sub_metering_2~sub$Datetime, col="red")
lines(sub$Sub_metering_3~sub$Datetime, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
