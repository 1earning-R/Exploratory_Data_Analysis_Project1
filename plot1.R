## SOURCE read_HPC_bydate.R to GLOBAL ENVIRONMENT
## RUN FUNCTION IF hpc_data DOES NOT EXIST
source("./read_HPC_bydate.R")
if (!exists("hpc_data")) {hpc_data <- read_HPC_bydate()}

## PLOT HISTOGRAM
hist(hpc_data$Global_Active_Power,
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power",
     col = "red")