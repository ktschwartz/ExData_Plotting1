# Read in Data
DATA <- read.table('household_power_consumption.txt', sep = ';', header = T, na.strings = '?')

# Combine Date and Time and convert
DATA$datetime <- paste(as.Date(DATA$Date, format = "%d/%m/%Y"), DATA$Time)
DATA$datetime <- strptime(DATA$datetime, format = "%Y-%m-%d %H:%M:%S")

# Extract data for the first two days in February
plotDATA <- subset(DATA, Date == '1/2/2007'| Date == '2/2/2007')

# Open plot device
png('plot4.png')

# Set up margins
par(mfcol = c(2,2))

# Plot and save a line graph of global active power
plot(x = plotDATA$datetime, y = plotDATA$Global_active_power, ylab = 'Global Active Power (kilowatts)',
     type = 'l', xlab = '')

# Plot and save a line graph of energy sub metering
plot(x = plotDATA$datetime, y = plotDATA$Sub_metering_1, ylab = 'Energy sub metering',
     type = 'l', xlab = '', col = 'black')
points(x = plotDATA$datetime, y = plotDATA$Sub_metering_2, type = 'l', xlab = '', col = 'red')
points(x = plotDATA$datetime, y = plotDATA$Sub_metering_3, type = 'l', xlab = '', col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty = 1 , lwd = 1)

# Plot and save a line graph of voltage
plot(x = plotDATA$datetime, y = plotDATA$Voltage, ylab = 'Voltage',
     type = 'l', xlab = 'datetime')

# Plot and save a line graph of global reactive power
plot(x = plotDATA$datetime, y = plotDATA$Global_reactive_power, ylab = 'Global_reactive_power',
     type = 'l', xlab = 'datetime')

# Close device
dev.off()

