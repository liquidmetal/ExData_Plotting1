# Read the data (I'm fetching data only for the two days)
d <- read.csv("household_power_consumption.txt", skip=66637, nrows=2880 ,sep=';', header=FALSE, col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));

# Setup the device
png(width=480, height=480, filename="plot1.png");

# Generate the plot
hist(d$Global_active_power, col='red', xlab="Global Active Power (kilowatts)", main="Global Active Power");

# Save to PNG file
dev.off()