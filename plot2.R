# Read Source Data

sourceData <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Convert Date

sourceData$Date <- as.Date(sourceData$Date, format="%d/%m/%Y")

#Filter Data

DataFiltered <- sourceData[sourceData$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

#Convert Time

datetime <- paste(DataFiltered$Date, DataFiltered$Time)
DataFiltered$DateTime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S")

#Store Global Active Power

GlobalActivePower <- as.numeric(as.character(DataFiltered$Global_active_power))

#Generate Plot

png("plot2.png")

plot(x=DataFiltered$DateTime, y=GlobalActivePower, type="n", main="", xlab="Day", ylab="Global Active Power (kilowatt)")
lines(x=DataFiltered$DateTime, y=GlobalActivePower, type="l")

dev.off()