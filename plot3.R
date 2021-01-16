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

## creating our plots
with(subdata, plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab = ""))
with(subdata, lines(Sub_metering_2 ~ DateTime, col = "Red"))
with(subdata, lines(Sub_metering_3 ~ DateTime, col = "Blue"))