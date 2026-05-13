# Set locale to English
Sys.setlocale("LC_TIME", "English")

# Read and subset the dataset
file_name <- "household_power_consumption.txt"
full_data <- read.table(file_name, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
sub_data <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the Date and Time variables
datetime_str <- paste(sub_data$Date, sub_data$Time)
sub_data$Datetime <- strptime(datetime_str, format = "%d/%m/%Y %H:%M:%S")

# Open PNG device
png("plot4.png", width = 480, height = 480)

# Set graphical parameters to a 2x2 grid (filled row by row)
par(mfrow = c(2, 2))

# --- Top-left plot (similar to plot2) ---
plot(sub_data$Datetime, sub_data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

# --- Top-right plot ---
plot(sub_data$Datetime, sub_data$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

# --- Bottom-left plot (similar to plot3) ---
plot(sub_data$Datetime, sub_data$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(sub_data$Datetime, sub_data$Sub_metering_2, col = "red")
lines(sub_data$Datetime, sub_data$Sub_metering_3, col = "blue")
# Note: bty = "n" removes the box/border from the legend as required
legend("topright", 
       col = c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, 
       lwd = 1, 
       bty = "n")

# --- Bottom-right plot ---
plot(sub_data$Datetime, sub_data$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

# Close the PNG device
dev.off()