# Download the source file
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")

# Unzip data file and read into data frame
unzip("household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Get subset of the data for only the dates 1/2/2007 and 2/2/2007
sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Conbine date and time columns into one datetime
timestamp <- strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S")

# Open png device, set columns and rows
png("plot4.png", width=600)
par(mfrow=c(2, 2))

# Write plots
# plot 1
gap <- as.numeric(as.character(sub$Global_active_power))

par(mar=c(4.5,4,1,1.5))
plot(timestamp, gap, ylab="Global Active Power", xlab="", type="n")
lines(timestamp, gap)

# plot 2
voltage <- as.numeric(as.character(sub$Voltage))

par(mar=c(4.5,4,1,1.5))
plot(timestamp, voltage, ylab="Voltage", xlab="datetime", type="n")
lines(timestamp, voltage)

# plot 3
sm1 <- as.numeric(as.character(sub$Sub_metering_1))
sm2 <- as.numeric(as.character(sub$Sub_metering_2))
sm3 <- as.numeric(as.character(sub$Sub_metering_3))

par(mar=c(4.5,4,1,1.5))
plot(timestamp, sm1, type="n", main="", ylab="Energy sub metering", xlab="")
lines(timestamp, sm1)
lines(timestamp, sm2, col="red")
lines(timestamp, sm3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black", "red", "blue"), bty="n")

# plot 4
grp <- as.numeric(as.character(sub$Global_reactive_power))

par(mar=c(4.5,4,1,1.5))
plot(timestamp, grp, ylab="Global_reactive_power", xlab="datetime", type="n")
lines(timestamp, grp)

# Close png device
dev.off()