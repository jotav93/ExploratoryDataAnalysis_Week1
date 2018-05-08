#set local english
Sys.setlocale("LC_ALL","English")

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
png(filename ="plot4.png", width = 480, height = 480, units = "px")
#create plot
par(mfrow = c(2,2))
#plot 1
plot(sub_df$DateTime, sub_df$Global_active_power, type = 'l', xlab = "", ylab = "Global active power (kilowatts)")
#plot 2
plot(sub_df$DateTime, sub_df$Voltage, type = 'l', xlab = "datetime", ylab = "Voltage")

#plot 3
plot(sub_df$DateTime, sub_df$Sub_metering_1, type = 'l', col = "black",xlab = "", ylab = "Energy sub metering")
lines(sub_df$DateTime, sub_df$Sub_metering_2, col = "red")
lines(sub_df$DateTime, sub_df$Sub_metering_3, col = "blue")
legend(x="topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1))

#plot 4 
plot(sub_df$DateTime, sub_df$Global_reactive_power, type = 'l', xlab = "datetime", ylab = "Global_reactive_power")

#turn off device
dev.off()

print("Finished")




