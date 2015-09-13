# Download the source file
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")

# Unzip data file and read into data frame
unzip("household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Get subset of the data for only the dates 1/2/2007 and 2/2/2007
sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Open png device
png("plot1.png", width=600)

# Plot chart
hist(as.numeric(as.character(sub$Global_active_power)), col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Close png device
dev.off()