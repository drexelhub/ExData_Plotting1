buildPlot2 <- function()
    {
        library(data.table)
    
        df_full <- fread("household_power_consumption.txt", sep=";", colClasses=c("character"))
        
        df_subset <- subset(df_full, Date=='1/2/2007' | Date=='2/2/2007')[,c("Date", "Time", "Global_active_power")]
        rm(df_full)
        
        df_subset$DateTime <- as.POSIXct(strptime(paste(df_subset$Date, df_subset$Time, sep=" "), format="%d/%m/%Y %T"))

        png("plot2.png", width=480, height=480)
        
        plot(df_subset$DateTime, df_subset$Global_active_power, axes=T, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        
        dev.off();

    }