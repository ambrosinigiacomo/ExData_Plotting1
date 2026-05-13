# Set locale to English
Sys.setlocale("LC_TIME", "English")

# Read and subset the dataset
file_name <- "household_power_consumption.txt"
full_data <- read.table(file_name, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
sub_data <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the Date and Time variables to Date/Time classes (POSIXlt/POSIXct)
datetime_str <- paste(sub_data$Date, sub_data$Time)
sub_data$Datetime <- strptime(datetime_str, format = "%d/%m/%Y %H:%M:%S")

# Open PNG device
png("plot2.png", width = 480, height = 480)

# Create the line plot (type = "l")
plot(sub_data$Datetime, sub_data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# Close the PNG device
dev.off()