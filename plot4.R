#Reading the file, getting only from 1 February 2007 until 2 february 2017
epc <- read.table("household_power_consumption.txt", sep = ";", skip = 66636, header = TRUE, nrows = 2880)

#getting the header
header <- as.vector(read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 1))

#assign the header to the subset data
colnames(epc) <- colnames(header)

#creating new variable by combining variable Date and Time to be a posixlt type)
epc$newtime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y%H:%M:%S")

#open the device png and set dimension
png(file = "plot4.png", width = 480, height = 480)

#set the plot to be 2x2
par(mfrow = c(2,2))

#plot the corresponding data:
#1. Global active power vs time
#2. Voltage vs time
#3. Energy sub metering 1,2,3 vs time
#$. Global reactive power vs time
with (epc,{
  plot(newtime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(newtime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(newtime, Sub_metering_1, type ="l", ylab = "Energy sub metering", xlab = "" )
  lines(newtime, Sub_metering_2, col ="red", type ="l")
  lines(newtime, Sub_metering_3, col ="blue", type ="l")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
  plot(newtime, Global_reactive_power, type ="l", ylab = "Global_reactive_power", xlab = "datetime" )
})

#close device
dev.off()
