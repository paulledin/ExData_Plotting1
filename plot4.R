#Reproduce Plot 4

powerconsumption <- read.table(".\\data\\household_power_consumption.txt", header=TRUE, 
                               sep=";", stringsAsFactors=FALSE, na.strings="?")

powerconsumption$Date <- as.Date(powerconsumption$Date, format="%d/%m/%Y")
powerconsumption <- powerconsumption[(powerconsumption$Date=="2007-02-01" |
                                          powerconsumption$Date=="2007-02-02"),]

powerconsumption$Timestamp = strptime(paste(powerconsumption$Date, powerconsumption$Time), 
                                      format = "%Y-%m-%d %H:%M:%S")

png(file="plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(powerconsumption$Timestamp, powerconsumption$Global_active_power, type="l",
     ylab = "Global Active Power", xlab="")

plot(powerconsumption$Timestamp, powerconsumption$Voltage, type="l",
     ylab = "Voltage", xlab="datetime")

plot(powerconsumption$Timestamp, powerconsumption$Sub_metering_1, type="l", 
     ylim=range( c(powerconsumption$Sub_metering_1, powerconsumption$Sub_metering_2, powerconsumption$Sub_metering_3) ),
     ylab="Energy sub metering", xlab="")
lines(powerconsumption$Timestamp,powerconsumption$Sub_metering_2, col="Red")
lines(powerconsumption$Timestamp,powerconsumption$Sub_metering_3, col="Blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("Black", "Red","Blue"))

plot(powerconsumption$Timestamp, powerconsumption$Global_reactive_power, type="l",
     ylab = "Global_reactive_power", xlab="datetime")

dev.off()
