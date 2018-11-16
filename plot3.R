# Read in Data
DATA <- read.table('household_power_consumption.txt', sep = ';', header = T, na.strings = '?')

# Combine Date and Time and convert
DATA$datetime <- paste(as.Date(DATA$Date, format = "%d/%m/%Y"), DATA$Time)
DATA$datetime <- strptime(DATA$datetime, format = "%Y-%m-%d %H:%M:%S")

# Extract data for the first two days in February
plotDATA <- subset(DATA, Date == '1/2/2007'| Date == '2/2/2007')

# Plot and save a line graph of energy sub metering
png('plot3.png')
plot(x = plotDATA$datetime, y = plotDATA$Sub_metering_1, ylab = 'Energy sub metering',
     type = 'l', xlab = '', col = 'black')
points(x = plotDATA$datetime, y = plotDATA$Sub_metering_2, type = 'l', xlab = '', col = 'red')
points(x = plotDATA$datetime, y = plotDATA$Sub_metering_3, type = 'l', xlab = '', col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty = 1 , lwd = 1)
dev.off()
