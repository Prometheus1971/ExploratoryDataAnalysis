#Plot3.R
library(dplyr)

#Function to Load the house hold power data and create Plot3
makePlot4<- function(){
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
  
  #create 4 panel plot
  par(mfcol=c(2,2))
  
  #First plot of GLOBAL ACTIVE POWER 
  plot(strptime(targetDays$TimeStamp,"%Y-%m-%d %H:%M:%S"), targetDays$Global_active_power, type="l",xlab="",ylab="Global Active Power (Kilowatts)")
  
  #Second plot of ENERGY SUB-METERING
  plot(strptime(targetDays$TimeStamp,"%Y-%m-%d %H:%M:%S"), targetDays$Sub_metering_1, type="l",yaxt="n",xlab="",ylab="Energy Sub Metering")
  #Customize Y axis
  at1<- seq(from = 0, to=30, by=10)
  axis(side= 2, at=at1, las=2,hadj=0.9)
  lines(strptime(targetDays$TimeStamp,"%Y-%m-%d %H:%M:%S"),targetDays$Sub_metering_2, type="l", col="red")
  
  lines(strptime(targetDays$TimeStamp,"%Y-%m-%d %H:%M:%S"),targetDays$Sub_metering_3, type="l", col="blue")
  
  legend("topright", lty= 1, col = c("Black", "red", "blue"),cex=.70, legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #Third plot of VOLTAGE
  plot(strptime(targetDays$TimeStamp,"%Y-%m-%d %H:%M:%S"), targetDays$Voltage, type="l",yaxt="n",xlab="datetime",ylab="Voltage")
  at2<- seq(from=234, to=246, by=4)
  axis(side= 2, at=at2, las=2,hadj=0.9)
  #Fourth plot of GLOBAL REACTIVE POWER
  
  plot(strptime(targetDays$TimeStamp,"%Y-%m-%d %H:%M:%S"), targetDays$Global_reactive_power, type="l",yaxt="n",xlab="datetime",ylab="Global Reactive Power")
  #Customize the Y Axis
  at<- seq(from=0, to =max(targetDays$Global_reactive_power), by=.10)
  axis(side = 2, at= at, las=2, hadj=0.9)
  #mtext(text="", side=2,line=4)
}



