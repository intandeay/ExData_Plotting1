#Reading the file, getting only from 1 February 2007 until 2 february 2017
epc <- read.table("household_power_consumption.txt", sep = ";", skip = 66636, header = TRUE, nrows = 2880)

#getting the header
header <- as.vector(read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 1))

#assign the header to the subset data
colnames(epc) <- colnames(header)

#creating new variable by combining variable Date and Time to be a Posixlt type)
epc$newtime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y%H:%M:%S")

#open the device png and set dimension
png(file = "plot3.png", width = 480, height = 480)

#plot energy sub metering 1, 2, 3
plot(epc$newtime, epc$Sub_metering_1, type ="l", ylab = "Energy sub metering", xlab = "" )
lines(epc$newtime, epc$Sub_metering_2, col ="red", type ="l")
lines(epc$newtime, epc$Sub_metering_3, col ="blue", type ="l")

#add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#close device
dev.off()