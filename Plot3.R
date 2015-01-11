datafile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- datafile[datafile$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
y1<-subsetdata[,"Sub_metering_1"]
y2<-subsetdata[,"Sub_metering_2"]
y3<-subsetdata[,"Sub_metering_3"]
png("plot3.png") ## --open graphic device

## --- Graph plotting --------
with(subsetdata, {
    plot(datetime, y1, type="l", xlab="", ylab="Energy sub metering")
    lines(datetime, y2,col='Red')
    lines(datetime, y3,col='Blue')
})

## ---- print legend ------
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
