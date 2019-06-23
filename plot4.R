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
png(filename = "plot4.png", width=480, height=480)

# Set layout to 2 rows by 2 columns
par(mfrow = c(2,2))

# 1st plot on top-left
with(df,plot(Date_time, Global_active_power, type ="l", xlab= "", ylab="Global Active Power (kilowatts)"))

# 2nd plot on top-right
with(df,plot(Date_time, Voltage, type ="l", xlab= "datetime"))

# 3rd plot on bottom left.
with(df,plot(Date_time,   Sub_metering_1, type ="l", xlab= "", ylab="Energy sub metering"))
with(df,points(Date_time, Sub_metering_2, type ="l", col="red"))
with(df,points(Date_time, Sub_metering_3, type ="l", col="blue"))
legend("topright", col = c("black","red","blue"), lty=1, bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# 4th plot on bottom right
with(df,plot(Date_time, Global_reactive_power, type ="l", xlab= "datetime"))

# end plot to image..
dev.off()