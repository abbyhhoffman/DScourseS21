library(tidyverse)
library(sparklyr)
library(dplyr)

sc <- spark_connect(master = "local")




df1 <- as_tibble(iris)

head(df1)

df <- copy_to(sc, df1)

class(df1)
class(df)



df %>% select(Sepal_Length,Species) %>% head %>% print

df %>% filter(Sepal_Length>5.5) %>% head %>% print

df %>% filter(species == Sepal_Length>5.5) %>% head %>% print


df2 <- df %>% group_by(Species) %>% summarize(mean = mean(Sepal_Length),
                                              count = n()) %>% head %>% print
df2 %>% arrange(Species) %>% head %>% print
