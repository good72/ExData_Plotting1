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

png(filename="plot1.png", width=480, height=480, bg="white");

hist(
    as.numeric(d1$Global_active_power), 
    col='red', 
    main='Global Active Power', xlab='Global Active Power (kilowatts)'
    );

dev.off();




