library(Matrix)

setwd('/Applications/XCodeProjects/RecommendingWeb/DataCreator') # à modifier selon la machine
u.data <- read.csv(file='data.csv', sep=',', header=T)
i.data <- read.csv(file='item.csv', sep=',', header=T)

# Contexte considéré
user.id <- 1
# TimeSolt : 0h-5h ; 5h-9h ; 9h-12h ; 12h-14h ; 14h-19h ; 19h-24h
hour <- 10
# Day : Lundi = 1 ; Mardi = 2 ; Mercredi = 3 ; Jeudi = 4 ; Vendredi = 5 ; Samedi = 6 ; Dimanche = 7
day <- 1
latitude <- 45.505
longitude <- -73.613


# Première Partie
# Recommandations du site web que l'utilisateur devrait visiter selon le contexte (heure et jour actuel)

# Permet de récupérer l'heure minimale du créneau horaire correspondant à l'heure fournie en paramètre
getTimeSoltHourMin <- function(h) { 
  if (h < 5) {
    return(0)
  } else if (h < 9) {
    return(5)
  } else if (h < 12) {
    return(9)
  } else if (h < 14) {
    return(12)
  } else if (h < 19) {
    return(14)
  }
  return(19)
}

# Permet de récupérer l'heure maximale du créneau horaire correspondant à l'heure fournie en paramètre
getTimeSoltHourMax <- function(h) { 
  if (h < 5) {
    return(5)
  } else if (h < 9) {
    return(9)
  } else if (h < 12) {
    return(12)
  } else if (h < 14) {
    return(14)
  } else if (h < 19) {
    return(19)
  }
  return(24)
}

# Permet de récupérer le jour précédant au jour fourni en paramètre
getPreviousDay <- function(d) {
  if (d == 1) {
    return(7)
  }
  return(d-1)
}

# Permet de récupérer le jour suivant au jour fourni en paramètre
getNextDay <- function(d) {
  if (d == 7) {
    return(1)
  }
  return(d+1)
}

# Permet de récupérer le créneau horaire précédant au créneau horaire fourni en paramètre
# Retour sous la forme c(day, hourMin, hourMax)
getPreviousTimeSolt <- function(d, hourMin) {
  if (hourMin < 5) {
    return(c(getPreviousDay(d),19,24))
  } else if (hourMin < 9) {
    return(c(d,0,5))
  } else if (hourMin < 12) {
    return(c(d,5,9))
  } else if (hourMin < 14) {
    return(c(d,9,12))
  } else if (hourMin < 19) {
    return(c(d,12,14))
  }
  return(c(d,14,19))
}

# Permet de récupérer le créneau horaire suivant au créneau horaire fourni en paramètre
# Retour sous la forme c(day, hourMin, hourMax)
getNextTimeSolt <- function(d, hourMin, hourMax) {
  if (hourMin < 5) {
    return(c(d,5,9))
  } else if (hourMin < 9) {
    return(c(d,9,12))
  } else if (hourMin < 12) {
    return(c(d,12,14))
  } else if (hourMin < 14) {
    return(c(d,14,19))
  } else if (hourMin < 19) {
    return(c(d,19,24))
  }
  return(c(getNextDay(d),0,5))
}

# Permet de récupérer les recommandations de sites web pour le contexte fourni en paramètre mais sans régression linéaire du contexte
getLazyRecommandations <- function(id, timeSolt.hourMin, timeSolt.hourMax, d, coeff) {
  recommandations <- u.data[u.data$user_id == id,]
  recommandations <- recommandations[recommandations$day == d,]
  recommandations <- recommandations[recommandations$hour < timeSolt.hourMax,]
  recommandations <- recommandations[recommandations$hour >= timeSolt.hourMin,]
  webSite.id <- unique(recommandations$webSite_id)
  webSite.time <- webSite.id
  
  for (i in 1:length(webSite.id)) {
    webSite.time[i] <- sum(recommandations[recommandations$webSite_id == webSite.id[i],]$time) * coeff
  }
  
  resultat <- matrix(NA, nrow = length(webSite.id), ncol = 2)
  resultat[,1] <- webSite.id
  resultat[,2] <- webSite.time
  return(resultat)
}

# Permet de récupérer les recommandations pour la localisation fournie en paramètre
getRecommandationsForLocalization <- function(longitude, latitude, id) {
  recommandations <- u.data[u.data$user_id == id,]
  recommandations <- recommandations[recommandations$latitude == latitude,]
  recommandations <- recommandations[recommandations$longitude == longitude,]
  webSite.id <- unique(recommandations$webSite_id)
  webSite.time <- webSite.id
  
  for (i in 1:length(webSite.id)) {
    webSite.time[i] <- sum(recommandations[recommandations$webSite_id == webSite.id[i],]$time) * 2.0
  }
  
  resultat <- matrix(NA, nrow = length(webSite.id), ncol = 2)
  resultat[,1] <- webSite.id
  resultat[,2] <- webSite.time
  return(resultat)
}

# Permet de fusionner (union) deux ensembles de recommandations (matrices) en un seul
mergeRecommandations <- function(matrice, m) {
  if (nrow(m) <= 0) {
    return(matrice)
  }
  for (i in 1:nrow(m)) {
    ok <- FALSE
    if (nrow(matrice) > 0) {
      for (j in 1:nrow(matrice)) {
        if (m[i,1] == matrice[j,1]) {
          matrice[j,2] <- matrice[j,2] + m[i,2]
          ok <- TRUE
          break
        }
      }
    }
    if (!ok) {
      matrice <- rbind(matrice, m[i,])
    }
  }
  return(matrice)
}

# Permet de récupérer les recommandations par régression linaire du contexte fournie en paramètre
getRecommandations <- function(id, h, d, with.localisation) {
  coeff <- 1.0
  timeSolt.hourMin <- getTimeSoltHourMin(h)
  timeSolt.hourMax <- getTimeSoltHourMax(h)
  
  recommandations <- u.data[u.data$user_id == id,]
  recommandations <- recommandations[recommandations$day == d,]
  recommandations <- recommandations[recommandations$hour < timeSolt.hourMax,]
  recommandations <- recommandations[recommandations$hour >= timeSolt.hourMin,]
  webSite.id <- unique(recommandations$webSite_id)
  webSite.time <- webSite.id
  
  for (i in 1:length(webSite.id)) {
    webSite.time[i] <- sum(recommandations[recommandations$webSite_id == webSite.id[i],]$time) * coeff
  }
  coeff <- coeff - 0.1
  
  resultat <- matrix(NA, nrow = length(webSite.id), ncol = 2)
  resultat[,1] <- webSite.id
  resultat[,2] <- webSite.time
  
  previousDay <- getPreviousDay(d)
  nextDay <- getNextDay(d)
  previousTimeSolt <- getPreviousTimeSolt(d, timeSolt.hourMin)
  nextTimeSolt <- getNextTimeSolt(d, timeSolt.hourMin, timeSolt.hourMax)
  # Première partie de la régression linéaire du contexte
  for (i in 1:3) {
    resultat <- mergeRecommandations(resultat, getLazyRecommandations(id, timeSolt.hourMin, timeSolt.hourMax, previousDay, coeff))
    resultat <- mergeRecommandations(resultat, getLazyRecommandations(id, timeSolt.hourMin, timeSolt.hourMax, nextDay, coeff))
    resultat <- mergeRecommandations(resultat, getLazyRecommandations(id, previousTimeSolt[2], previousTimeSolt[3], previousTimeSolt[1], coeff))
    resultat <- mergeRecommandations(resultat, getLazyRecommandations(id, nextTimeSolt[2], nextTimeSolt[3], nextTimeSolt[1], coeff))
    
    previousDay <- getPreviousDay(previousDay)
    nextDay <- getNextDay(nextDay)
    previousTimeSolt <- getPreviousTimeSolt(previousTimeSolt[1], previousTimeSolt[2])
    nextTimeSolt <- getNextTimeSolt(nextTimeSolt[1], nextTimeSolt[2])
    coeff <- coeff - 0.1
  }
  
  # Seconde partie de la régression linéaire du contexte
  while (coeff > 0) {
    resultat <- mergeRecommandations(resultat, getLazyRecommandations(id, previousTimeSolt[2], previousTimeSolt[3], previousTimeSolt[1], coeff))
    resultat <- mergeRecommandations(resultat, getLazyRecommandations(id, nextTimeSolt[2], nextTimeSolt[3], nextTimeSolt[1], coeff))
    
    previousTimeSolt <- getPreviousTimeSolt(previousTimeSolt[1], previousTimeSolt[2])
    nextTimeSolt <- getNextTimeSolt(nextTimeSolt[1], nextTimeSolt[2])
    coeff <- coeff - 0.1
  }
  
  # Prise en compte oui ou non de la recommandation par localisation 
  if (with.localisation) {
    resultat <- mergeRecommandations(resultat, getRecommandationsForLocalization(latitude, longitude, id))
  }
  # Normalisaiton des scores de recommandations
  resultat[,2] <- resultat[,2] / sum(resultat[,2])
  # Trie des recommandations par ordre décroissant de score de recommandations
  return(resultat[order(resultat[,2], decreasing = TRUE),])
}

# Calcul des recommandations pour le contexte défini précédemment avec la prise en compte de la localisation
recommandations <- getRecommandations(user.id, hour, day, TRUE)
# Affichage des résultats de la recommandation
i.data[recommandations[,1],]



# Deuxième partie
# Recommandations de nouveaux sites web

# Permet de formater les résultats de la recommandation précédante
getFormatageRecommandations <- function(recommendations_k) {
  resultat <- vector(mode = "numeric", length = nrow(i.data))
  resultat[recommendations_k[,1]] <- recommendations_k[,2]
  return(resultat)
}

all.recommendations <- matrix(data = NA, nrow = max(u.data$user_id), ncol = nrow(i.data))
# Calcul de la recommmandation précédente pour tous les utilisateurs
for (u.id in 1:max(u.data$user_id)) {
  recommendations_u.id <- getRecommandations(u.id, hour, day, FALSE)
  recommendations_u.id <- getFormatageRecommandations(recommendations_u.id)
  all.recommendations[u.id,] <- recommendations_u.id
}

m.sparse <- all.recommendations
m <- as.matrix(m.sparse)
m[m==0] <- NA

recommendations_user <- all.recommendations[user.id,]
recommendations_user_NA <- recommendations_user
recommendations_user_NA[recommendations_user_NA == 0] <- NA

# Distance euclidienne entre un vecteur et les colonnes d'une matrice
distance.euclidienne <- function(v, m) {
  sqrt(colSums((v - m)^2))
}

# Trouve les indexes des valeurs minimales d'une matrice différentes de l'indice de référence
min.nindex <- function(m, n=5) {
  i <- order(m)
  return(i[1:n])
}

# Trouve les indexes des premières 'n' valeurs maximales d'une matrice
max.nindex <- function(m, n=5) {
  i <- order(m, decreasing=TRUE)
  return(i[1:n])
}

# Cosinus entre un vecteur v et chaque colonne dela matrice m
cosinus.vm <- function(v,m) { 
  n <- sqrt(colSums(m^2))
  (v %*% m)/(n * sqrt(sum(v^2)))
}

distance.user <- distance.euclidienne(recommendations_user, t(m.sparse))
i.voisins <- min.nindex(distance.user, 21) # indices des 21 plus proches voisins
i.voisins <- i.voisins[i.voisins != user.id] # on supprime l'utilisateur considéré de la liste

# Calcule des valeurs centrées par rapport aux lignes
m.centre <- m - rowMeans(m, na.rm = T)
wcor.voisins <- cosinus.vm(recommendations_user, t(m.sparse[i.voisins,]))

results <- numeric(nrow(i.data))
for (item.id in 1:nrow(i.data)) {
  votes.no.na <- !is.na(m.centre[i.voisins, item.id])
  if (any(votes.no.na)) {
    k <- 1 / sum (abs(wcor.voisins[votes.no.na])) # constante de normalisation
    results[item.id] <- mean(recommendations_user, na.rm = TRUE) + k * (wcor.voisins[votes.no.na] %*% m.centre[i.voisins, item.id][votes.no.na])
  } else {
    results[item.id] <- NA
  }
}

# On ne prend que les 10 meilleures notes
meilleurs.site.web <- max.nindex(results, 10)
i.data$webSite[c(meilleurs.site.web)]

verif <- getRecommandations(1, hour, day, FALSE)
i.data[verif[,1],]

