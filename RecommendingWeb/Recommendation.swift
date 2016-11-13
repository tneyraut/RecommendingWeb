//
//  Recommendation.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 06/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//
//  Cette classe définit l'ensemble du système de recommandation intégrée à l'application. Cette classe est divisée en deux parties. La première définit la recommandation du site web que l'utilisateur devrait vouloir visiter à l'instant considéré. La seconde partie définit la recommandation de nouveaux site web qui devraient intéresser l'utilisateur.
//

import UIKit

class Recommendation: NSObject {
    
    // PREMIERE PARTIE
    // Recommandation du site web qui devrait être visité par l'utilisateur à l'instant considéré
    
    // Cette fonction permet de récupérer les recommandations pour un timeSolt et une localisation donnés
    internal func getRecommendationArrayForTimeSolt(timeSolt: TimeSolt, latitude: Double, longitude: Double, data: Data) -> NSArray
    {
        // Pour effectuer cette recommandation, on se base d'abord sur les sites web que l'utilisateur a visité le même jour (lundi, mardi...) durant le même créneau horaire puis on remonte et descend dans les créneaux horaires suivants. On attribue des notes à chaque item différent pour chaque visite effectuée avec un coeff multiplicateur diminuant au fur et à mesure qu'on s'éloigne du créneaux horaire initiale. On effectue ici une régression linéaire.
        // On utilise ensuite les éléments de location pour récupérer les sites web visités par l'utilisateur à la localisation actuelle.
        
        // Récupération des sites web visités par l'utilisateur à la même date et durant le même créneau horaire
        let recommendationArray = data.getWebSiteViewForTimeSolt(timeSolt)
        
        // Définition du coefficient de régression
        var coeff: Double = 1.0

        // Calcul des scores de recommandation. Les scores de recommandation sont basés sur le temps de visite pour les différents sites. Ce score est multiplié par le coefficient de régression coeff
        var i = 0
        while (i < recommendationArray.count)
        {
            let webSite = recommendationArray[i] as! WebSite
            webSite.addScore(webSite.getTime(), coeff: coeff)
            i += 1
        }
        coeff -= 0.1
        
        // Calcul des scores de recommandation pour les autres timeSolt considérés. On ajoute au fur et à mesure les nouveaux scores calculés au score correspondant précédemment calculé
        i = 0
        var nextTimeSolt = timeSolt.getNextTimeSolt()
        var previousTimeSolt = timeSolt.getPreviousTimeSolt()
        var nextDayTimeSolt = timeSolt.getNextDayTimeSolt()
        var previousDayTimeSolt = timeSolt.getPreviousDayTimeSolt()
        while (i < 3)
        {
            self.mergeArray(recommendationArray, array: self.getRecommandationArrayFor(nextTimeSolt, data: data, coeff: coeff))
            self.mergeArray(recommendationArray, array: self.getRecommandationArrayFor(previousTimeSolt, data: data, coeff: coeff))
            self.mergeArray(recommendationArray, array: self.getRecommandationArrayFor(nextDayTimeSolt, data: data, coeff: coeff))
            self.mergeArray(recommendationArray, array: self.getRecommandationArrayFor(previousDayTimeSolt, data: data, coeff: coeff))
            
            nextTimeSolt = nextTimeSolt.getNextTimeSolt()
            previousTimeSolt = previousTimeSolt.getPreviousTimeSolt()
            nextDayTimeSolt = nextDayTimeSolt.getNextDayTimeSolt()
            previousDayTimeSolt = previousDayTimeSolt.getPreviousDayTimeSolt()
            if (nextTimeSolt.getHourMin() == timeSolt.getHourMin() && nextTimeSolt.getHourMax() == timeSolt.getHourMax())
            {
                nextTimeSolt = nextTimeSolt.getNextTimeSolt()
            }
            if (previousTimeSolt.getHourMin() == timeSolt.getHourMin() && previousTimeSolt.getHourMax() == timeSolt.getHourMax())
            {
                previousTimeSolt = previousTimeSolt.getPreviousTimeSolt()
            }
            coeff -= 0.1
            i += 1
        }
        
        while (coeff > 0.0)
        {
            self.mergeArray(recommendationArray, array: self.getRecommandationArrayFor(nextTimeSolt, data: data, coeff: coeff))
            self.mergeArray(recommendationArray, array: self.getRecommandationArrayFor(previousTimeSolt, data: data, coeff: coeff))
            
            nextTimeSolt = nextTimeSolt.getNextTimeSolt()
            previousTimeSolt = previousTimeSolt.getPreviousTimeSolt()
            if (nextTimeSolt.getHourMin() == timeSolt.getHourMin() && nextTimeSolt.getHourMax() == timeSolt.getHourMax())
            {
                nextTimeSolt = nextTimeSolt.getNextTimeSolt()
            }
            if (previousTimeSolt.getHourMin() == timeSolt.getHourMin() && previousTimeSolt.getHourMax() == timeSolt.getHourMax())
            {
                previousTimeSolt = previousTimeSolt.getPreviousTimeSolt()
            }
            coeff -= 0.1
        }
        // On récupère les sites web visités à la même localication et on merge les deux recommandations
        self.mergeArray(recommendationArray, array: data.getSiteWebForLocation(latitude, longitude: longitude))
        
        // On normalise les scores de recommandation
        self.normalizationScoreRecommendation(recommendationArray)
        
        // On retourne les recommandations après les avoir triés par ordre décroissant de score. Plus le score d'un site web est élevé plus la probabilité que l'utilisateur souhaite à cet instant visiter ce site web est forte
        return self.sortRecommendationArray(recommendationArray)
    }
    
    // Cette méthode permet de trier par ordre décroissant de score les recommandations
    private func sortRecommendationArray(recommendationArray: NSMutableArray) -> NSArray
    {
        let array = NSMutableArray()
        while (recommendationArray.count > 0)
        {
            var indice = 0
            var i = 1
            while (i < recommendationArray.count)
            {
                let webSite = recommendationArray[indice] as! WebSite
                let site = recommendationArray[i] as! WebSite
                if (webSite.getScore() < site.getScore())
                {
                    indice = i
                }
                i += 1
            }
            let webSite = recommendationArray[indice] as! WebSite
            array.addObject(webSite)
            recommendationArray.removeObjectAtIndex(indice)
        }
        return array
    }
    
    // Cette méthode permet de fusionner deux listes de recommandations
    private func mergeArray(recommandationArray: NSMutableArray, array: NSArray)
    {
        var i = 0
        while (i < array.count)
        {
            let webSite = array[i] as! WebSite
            let index = self.webSiteRecommandedAtIndex(webSite, recommandationArray: recommandationArray)
            if (index >= 0 && index < recommandationArray.count)
            {
                let site = recommandationArray[index] as! WebSite
                site.addScore(webSite.getScore(), coeff: 1.0)
                site.addTime(webSite.getTime())
            }
            else if (index < 0)
            {
                recommandationArray.addObject(webSite)
            }
            else if (index >= recommandationArray.count)
            {
                print("Bug / File : Recommandation.swift / Method : mergerArray")
            }
            i += 1
        }
    }
    
    // return -1 si non recommandé
    private func webSiteRecommandedAtIndex(siteWeb: WebSite, recommandationArray: NSArray) -> Int
    {
        var i = 0
        while (i < recommandationArray.count)
        {
            let site = recommandationArray[i] as! WebSite
            if (siteWeb.getAddress() == site.getAddress())
            {
                return i
            }
            i += 1
        }
        return -1
    }
    
    private func getRecommandationArrayFor(timeSolt: TimeSolt, data: Data, coeff: Double) -> NSArray
    {
        let array = data.getWebSiteViewForTimeSolt(timeSolt)
        
        var i = 0
        while (i < array.count)
        {
            let webSite = array[i] as! WebSite
            webSite.addScore(webSite.getTime(), coeff: coeff)
            i += 1
        }
        return array
    }
    
    private func normalizationScoreRecommendation(recommendationArray: NSArray)
    {
        let sum = self.getSumScoreRecommendation(recommendationArray);
        
        var i = 0
        while (i < recommendationArray.count)
        {
            let webSite = recommendationArray[i] as! WebSite
            webSite.normalizationScore(sum)
            i += 1
        }
    }
    
    private func getSumScoreRecommendation(recommendationArray: NSArray) -> Double
    {
        var resultat: Double = 0
        var i = 0
        while (i < recommendationArray.count)
        {
            let webSite = recommendationArray[i] as! WebSite
            resultat += webSite.getScore()
            i += 1
        }
        return resultat
    }
    
    
    
    
    
    // SECONDE PARTIE
    // Recommandation de nouveaux sites web qui devrait intéresser l'utilisateur
    // Cette partie n'est pas encore terminée
    
    internal func getRecommendationOfNewWebSite(timeSolt: TimeSolt, latitude: Double, longitude: Double, data: Data) -> NSArray
    {
        //let user_id = data.getUserId()
        
        let resultat = NSMutableArray()
        
        let recommendationsArray = NSMutableArray()
        
        var i = 0
        while (i < UsersTableViewController.numberOfUser)
        {
            data.setUserId(i)
            recommendationsArray.addObject(self.getRecommendationArrayForTimeSolt(timeSolt, latitude: latitude, longitude: longitude, data: data))
            i += 1
        }
        
        let webSiteAddressArray = self.getAllWebSiteAddressInArray(recommendationsArray)
        
        // m : matrice ; ligne => utilisateur ; colonne => siteWeb ; m[i,j] => note (valeur de recommandation) de l'utilisateur i pour le site web j
        var m = Array(count: UsersTableViewController.numberOfUser, repeatedValue: Array(count: webSiteAddressArray.count, repeatedValue: 0.0))
        
        i = 0
        while (i < UsersTableViewController.numberOfUser)
        {
            let array = recommendationsArray[i] as! NSArray
            var j = 0
            while (j < webSiteAddressArray.count)
            {
                m[i][j] = self.getNoteForWebSiteAddress(webSiteAddressArray[i] as! String, webSiteArray: array)
                j += 1
            }
            i += 1
        }
        
        //let distanceEuclidienne = self.getDistanceEuclidienne(m[user_id], m: self.getTransposee(m))
        
        //let voisins = self.getCloseUsers(distanceEuclidienne)
        
        //let mCentre = self.getSoustractionByColumn(m, v: self.getRowMeans(m))
        
        // à modifier
        //wcor.voisins <- cosinus.vm(new.user, t(m[i.voisins,]))
        //let cosVoisins = self.getCosinusResult(m[user_id], m: self.getTransposee(m))
        
        i = 0
        //var results = Array(count: webSiteAddressArray.count, repeatedValue: 0.0)
        while (i < webSiteAddressArray.count)
        {
            /*votes.no.na <- !is.na(m.centre[i.voisins,item.id])
             if(any(votes.no.na)) {
                k<- 1/sum(abs(wcor.voisins[votes.no.na])) # constante de normalisation
                results[item.id] <- mean(new.user, na.rm=T) + k * (wcor.voisins[votes.no.na] %*% m.centre[i.voisins,item.id][votes.no.na])
             } else {
                results[item.id] <- NA
             }
            */
            //results[i] =
            i += 1
        }
        
        /*
         # On ne prend que les 10 meilleures notes
         meilleurs.films <- max.nindex(results,10)
         u.item$movie.title[c(meilleurs.films)]
         */
        
        return resultat
    }
    
    private func getAllWebSiteAddressInArray(recommmendationArray: NSArray) -> NSArray
    {
        let resultat = NSMutableArray()
        var i = 0
        while (i < recommmendationArray.count)
        {
            let array = recommmendationArray[i] as! NSArray
            var j = 0
            while (j < array.count)
            {
                let webSite = array[j] as! WebSite
                if (!resultat.containsObject(webSite.getAddress()))
                {
                    resultat.addObject(webSite.getAddress())
                }
                j += 1
            }
            i += 1
        }
        return resultat
    }
    
    private func getNoteForWebSiteAddress(address: String, webSiteArray:NSArray) -> Double
    {
        var i = 0
        while (i < webSiteArray.count)
        {
            let webSite = webSiteArray[i] as! WebSite
            if (webSite.getAddress() == address)
            {
                return webSite.getScore()
            }
            i += 1
        }
        return 0
    }
    
    private func getTransposee(m: Array<Array<Double>>) -> Array<Array<Double>>
    {
        var transposee = Array(count: m[0].count, repeatedValue: Array(count: m.count, repeatedValue: 0.0))
        
        var i = 0
        while (i < transposee.count)
        {
            var j = 0
            while (j < transposee[0].count)
            {
                transposee[i][j] = m[j][i]
                j += 1
            }
            i += 1
        }
        return transposee
    }
    
    private func getDistanceEuclidienne(v: Array<Double>, m: Array<Array<Double>>) -> Array<Double>
    {
        let soustraction = self.getSoustractionByRow(v, m: m)
        let produit = self.getProduit(soustraction, n: soustraction)
        var colSums = self.getColSums(produit)
        var i = 0
        while (i < colSums.count)
        {
            colSums[i] = sqrt(colSums[i])
            i += 1
        }
        return colSums
    }
    
    private func getSoustractionByRow(v: Array<Double>, m: Array<Array<Double>>) -> Array<Array<Double>>
    {
        var resultat = Array(count: m.count, repeatedValue: Array(count: m[0].count, repeatedValue:0.0))
        
        var i = 0
        while (i < resultat.count)
        {
            var j = 0
            while (j < resultat[0].count)
            {
                resultat[i][j] = v[j] - m[i][j]
                j += 1
            }
            i += 1
        }
        return resultat
    }
    
    private func getProduit(m: Array<Array<Double>>, n: Array<Array<Double>>) -> Array<Array<Double>>
    {
        // vérifier que m[0].count == n.count sinon calcul impossible
        var resultat = Array(count: m.count, repeatedValue: Array(count: n[0].count, repeatedValue:0.0))
        var i = 0
        while (i < resultat.count)
        {
            var j = 0
            while (j < resultat[0].count)
            {
                var k = 0
                while (k < n.count)
                {
                    resultat[i][j] += m[i][k] * n[k][j]
                    k += 1
                }
                j += 1
            }
            i += 1
        }
        return resultat
    }
    
    private func getColSums(m: Array<Array<Double>>) -> Array<Double>
    {
        var resultat = Array(count: m.count, repeatedValue: 0.0)
        var i = 0
        while (i < resultat.count)
        {
            var j = 0
            while (j < m[0].count)
            {
                resultat[i] += m[i][j]
                j += 1
            }
            i += 1
        }
        return resultat
    }
    
    private func getCloseUsers(distanceArray: Array<Double>) -> Array<Int>
    {
        var resultat = Array(count: distanceArray.count, repeatedValue: -1)
        var array = distanceArray
        var i = 0
        while (i < resultat.count)
        {
            resultat[i] = self.getIndiceOfMinPositif(array)
            array[resultat[i]] = -1
            i += 1
        }
        return resultat
    }
    
    private func getIndiceOfMinPositif(array: Array<Double>) -> Int
    {
        var indice = 0
        var i = 1
        while (i < array.count)
        {
            if (array[indice] < 0 || (array[i] >= 0 && array[indice] > array[i]))
            {
                indice = i
            }
            i += 1
        }
        return indice
    }
    
    private func getRowMeans(m: Array<Array<Double>>) -> Array<Double>
    {
        var resultat = Array(count: m.count, repeatedValue: 0.0)
        var i = 0
        while (i < m.count)
        {
            var j = 0
            var compteur = 0.0
            while (j < m[i].count)
            {
                resultat[i] += m[i][j]
                if (m[i][j] != 0)
                {
                    compteur += 1
                }
                j += 1
            }
            resultat[i] = resultat[i] / compteur
            i += 1
        }
        return resultat
    }
    
    private func getSoustractionByColumn(m: Array<Array<Double>>, v: Array<Double>) -> Array<Array<Double>>
    {
        var resultat = Array(count: m.count, repeatedValue: Array(count: m[0].count, repeatedValue: 0.0))
        var j = 0
        while (j < m[0].count)
        {
            var i = 0
            while (i < m.count)
            {
                resultat[i][j] = m[i][j] - v[i]
                i += 1
            }
            j += 1
        }
        return resultat
    }
    
    /*
     cosinus.vm <- function(v,m) {
     n <- sqrt(colSums(m^2))
     (v %*% m)/(n * sqrt(sum(v^2)))
     %*% => matrice multiplication
     }
     */
    /*private func getCosinusResult(v: Array<Double>, m:Array<Array<Double>>) -> Array<Array<Double>>
    {
        // resultat matrice 1 ligne et nrow(m) colonnes
    }*/
    
}
