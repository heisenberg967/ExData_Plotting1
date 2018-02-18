plot1<- function(){
  ##reading text file
  data_set<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
  
  ##defining classes of columns
  data_set$Date<-as.Date(data_set$Date,format="%d/%m/%Y")
  data_set$Time <- format(data_set$Time, format="%H:%M:%S")
  data_set$Global_active_power <- as.numeric(data_set$Global_active_power)
  data_set$Global_reactive_power <- as.numeric(data_set$Global_reactive_power)
  data_set$Voltage <- as.numeric(data_set$Voltage)
  data_set$Global_intensity <- as.numeric(data_set$Global_intensity)
  data_set$Sub_metering_1 <- as.numeric(data_set$Sub_metering_1)
  data_set$Sub_metering_2 <- as.numeric(data_set$Sub_metering_2)
  data_set$Sub_metering_3 <- as.numeric(data_set$Sub_metering_3)
  
  ## subsetting required data
  data_sub <- subset(data_set, Date == "2007-02-01" | Date =="2007-02-02")
  
  ## plotting histogram of global active power for aforementioned dates
  png("plot1.png", width=480, height=480)
  hist(data_sub$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
  dev.off()
}