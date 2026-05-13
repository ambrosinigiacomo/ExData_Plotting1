# Set locale to English to ensure days of the week (if used) match Coursera's requirements
Sys.setlocale("LC_TIME", "English")

# Define file name (assuming it is already in the RStudio Project root directory)
file_name <- "household_power_consumption.txt"

# Read the full dataset 
# Note: missing values are coded as "?", so we use na.strings = "?"
full_data <- read.table(file_name, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Subset data for the required dates: 2007-02-01 and 2007-02-02
sub_data <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")

# Open PNG device with required dimensions (480x480 pixels is the default, but we specify it to be safe)
png("plot1.png", width = 480, height = 480)

# Create the histogram
hist(sub_data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# Close the PNG device to save the file
dev.off()