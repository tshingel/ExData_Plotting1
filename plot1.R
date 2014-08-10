# clean working directory
rm(list = ls())

power.dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

## subset data to include only relevant dates
sub <- power.dat[power.dat$Date %in% c("1/2/2007", "2/2/2007"), ]

## convert to numeric since it was read as character 
gap <- as.numeric(sub$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(gap, col = "red",  main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()