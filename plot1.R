# Read in Data
DATA <- read.table('household_power_consumption.txt', sep = ';', header = T, na.strings = '?')

# Combine Date and Time and convert
DATA$DateTime <- paste(as.Date(DATA$Date, format = "%d/%m/%Y"), DATA$Time)
DATA$DateTime <- strptime(DATA$DateTime, format = "%Y-%m-%d %H:%M:%S")

# Extract data for the first two days in February
plotDATA <- subset(DATA, Date == '1/2/2007'| Date == '2/2/2007')

# Plot and save a histogram of global active power
png('plot1.png')
hist(plotDATA$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)',
     col = 'red')
dev.off()
