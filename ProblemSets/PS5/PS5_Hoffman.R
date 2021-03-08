#Question 1
library(tidyverse)
library(rvest)
library(polite)
ntlparks <- read_html("https://en.wikipedia.org/wiki/List_of_national_parks_of_the_United_States")
ntlparks


ntlparks_table <- ntlparks %>%
  html_nodes("#mw-content-text > div.mw-parser-output > table:nth-child(23)") %>% ## select table element
  html_table()                                      ## convert to data frame

ntlparks_table

#Question 2

library(ggplot2)
library(fredr)
library(tidyverse)
library(quantmod)


Sys.getenv("FRED_API_KEY")

df<- fredr(series_id = "STTMINWGWA",
           observation_start =as.Date("1968-01-01"),
           observation_end = as.Date("2021-01-01"))


head(df)
tail(df)




getSymbols('STTMINWGWA',src='FRED')
plot(STTMINWGWA)

