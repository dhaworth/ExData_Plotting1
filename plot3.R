# Download the source file
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")

# Unzip data file and read into data frame
unzip("household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Get subset of the data for only the dates 1/2/2007 and 2/2/2007
sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Prepare plot data
timestamp <- strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S")
sm1 <- as.numeric(as.character(sub$Sub_metering_1))
sm2 <- as.numeric(as.character(sub$Sub_metering_2))
sm3 <- as.numeric(as.character(sub$Sub_metering_3))

# Open png device
png("plot3.png", width=600)

# Plot chart
par(mar=c(2.5,4,1,1.5))
plot(timestamp, sm1, type="n", main="", ylab="Energy sub metering", xlab="")
lines(timestamp, sm1)
lines(timestamp, sm2, col="red")
lines(timestamp, sm3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black", "red", "blue"))

# Close png device
dev.off()