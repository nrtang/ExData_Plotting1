# Read Source Data

sourceData <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

# Convert Date

sourceData$Date <- as.Date(sourceData$Date, format="%d/%m/%Y")

# Filter Data

DataFiltered <- sourceData[sourceData$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

# Store Global Active Power

GlobalActivePower <- as.numeric(as.character(DataFiltered$Global_active_power))

# Generate Histogram

png("plot1.png")

hist(GlobalActivePower, breaks=12, c="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()