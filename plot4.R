# R Script for Plot 4

# Read in data and create a filtered dataset
datafeed <- read.table("household_power_consumption.txt", header=F, sep=";", colClasses = "character")
dataset <- datafeed[grepl("^[12]/2/2007", datafeed[,1]),]
      dataset <- cbind(strptime(paste(dataset[,1], dataset[,2]), format="%d/%m/%Y %H:%M:%S"), dataset[,-c(1,2)])
      names(dataset) <- c("Date/Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Create the graphs
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Create plot 1
plot(dataset$Date, as.numeric(dataset$Global_active_power), pch=NA, main="", ylab = "Global Active Power", xlab = "")
      lines(dataset$Date, as.numeric(dataset$Global_active_power))

# Create plot 2
plot(dataset$Date, as.numeric(dataset$Voltage), pch=NA, main="", ylab = "Voltage", xlab = "datetime")
      lines(dataset$Date, as.numeric(dataset$Voltage))

# Create plot 3
plot(dataset$Date, as.numeric(dataset$Sub_metering_1), pch=NA, main="", ylab = "Energy sub metering", xlab = "")
      lines(dataset$Date, as.numeric(dataset$Sub_metering_1), col="black")
      lines(dataset$Date, as.numeric(dataset$Sub_metering_2), col="red")
      lines(dataset$Date, as.numeric(dataset$Sub_metering_3), col="blue")
      # Create the legend for plot 3
      legend("topright",
            c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            lty=c(1,1,1),
            lwd=c(1,1,1),
            col=c("black", "red", "blue"),
            bty="n")#Removes the border around the legend

# Create plot 4
plot(dataset$Date, as.numeric(dataset$Global_reactive_power), pch=NA, main="", ylab = "Global_reactive_power", xlab = "datetime")
      lines(dataset$Date, as.numeric(dataset$Global_reactive_power))

dev.off()