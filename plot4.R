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


## Plot 1 - histogram


png(filename="plot4.png", width=480, height=480, bg="white");

par(mfrow=c(2,2));


##dev.off();

## Plot # 2 - Line 
# build date/time

d2 <- mutate(d1, at1 = paste(d1$Date, ' ', d1$Time));
d3 <- mutate(d2, aat = as.POSIXct(strptime(at1, format='%d/%m/%Y %H:%M:%S' )));

##png(filename="png2.png", width=480, height=480, bg="white");
plot( d3$aat, d3$Global_active_power, type="l", xlab="", ylab="Global Active Power")
##dev.off();

plot( d3$aat, d3$Voltage, type="l", xlab="datetime", ylab="Voltage")


## Plot 3 -- three line
plot(d3$aat, d3$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(d3$aat, d3$Sub_metering_2, type="l", col="red")
lines(d3$aat, d3$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, bty="n")

## Plot 4

plot(d3$aat, d3$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off();
