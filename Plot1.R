datafile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- datafile[datafile$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot1.png", height=480, width=480)
hist(as.numeric(subsetdata[,"Global_active_power"]), main="Global Active Power", col="red",xlab="Global Active Power (kilowatts)")
dev.off()