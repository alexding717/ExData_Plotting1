# This is the R script for plot3

# Load the data, the file should be under the current working directory
electricData <- read.table("household_power_consumption.txt", header = T, sep = ";",
                           na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))

# Convert the column Date to Date class
electricData$Date <- as.Date(electricData$Date, "%d/%m/%Y")

# Subset the data of two days needed
electricData2D <- subset(electricData, Date == "2007-02-01" | Date == "2007-02-02")

# Combine the date and time, and store to the column Time as POSIXlt class
electricData2D$Time <- strptime(paste(electricData2D$Date, electricData2D$Time), 
                                format = "%Y-%m-%d %H:%M:%S")

# Plot the graph
png(file = "plot3.png")
with(electricData2D,{
    plot(Time, Sub_metering_1, type = "l", col = "black", xlab = "",
         ylab = "Energy sub metering")
    lines(Time, Sub_metering_2, col = "red")
    lines(Time, Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()