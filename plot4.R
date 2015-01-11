datafile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- datafile[datafile$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot4.png") ## --open graphic device
par(mfrow=c(2,2))## setup 2 by 2 plotting area

## ---- Plot 1 - Global Active Power Against Date/Time
y<-subsetdata[,"Global_active_power"]
plot(datetime, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")


## ---- Plot 2 - Voltage against Date/Time
y0<-subsetdata[,"Voltage"]
plot(datetime, y0, type="l", xlab="datetime", ylab="Voltage")

## ---- Plot 3 - Energy sub meetering against Date/Time

y1<-subsetdata[,"Sub_metering_1"]
y2<-subsetdata[,"Sub_metering_2"]
y3<-subsetdata[,"Sub_metering_3"]

## --- Graph plotting --------
with(subsetdata, {
    plot(datetime, y1, type="l", xlab="", ylab="Energy sub metering")
    lines(datetime, y2,col='Red')
    lines(datetime, y3,col='Blue')
})

## ---- print legend ------
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## --- Plot 4 - Global Reactive Power against Datetime
y4<-subsetdata[,"Global_reactive_power"]
plot(datetime, y4, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()




