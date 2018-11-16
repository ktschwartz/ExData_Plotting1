# Read in Data
DATA <- read.table('household_power_consumption.txt', sep = ';', header = T, na.strings = '?')

# Combine Date and Time and convert
DATA$datetime <- paste(as.Date(DATA$Date, format = "%d/%m/%Y"), DATA$Time)
DATA$datetime <- strptime(DATA$datetime, format = "%Y-%m-%d %H:%M:%S")

# Extract data for the first two days in February
plotDATA <- subset(DATA, Date == '1/2/2007'| Date == '2/2/2007')

# Plot and save a line graph of global active power
png('plot2.png')
plot(x = plotDATA$datetime, y = plotDATA$Global_active_power, ylab = 'Global Active Power (kilowatts)',
     type = 'l', xlab = '')
dev.off()
