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
png("plot3.png", width = 480, height = 480)

# Create the base plot with the first sub-metering (black line)
plot(sub_data$Datetime, sub_data$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")

# Add lines for the other two sub-meterings
lines(sub_data$Datetime, sub_data$Sub_metering_2, col = "red")
lines(sub_data$Datetime, sub_data$Sub_metering_3, col = "blue")

# Add the legend in the top right corner
legend("topright", 
       col = c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, 
       lwd = 1)

# Close the PNG device
dev.off()