# Download the source file
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")

# Unzip data file and read into data frame
unzip("household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Get subset of the data for only the dates 1/2/2007 and 2/2/2007
sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Prepare plot data
timestamp <- strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(as.character(sub$Global_active_power))

# Open png device
png("plot2.png", width=600)

# Plot chart
par(mar=c(2.5,4,1,1.5))
plot(timestamp, gap, ylab="Global Active Power (kilowatts)", xlab="", type="n")
lines(timestamp, gap)

# CLose png device
dev.off()