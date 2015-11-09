# This is the R script for plot1

# Load the data (the file should be under the current working directory)
electricData <- read.table("household_power_consumption.txt", header = T, sep = ";",
                           na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))

# Convert the column Date to the date class
electricData$Date <- as.Date(electricData$Date, "%d/%m/%Y")

# Subset the data of two days from 2007-02-01 to 2007-02-02
electricData2D <- subset(electricData, Date == "2007-02-01" | Date == "2007-02-02")

# Combine the date and time, and store to the column Time as POSIXlt class
electricData2D$Time <- strptime(paste(electricData2D$Date, electricData2D$Time), 
                                format = "%Y-%m-%d %H:%M:%S")

# Plot the graph
png(file = "plot1.png")
hist(electricData2D$Global_active_power, col = "red", main = "Global Active Power",
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
dev.off()