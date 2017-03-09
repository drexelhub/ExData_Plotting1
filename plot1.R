buildPlot1 <- function()
    {
        library(data.table)
        df_full <- fread("household_power_consumption.txt", sep=";", colClasses=c("character"))
        df_subset <- subset(df_full, Date=='1/2/2007' | Date=='2/2/2007')[,c("Date", "Time", "Global_active_power")]
        rm(df_full)
        df_trans <- transform(df_subset, Date=as.Date(Date, format="%d/%m/%Y"),
                                         Time = as.POSIXct(strptime(Time, format="%T")),
                                         Global_active_power = as.numeric(Global_active_power))
        png("plot1.png", width=480, height=480, units="px")
        hist(df_trans$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", ylim=c(0,1200))
        dev.off()
    }