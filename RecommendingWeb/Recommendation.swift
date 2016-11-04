//
//  Recommendation.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 06/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class Recommendation: NSObject {
    
    internal func getRecommendationArrayForTimeSolt(timeSolt: TimeSolt, latitude: Double, longitude: Double, data: Data) -> NSArray
    {
        // pour faire la recommandation on se base d'abord sur ce qu'on a vu au même jour durant le même créneau horaire puis on remonte dans les créneaux horaires suivants... on attribue des notes à chaque item différent pour chaque visite effectuée avec un coeff multiplicateur diminuant au fur et à mesure qu'on s'éloigne du créneaux horaire initiale
        // on utilise aussi les éléments de location
        
        let recommendationArray = data.getWebSiteViewForTimeSolt(timeSolt)
        
        var coeff: Double = 1.0

        var i = 0
        while (i < recommendationArray.count)
        {
            let webSite = recommendationArray[i] as! WebSite
            webSite.addScore(webSite.getTime(), coeff: coeff)
            i += 1
        }
        coeff -= 0.1
        
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
            coeff -= 0.1
            i += 1
        }
        
        while (coeff > 0.0)
        {
            self.mergeArray(recommendationArray, array: self.getRecommandationArrayFor(nextTimeSolt, data: data, coeff: coeff))
            self.mergeArray(recommendationArray, array: self.getRecommandationArrayFor(previousTimeSolt, data: data, coeff: coeff))
            
            nextTimeSolt = nextTimeSolt.getNextTimeSolt()
            previousTimeSolt = previousTimeSolt.getPreviousTimeSolt()
            coeff -= 0.1
        }
        // vérifier ce qu'on récupère comme data via la localisation
        self.mergeArray(recommendationArray, array: data.getSiteWebForLocation(latitude, longitude: longitude))
        
        //let array = data.getSiteWebForLocation(latitude, longitude: longitude)
        
        self.normalizationScoreRecommendation(recommendationArray)
        
        return self.sortRecommendationArray(recommendationArray)
    }
    
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
    
}
