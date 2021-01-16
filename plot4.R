## reading data into r named maindata
maindata <- read.table("household_power_consumption.txt", header = TRUE, 
                       sep = ";", stringsAsFactors = FALSE, na.strings = "?")

## subset according to dates required
plotdata <- filter(maindata, Date == '1/2/2007' | Date == "2/2/2007")

## Convert Date to Date format
plotdata$Date <- as.Date(plotdata$Date, format = "%d/%m/%Y")

## Convert Date and Time to a new combined DateTime format
plotdata$DateTime <- strptime(paste(plotdata$Date, plotdata$Time), format = "%Y-%m-%d %H:%M:%S")
plotdata$DateTime <- as.POSIXct(plotdata$DateTime)

## open .png 
png(filename = "plot4.png", width = 480, height = 480)

## create 4 different plots togeter
par(mfcol = c(2,2))
with(plotdata, plot(Global_active_power ~ DateTime, 
                    ylab = "Global Active Power (kilowatts)", xlab = "", 
                    type = "l"))
with(plotdata, plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab = ""))
with(plotdata, lines(Sub_metering_2 ~ DateTime, col = "Red"))
with(plotdata, lines(Sub_metering_3 ~ DateTime, col = "Blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col = c("black", "red", "blue"))
with(plotdata, plot(Voltage ~ DateTime, xlab = "datetime", ylab = "Voltage", type = "l"))
with(plotdata, plot(Global_reactive_power ~ DateTime, xlab = "datetime", type = "l"))


## Closing our device to generate our plot.png
dev.off()
