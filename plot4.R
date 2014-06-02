data <- read.table('household_power_consumption.txt', 
                   sep=';', 
                   header=TRUE,
                   na.strings = '?',
                   stringsAsFactors=FALSE,
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'),]
data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

png('ExData_Plotting1/plot4.png', width = 480, height = 480)

par(mfrow = c(2, 2))

plot(data$Time, data[,3], type = "l", xlab="", ylab="Global Active Power")
plot(data$Time, data$Voltage, type = "l", xlab="datetime", ylab="Voltage")

plot(data$Time, data$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col='red', type='l')
lines(data$Time, data$Sub_metering_3, col='blue', type='l')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1, bty="n")

plot(data$Time, data$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

