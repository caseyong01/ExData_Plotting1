datafile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- datafile[datafile$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
y<-subsetdata[,"Global_active_power"]
plot(datetime, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png")
dev.off()
