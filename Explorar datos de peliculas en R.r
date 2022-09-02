library(ggplot2)  # Visualizar gráficas
library(readr)  # Leer datos
library(dplyr)
library(fmsb)

datos <- read.csv("https://raw.githubusercontent.com/rpizarrog/Analisis-Inteligente-de-datos/main/datos/movies-db.csv", stringsAsFactors = TRUE )
#print(datos)

sortRtg <- datos[order(datos$average_rating), ] %>% summarise(average_rating) 
sortRtg$l <- datos %>% select(1,6)
print(sortRtg)
ggplot(data = sortRtg) + geom_bar(aes(x = average_rating))

sortCost <- datos[order(datos$cost_millions), ] %>% summarise(cost_millions) 
sortCost$l <- datos %>% select(1, 5)
print(sortCost)

sortGenre <- datos %>% select(4,6) %>% group_by(genre) %>% summarise(frecuencia  = n())
print(sortGenre)
