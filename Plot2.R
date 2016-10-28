#Plot2.R

#Function to Load the house hold power data and create Plot2
makePlot2<- function(){
  power<- read.csv("power.txt",sep=";",header=TRUE,na.strings ="?", stringsAsFactors = FALSE)
  
  #Convert the Date column to a date type
  power$Date<- as.Date(power$Date,"%d/%m/%Y")
  
  #get the target dates
  targetDays<- power[power$Date =="2007-02-01" | power$Date=="2007-02-02",]
  #make Global Active Power a numeric type
  targetDays$Global_active_power<- as.numeric(as.character(targetDays$Global_active_power))
  
  #create timestamp variable
  targetDays$TimeStamp<- paste(targetDays$Date,targetDays$Time)
  
  #Create Plot 2
 plot(strptime(targetDays$TimeStamp,"%Y-%m-%d %H:%M:%S"), targetDays$Global_active_power, type="l",xlab="",ylab="Global Active Power (Kilowatts)")
}