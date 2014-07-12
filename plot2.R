# R Script for Plot 2

# Read in data and create a filtered dataset
datafeed <- read.table("household_power_consumption.txt", header=F, sep=";", colClasses = "character")
dataset <- datafeed[grepl("^[12]/2/2007", datafeed[,1]),]
      dataset <- cbind(strptime(paste(dataset[,1], dataset[,2]), format="%d/%m/%Y %H:%M:%S"), dataset[,-c(1,2)])
      names(dataset) <- c("Date/Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Create the graph
png(filename="plot2.png", width=480, height=480)
      plot(dataset$Date, as.numeric(dataset$Global_active_power), pch=NA, main="", ylab = "Global Active Power (kilowatts)", xlab = "")
      lines(dataset$Date, as.numeric(dataset$Global_active_power))
      dev.off()