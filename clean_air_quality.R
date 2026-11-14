# Clean one year of daily air quality measurements.
# file_path: path to a raw air quality CSV file.
# ozone_unit: output unit for ozone, either "ppm" (default) or "ppb".
# Returns a data frame with one row per observed date and daily
# concentrations for CO (ppm), PM2.5 (ug/m3 LC), and ozone (chosen unit).
clean_air_quality <- function(file_path, ozone_unit = c("ppm", "ppb")) {
  ozone_unit <- match.arg(ozone_unit)
  
  raw <- read.csv(file_path, check.names = FALSE, na.strings = c("", "NA"))
  
  # Remove exact duplicates before changing any measurements.
  raw <- unique(raw)
  
  daily <- data.frame(
    date = as.Date(raw$Date, format = "%m/%d/%Y"),
    co = raw[["Daily Max 8-hour CO Concentration"]],
    pm25 = raw[["Daily Mean PM2.5 Concentration"]],
    o3 = raw[["Daily Max 8-hour Ozone Concentration"]]
  )
  
  # Correct negative readings before averaging. Keep missing values as NA.
  pollutants <- c("co", "pm25", "o3")
  for (pollutant in pollutants) {
    daily[[pollutant]] <- pmax(daily[[pollutant]], 0)
  }
  
  # Calculate the mean of available readings for each pollutant and date.
  # If every reading for a pollutant is missing that day, return NA.
  daily_mean <- function(x) {
    if (all(is.na(x))) return(NA_real_)
    mean(x, na.rm = TRUE)
  }
  
  result <- aggregate(
    daily[pollutants],
    by = list(date = daily$date),
    FUN = daily_mean
  )
  
  if (ozone_unit == "ppb") {
    result$o3 <- result$o3 * 1000
  }
  
  result[order(result$date), ]
}