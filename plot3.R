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
# Transforming Data..
# -----------------------------------------------------
#add a new column to combine date and time..
df$Date_time <- strptime(paste(df$Date,df$Time), "%Y-%m-%d %H:%M:%S")

# -----------------------------------------------------
# Plotting..
# -----------------------------------------------------
#plot to image file with dimensions.
png(filename = "plot3.png", width=480, height=480)

# Plot the 3 series of data..
with(df, plot(Date_time,   Sub_metering_1, type ="l", xlab= "", ylab="Energy sub metering"))
with(df, points(Date_time, Sub_metering_2, type ="l", col="red"))
with(df, points(Date_time, Sub_metering_3, type ="l", col="blue"))

# Set the legend..
legend("topright", col = c("black","red","blue"), 
       lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# end plot to image..
dev.off()