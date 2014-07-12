# R Script for Plot 1

# Read in data and create a filtered dataset
datafeed <- read.table("household_power_consumption.txt", header=F, sep=";", colClasses = "character")
dataset <- datafeed[grepl("^[12]/2/2007", datafeed[,1]),]
      dataset <- cbind(strptime(paste(dataset[,1], dataset[,2]), format="%d/%m/%Y %H:%M:%S"), dataset[,-c(1,2)])
      names(dataset) <- c("Date/Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Create the histogram
png(filename="plot1.png", width=480, height=480)
      hist(as.numeric(dataset$Global_active_power), col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
      dev.off()