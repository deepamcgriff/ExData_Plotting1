setwd("H:/Coursera Data Specialization Course/Exploratory Data Analysis/HW1")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset data for specific date range
sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#convert to numeric variable
globalActivePower <- as.numeric(sub$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()