library(bigrquery, quietly = TRUE, warn.conflicts = FALSE)
library(tidyverse, quietly = TRUE)
library(kableExtra)
library(dplyr)

projectid <- '' # Meter aqui tu proyecto de GCP

#get_data <- "SELECT unique_key,	block, primary_type,description,	location_description, district, date, arrest, year, latitude, longitude FROM `bigquery-public-data.chicago_crime.crime` WHERE domestic=FALSE"
#chicago_crime <- query_exec(get_data, projectid, max_pages = Inf, use_legacy_sql = FALSE)

get10years <- "SELECT unique_key,	block, primary_type,description,	location_description, district, date, arrest, year, latitude, longitude FROM `bigquery-public-data.chicago_crime.crime` WHERE domestic=FALSE AND (year BETWEEN 2015 AND 2019)"
chicago_crime_10years <- query_exec(get10years, projectid, max_pages = Inf, use_legacy_sql = FALSE)

#write.csv(chicago_crime,"Datos/ChicagoCrime.csv", row.names = FALSE)
write.csv(chicago_crime_10years,"Datos/ChicagoCrime_10years.csv", row.names = FALSE)