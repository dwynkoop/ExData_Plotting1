plot1 <- function() {
  
  ## Import the data 
  electric <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
  
  ## Append a timestamp from concatenating the date and time 
  electric$Timestamp <- as.POSIXct(strptime(paste(electric$Date, electric$Time), "%d/%m/%Y %H:%M:%S"))
  
  ## Subset the data to 2/1/2007 and 2/2/2007
  electric <- subset(electric, electric$Timestamp >= '2007-02-01 00:00:00' & electric$Timestamp < '2007-02-03 00:00:00')
  
  ## Convert columns to numeric so they can be plotted 
  electric$Global_active_power <- as.numeric(as.character(electric$Global_active_power))
  electric$Global_reactive_power <- as.numeric(as.character(electric$Global_reactive_power))
  electric$Sub_metering_1 <- as.numeric(as.character(electric$Sub_metering_1))
  electric$Sub_metering_2 <- as.numeric(as.character(electric$Sub_metering_2))
  electric$Sub_metering_3 <- as.numeric(as.character(electric$Sub_metering_3))
  electric$Voltage <- as.numeric(as.character(electric$Voltage)) 

  
  ## Create the histogram as a .png file 
  png(file="plot1.png")
  hist(electric$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
  
}