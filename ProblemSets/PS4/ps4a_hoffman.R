system('wget -O dates.json "https://www.vizgr.org/historical-events/search.php?format=json&begin_date=00000101&end_date=20210219&lang=en"')

system('cat dates.json')

library(tidyverse)
library(jsonlite)

mylist <- fromJSON('dates.json')
mydf <- bind_rows(mylist$result[-1])

class(mydf)
class(mydf$date)

head(mydf)
