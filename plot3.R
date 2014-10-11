library(dplyr)
library(lubridate)

d <- read.table(
  file='exdata_data_household_power_consumption\\household_power_consumption.txt', 
  sep=';', 
  na.strings="?", 
  header=TRUE, 
  colClasses=c("character","character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
  stringsAsFactors=FALSE
);

d1 <- (filter(d, d$Date == '1/2/2007' | d$Date == '2/2/2007'));

## Plot 3 -- three line

png(filename="plot3.png", width=480, height=480, bg="white");

plot(d3$aat, d3$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(d3$aat, d3$Sub_metering_2, type="l", col="red")
lines(d3$aat, d3$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)

dev.off();
