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
png(filename = "plot2.png", width=480, height=480)

#plot the line graph (type = l)
plot(df$Date_time, df$Global_active_power,  type ="l", xlab= "", ylab="Global Active Power (kilowatts)")

# end plot to image..
dev.off()