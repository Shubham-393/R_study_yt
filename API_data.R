library(httr)
library(xml2)
library(XML)
library(jsonlite)

library(readr) # if we have url of csv

api_url <- "https://www.data.gov.in/apis"
api_key <- "579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b"

response <- GET(api_url,
                add_headers(Authorization = paste("Bearer",api_key)))

if (status_code(response) == 200){
  print("Request Successful ! ")
} else{
  print(paste("Failed", status_code(response)))
}
data<- content(response, "parsed")
data

#Next TRY
# Extract specific nodes
records <- xml_find_all(parsed_xml, ".//record")  # Adjust the XPath query based on the XML structure

# Extract fields from the nodes
data <- lapply(records, function(record) {
  list(
    month = xml_text(xml_find_first(record, ".//month")),
    year = xml_text(xml_find_first(record, ".//year")),
    company = xml_text(xml_find_first(record, ".//company")),
    quantity = xml_text(xml_find_first(record, ".//quantity"))
  )
})

# Convert the list to a data frame
data_frame <- do.call(rbind, lapply(data, as.data.frame))
print(data_frame)


#CSV URL - readr
url <- "https://people.sc.fsu.edu/~jburkardt/data/csv/airtravel.csv"
data <- read.csv(url)
head(data)
data


library(DBI)
library(RMySQL)

# Connect to the database
con <- dbConnect(RMySQL::MySQL(),
                 dbname = "Rfam",
                 host = "mysql-rfam-public.ebi.ac.uk",
                 port = 4497,
                 user = "rfamro",
                 password = "")

# List tables
tables <- dbListTables(con)
print(tables)

# Query data
query_result <- dbGetQuery(con, "SELECT * FROM genome LIMIT 5")
print(query_result)
family <- dbGetQuery(con, "SELECT * FROM family LIMIT 5")
print(query_result)
class(family)
class(query_result)
str(query_result)
str(family)
# Write data
new_data <- data.frame(id = c(1, 2, 3), name = c("Alice", "Bob", "Charlie"))
dbWriteTable(con, "new_table", new_data, overwrite = TRUE)

# Disconnect
dbDisconnect(con)






