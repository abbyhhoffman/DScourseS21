library(tidyverse)
library(sparklyr)
library(dplyr)

install_spark(version = "3.0.0")
sc <- spark_connect(master = "local")




df1 <- as_tibble(iris)

head(df1)

df <- copy_to(sc, df1)

print(class(df1))
print(class(df))



df %>% select(Sepal_Length,Species) %>% head %>% print
df1 %>% select(Sepal_Length,Species) %>% head %>% print

df %>% filter(Sepal_Length>5.5) %>% head %>% print
df1 %>% filter(Sepal_Length>5.5) %>% head %>% print

df %>% filter(Sepal_Length>5.5) %>% select(Sepal_Length,Species) %>% head %>% print


df2 <- df %>% group_by(Species) %>% summarize(mean = mean(Sepal_Length),
                                              count = n()) %>% head %>% print
df2 %>% arrange(Species) %>% head %>% print
