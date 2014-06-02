data <- read.table('household_power_consumption.txt', 
                   sep=';', 
                   header=TRUE,
                   na.strings = '?',
                   stringsAsFactors=FALSE,
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'),]
png('ExData_Plotting1/plot1.png', width = 480, height = 480)
hist(data[,3], col="red", main='Global Active Power', xlab="Global Active Power (kilowatts)")
dev.off()

