## reading data into r named maindata
maindata <- read.table("household_power_consumption.txt", header = TRUE, 
                       sep = ";", stringsAsFactors = FALSE, na.strings = "?")

## subset according to dates required
plotdata <- filter(maindata, Date == '1/2/2007' | Date == "2/2/2007")

## Convert Date  to Date format
plotdata$Date <- as.Date(plotdata$Date, format = "%d/%m/%Y")
 
## open .png 
png(filename = "plot1.png", width = 480, height = 480)

## create histogram
hist(plotdata$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")

## Closing our device to generate our plot.png
dev.off()
