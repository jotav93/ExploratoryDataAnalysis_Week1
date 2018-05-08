#import the data
df <- read.csv("household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE)
#add correct column formats
df$Voltage<- as.numeric(df$Voltage)
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_intensity <- as.numeric(df$Global_intensity)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(as.POSIXct(df$DateTime, 'GMT'))
#filter the data
sub_df <- df[(df$Date >= "2007-02-01") & (df$Date <= "2007-02-02"),]
#remove from memory previous df
rm(df)
#create device
png(filename ="plot3.png", width = 480, height = 480, units = "px")
#create plot
plot(sub_df$DateTime, sub_df$Sub_metering_1, type = 'l', col = "black", ylab = "Energy sub metering")
lines(sub_df$DateTime, sub_df$Sub_metering_2, col = "red")
lines(sub_df$DateTime, sub_df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1))
#turn off device
dev.off()