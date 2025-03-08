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
png(filename = "plot2.png", width = 480, height = 480)

## creating our plot
with(plotdata, plot(Global_active_power ~ DateTime, 
                   ylab = "Global Active Power (kilowatts)", xlab = "", 
                   type = "l"))

## Closing our device to generate our plot.png
dev.off()
