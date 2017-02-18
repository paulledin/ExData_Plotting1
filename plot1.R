#Reproduce Plot 1

powerconsumption <- read.table(".\\data\\household_power_consumption.txt", header=TRUE, 
                               sep=";", stringsAsFactors=FALSE, na.strings="?")

powerconsumption$Date <- as.Date(powerconsumption$Date, format="%d/%m/%Y")
powerconsumption <- powerconsumption[(powerconsumption$Date=="2007-02-01" |
                                          powerconsumption$Date=="2007-02-02"),]

png(file="plot1.png", width = 480, height = 480)
hist(powerconsumption$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="Red")
dev.off()