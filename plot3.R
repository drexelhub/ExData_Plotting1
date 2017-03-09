buildPlot3 <- function()
{
    library(data.table)
    df_full <- fread("household_power_consumption.txt", sep=";", colClasses=c("character"))
    df_subset <- subset(df_full, Date=='1/2/2007' | Date=='2/2/2007')[,c("Date", "Time", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]
    rm(df_full)
    df_subset$DateTime <- as.POSIXct(strptime(paste(df_subset$Date, df_subset$Time, sep=" "), format="%d/%m/%Y %T"))
    df_subset$Sub_metering_1 <- as.numeric(df_subset$Sub_metering_1)
    df_subset$Sub_metering_2 <- as.numeric(df_subset$Sub_metering_2)
    df_subset$Sub_metering_3 <- as.numeric(df_subset$Sub_metering_3)
    png("plot3.png", width=480, height=480)
    plot(df_subset$DateTime, df_subset$Global_active_power, axes=T, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    plot(df_subset$DateTime, df_subset$Sub_metering_1, axes=T, type="l", xlab="", ylab="Energy sub metering")
    lines(df_subset$DateTime, df_subset$Sub_metering_2, col="red")
    lines(df_subset$DateTime, df_subset$Sub_metering_3, col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))
    dev.off();
    
}