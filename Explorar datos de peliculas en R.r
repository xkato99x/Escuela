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
# rateada The Shawshank Redemption (1994), con una calificación de 9.3 y 25 millones de presupuesto.
# También podemos notar que sólo una película extranjera llegó al top 5, la cual es City of God (2002),
# Con un rating de 8.7 y un presupuesto de sólo 3.3 millones.

sortCost <- datos[order(datos$cost_millions), ] %>% select(1, 5, 6)
print(sortCost)
# Aquí podemos observar que la película más cara de hacer fue interestellar, con 165 millones de presupuesto,
# superando al segundo y tercer puesto por 100 y 102 millones, respectivamente.

sortGenre <- datos %>% select(4,6) %>% group_by(genre) %>% summarise(frecuencia  = n())
print(sortGenre)
# Notamos también que las peliculas que más hacen son las de drama, seguidas por las de comedia y por último
# las de crimen, con 7, 5 y 4 películas, respectivamente.