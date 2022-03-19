library(dplyr)
source("loadData.R")
data <- load_data()

png("plot2.png", width=480,height=480)
plot(data$datetime, data$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab = "")
dev.off()
rm(list=ls())