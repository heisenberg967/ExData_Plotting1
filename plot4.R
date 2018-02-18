plot4<- function(){
  ##reading text file
  data_set<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
  
  ## Column with merged date & time
  merged_dt <- strptime(paste(data_set$Date, data_set$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  data_set <- cbind(data_set, merged_dt)
  
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
  
  ## plotting energy sub meter vs date&time
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  with(data_sub, plot(merged_dt, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
  with(data_sub, plot(merged_dt, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
  with(data_sub, plot(merged_dt, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
  lines(data_sub$merged_dt, data_sub$Sub_metering_2,type="l", col= "red")
  lines(data_sub$merged_dt, data_sub$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
  with(data_sub, plot(merged_dt, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
  dev.off()
  
}