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

## Plot # 2 - Line 
# build date/time

d2 <- mutate(d1, at1 = paste(d1$Date, ' ', d1$Time));
d3 <- mutate(d2, aat = as.POSIXct(strptime(at1, format='%d/%m/%Y %H:%M:%S' )));

png(filename="Plot2.png", width=480, height=480, bg="white");
plot( d3$aat, d3$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off();
