# clean working directory
rm(list = ls())

power.dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

## subset data to include only relevant dates
sub <- power.dat[power.dat$Date %in% c("1/2/2007", "2/2/2007"), ]

## convert to numeric since it was read as character 
gap <- as.numeric(sub$Global_active_power)

## create Date/Time variable
dt <- paste(sub$Date, sub$Time)
## convert to POSIXlt
x <- strptime(dt, "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(x, gap, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)")
plot(x, as.numeric(sub$Voltage),  type = "l", xlab = "datetime", ylab = "Voltage")
plot_colors <- c("black", "red", "blue")
plot(x, as.numeric(sub$Sub_metering_1), type = "l", xlab = NA, ylab = "Energy sub metering") 
lines(x, as.numeric(sub$Sub_metering_2), type = "l", col = "red")
lines(x, sub$Sub_metering_3, type = "l", col = "blue")
## create legend
legend("topright", names(sub)[7:9], cex=0.8, col=plot_colors, lwd=2, bty="n")
Global_reactive_power <- as.numeric(sub$Global_reactive_power)
plot(x, Global_reactive_power, type = "l", xlab = "datetime")
dev.off()