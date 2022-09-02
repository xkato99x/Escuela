library(ggplot2)  # Visualizar gráficas
library(readr)  # Leer datos
library(dplyr)
library(fmsb)

datos <- read.csv("https://raw.githubusercontent.com/rpizarrog/Analisis-Inteligente-de-datos/main/datos/movies-db.csv", stringsAsFactors = TRUE )
#print(datos)

sortRtg <- datos[order(datos$average_rating), ] %>% select(1,2,5,6,7)
# sortRtg <- datos[order(datos$average_rating), ] %>% summarise(average_rating) 
print(sortRtg)
ggplot(data = sortRtg) + geom_bar(aes(x = average_rating))
# Con este sorting podemos observar que las 5 películas mejor rateadas son domésticas, siendo la mejor
# rateada Jumanji (2020), con una calificación de 9.3 y 50 millones de presupuesto.

sortCost <- datos[order(datos$cost_millions), ] %>% select(1, 5, 6)
print(sortCost)
# Aquí podemos observar que 

sortGenre <- datos %>% select(4,6) %>% group_by(genre) %>% summarise(frecuencia  = n())
print(sortGenre)
