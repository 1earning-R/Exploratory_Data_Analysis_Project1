read_HPC_bydate <- function(firstdate=as.Date("2007-02-01"),
                            lastdate=as.Date("2007-02-02"),
                            filename="./household_power_consumption.txt"){
  ## TRY TO CONVERT INPUTS TO DATE IF NECESSARY
  if(!class(firstdate)=="Date") {firstdate <- as.Date(firstdate)}
  if(!class(lastdate)=="Date") {lastdate <- as.Date(lastdate)}
  
  ## SWITCH FIRST AND LAST DATE IF NECESSARY
  if (firstdate > lastdate){
    placeholder <- firstdate
    firstdate <- lastdate
    lastdate <- placeholder
  }
  ## CALCULATE LINES TO SKIP TO GET TO FIRST DATE
  ## THE FIRST DATA WAS TAKEN DECEMBER 16 2006
  ## 396 OBSERVATIONS WERE MADE DECEMBER 16 2006
  ## 1440 WERE MADE EVERY OTHER DAY
  start <- as.Date("2006-12-16")
  days_to_first <- firstdate-start
  skip_num <- 1440*(days_to_first-1)+397
  ## CALCULATE LINES TO READ
  read_num <- 1440*(lastdate - firstdate + 1)
  
  ## READ DATA
  var_names <- c("Date","Time","Global_Active_Power","Global_Reactive_Power",
                 "Voltage","Global_Intensity","Sub_metering_1",
                 "Sub_metering_2","Sub_metering_3")
  hpc_data <- read.table(filename,
                         skip = skip_num,
                         nrows = read_num,
                         sep = ";",
                         col.names = var_names)
  
  ## CONVERT DATE AND TIME TO POSIXlt VARIABLE
  Date_Time <- as.POSIXlt(paste(hpc_data$Date,hpc_data$Time),
                          format = "%d/%m/%Y %H:%M:%S")
  hpc_data <- cbind(Date_Time = Date_Time, hpc_data)
  
}