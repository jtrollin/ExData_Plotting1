
load_data <- function() {
  dir.create("data")
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data/consumption.zip", method = "curl")
  unzip("data/consumption.zip", exdir = "data")
  
  setClass('convertDate')
  setAs("character","convertDate", function(from) as.Date(from, format="%d/%m/%Y"))
  setClass('cleanNumber')
  setAs("character","cleanNumber", function(from) if(from == "?"){NA} else {as.numeric(from)})
  
  consumption <- read.csv("data/household_power_consumption.txt", 
                   colClasses = c("convertDate","character","cleanNumber","cleanNumber","cleanNumber",
                                  "cleanNumber","cleanNumber","cleanNumber","cleanNumber"), 
                   sep=";")
  
  consumption <- subset(consumption, Date >= "2007-02-01" & Date <= "2007-02-02")
  consumption["datetime"] <- as.POSIXct(paste(consumption$Date, consumption$Time))
  consumption
}



