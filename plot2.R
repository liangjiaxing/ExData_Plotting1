data <- read.table('household_power_consumption.txt', 
                   sep=';', 
                   header=TRUE,
                   na.strings = '?',
                   stringsAsFactors=FALSE,
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'),]
data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

png('ExData_Plotting1/plot2.png', width = 480, height = 480)

plot(data$Time, data[,3], type = "l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
