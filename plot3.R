#Read Source Data

sourceData <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Convert Date

sourceData$Date <- as.Date(sourceData$Date, format="%d/%m/%Y")

#Filter Data

DataFiltered <- sourceData[sourceData$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

#Convert Time

datetime <- paste(DataFiltered$Date, DataFiltered$Time)
DataFiltered$DateTime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S")

#Store Submetering values

SubMetering1 <- as.numeric(as.character(DataFiltered$Sub_metering_1))
SubMetering2 <- as.numeric(as.character(DataFiltered$Sub_metering_2))
SubMetering3 <- as.numeric(as.character(DataFiltered$Sub_metering_3))

#Create plot

png("plot3.png")

plot(x=DataFiltered$DateTime, y=SubMetering1, type="n", main="", xlab="Day", ylab="Energy sub metering")
lines(x=DataFiltered$DateTime, y=SubMetering1, type="l")
lines(x=DataFiltered$DateTime, y=SubMetering2, type="l", col="red")
lines(x=DataFiltered$DateTime, y=SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1, 1, 1), col=c("black", "red", "blue"))

dev.off()
