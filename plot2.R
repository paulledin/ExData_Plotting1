#Reproduce Plot 2

powerconsumption <- read.table(".\\data\\household_power_consumption.txt", header=TRUE, 
                               sep=";", stringsAsFactors=FALSE, na.strings="?")

powerconsumption$Date <- as.Date(powerconsumption$Date, format="%d/%m/%Y")
powerconsumption <- powerconsumption[(powerconsumption$Date=="2007-02-01" |
                                          powerconsumption$Date=="2007-02-02"),]

powerconsumption$Timestamp = strptime(paste(powerconsumption$Date, powerconsumption$Time), 
                                      format = "%Y-%m-%d %H:%M:%S")

png(file="plot2.png", width = 480, height = 480)

plot(powerconsumption$Timestamp, powerconsumption$Global_active_power, type="l",
     ylab = "Global Active Power (kilowatts)", xlab="datetime")

dev.off()
