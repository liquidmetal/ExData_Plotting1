# Read the data (I'm fetching data only for the two days)
d <- read.csv("household_power_consumption.txt", skip=66637, nrows=2880 ,sep=';', header=FALSE, col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), colClasses=c(rep("character", 2), rep("numeric", 7)));

# We need a datetime column - generate that by concatenating the Date and Time columns
d$Date_time <- as.POSIXct(paste(d$Date, d$Time, sep=" "), format="%d/%m/%Y %T");

# Setup the device
png(width=480, height=480, filename="plot3.png");

# Render each line seperately
plot(d$Date_time, d$Sub_metering_1, xlab='', ylab="Energy sub metering", type="l")
lines(d$Date_time, d$Sub_metering_2, type="l", col="red")
lines(d$Date_time, d$Sub_metering_3, type="l", col="blue")

# Render the legent
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid");

# Save the file!
dev.off();