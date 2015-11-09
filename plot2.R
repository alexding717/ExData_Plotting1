# This is the R script for plot2

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

# plot the graph
png(file = "plot2.png")
with(electricData2D, plot(Time, Global_active_power, type = "l", xlab = "",
                          ylab = "Global Active Power (kilowatts)"))
dev.off()