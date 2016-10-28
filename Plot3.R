#Plot3.R

#Function to Load the house hold power data and create Plot3
makePlot3<- function(){
  power<- read.csv("power.txt",sep=";",header=TRUE,na.strings ="?", stringsAsFactors = FALSE)
  
  #Convert the Date column to a date type
  power$Date<- as.Date(power$Date,"%d/%m/%Y")
  
  #get the target dates
  targetDays<- power[power$Date =="2007-02-01" | power$Date=="2007-02-02",]
  #make Global Active Power a numeric type
  targetDays$Global_active_power<- as.numeric(as.character(targetDays$Global_active_power))
  targetDays$Global_reactive_power<- as.numeric(as.character(targetDays$Global_reactive_power))
  targetDays$Voltage<- as.numeric(as.character(targetDays$Voltage))
  
  targetDays$Sub_metering_1<- as.numeric(as.character(targetDays$Sub_metering_1))
  targetDays$Sub_metering_2<- as.numeric(as.character(targetDays$Sub_metering_2))
  targetDays$Sub_metering_3<- as.numeric(as.character(targetDays$Sub_metering_3))
  #create timestamp variable
  targetDays$TimeStamp<- paste(targetDays$Date,targetDays$Time)
  
  #Create Plot of timestamp to sub metering 1
  plot(strptime(targetDays$TimeStamp,"%Y-%m-%d %H:%M:%S"), targetDays$Sub_metering_1, type="l",xlab="",ylab="Energy Sub Metering")
  
  lines(strptime(targetDays$TimeStamp,"%Y-%m-%d %H:%M:%S"),targetDays$Sub_metering_2, type="l", col="red")
  
  
  
}