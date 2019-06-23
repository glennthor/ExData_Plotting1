# -----------------------------------------------------
# Read Data File..
# -----------------------------------------------------
df <- read.csv("household_power_consumption.txt", sep = ";", 
               na.strings = "?", stringsAsFactors = FALSE)

#converts column to date
df$Date   <- as.Date(df$Date , "%d/%m/%Y")

#remove rows not within the required dates.
df <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02" )

# -----------------------------------------------------
# Plotting..
# -----------------------------------------------------

#plot to image file with dimensions.
png(filename = "plot1.png", width=480, height=480)

#plot the histogram..
hist(df$Global_active_power, col="red", main = "Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

# end plot to image..
dev.off()