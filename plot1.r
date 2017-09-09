#Reading the file, getting only from 1 February 2007 until 2 february 2017
epc <- read.table("household_power_consumption.txt", sep = ";", skip = 66636, header = TRUE, nrows = 2880)

#getting the header
header <- as.vector(read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 1))

#assign the header to the subset data
colnames(epc) <- colnames(header)

#creating new variable by combining variable Date and Time to be a Posixlt type)
epc$newtime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y%H:%M:%S")

#open the device png and set dimension
png(file = "plot1.png", width = 480, height = 480)

#plot the histogram of global active power
hist(epc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

#close device
dev.off()