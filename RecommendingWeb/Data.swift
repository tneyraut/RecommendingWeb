//
//  Data.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 06/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//
//  Cette classe définit la structure de données permettant de sauvegarder les données de navigation de l'utilisateur primordiales à notre système de recommandation
//

import UIKit
import CoreLocation

class Data: NSObject {
    
    // Cet attibut définit quel utilisateur est considéré (0 utilisateur initialement vide, > 0 utilisateur test)
    fileprivate var user_id = 0
    
    // Cet attribut permet de sauvegarder les données test ainsi que les données de navigation
    fileprivate let data = UserDefaults()
    
    fileprivate var lastWebSiteVisited: NSString = ""
    
    internal func setUserId(_ id: Int)
    {
        self.user_id = id
        if (self.user_id != 0)
        {
            self.loadUserData()
        }
        else
        {
            self.removeOldData()
        }
    }
    
    internal func getUserId() -> Int
    {
        return self.user_id
    }
    
    // Cette méthode permet de récupérer dans un tableau toutes les données de navigation présentes sur l'application
    internal func getAllData(_ numberOfUser: Int) -> NSArray
    {
        let array = NSMutableArray()
        
        var i = 0
        while (i < numberOfUser)
        {
            if (i == 0)
            {
                self.user_id = i
                self.removeOldData()
            }
            else
            {
                self.user_id = i
                self.loadUserData()
            }
            let compteur = self.data.integer(forKey: self.getPrefix() + "compteur")
            var j = 0
            while (j < compteur)
            {
                //["User", "Site Web", "Day", "Hour", "Time", "Latitude", "Longitude"]
                let tab: NSArray = [
                    "\(self.user_id)",
                    self.data.string(forKey: self.getPrefix() + "webSite\(j)")!,
                    "\(self.data.integer(forKey: self.getPrefix() + "dayWebSite\(j)"))",
                    "\(self.data.integer(forKey: self.getPrefix() + "hourWebSite\(j)"))",
                    "\(self.data.double(forKey: self.getPrefix() + "timeWebSite\(j)"))",
                    "\(self.data.double(forKey: self.getPrefix() + "latitudeWebSite\(j)"))",
                    "\(self.data.double(forKey: self.getPrefix() + "longitudeWebSite\(j)"))"
                ]
                array.add(tab)
                j += 1
            }
            i += 1
        }
        return array
    }
    
    fileprivate func getPrefix() -> String
    {
        return "user" + String(self.user_id) + "_"
    }
    
    // Cette méthode permet de sauvegarder les données de navigation
    // initialement le compteur est à 0. Les indices vont de 0 à ...
    // récupère l'url host parfaite
    internal func saveData(_ url: NSString, latitude: Double, longitude: Double)
    {
        if (url.contains("https://www.google."))
        {
            self.lastWebSiteVisited = url
            Timer.stopTimerAndSaveTime()
            return
        }
        else if (self.data.integer(forKey: self.getPrefix() + "compteur") == 0)
        {
            self.lastWebSiteVisited = url
            self.addWebSite(url, latitude: latitude, longitude: longitude)
            return
        }
        
        let dayLastSave = self.data.integer(forKey: self.getPrefix() + "dayWebSite" + String(self.data.integer(forKey: self.getPrefix() + "compteur") - 1))
        let hourLastSave = self.data.integer(forKey: self.getPrefix() + "hourWebSite" + String(self.data.integer(forKey: self.getPrefix() + "compteur") - 1))
        
        let date = Date()
        
        let dateFormatter = DateFormatter()
        //dateFormatter.timeZone = TimeZone()
        dateFormatter.dateFormat = "ccc"
        let day = self.getIntDay(dateFormatter.string(from: date))
        
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([NSCalendar.Unit.hour], from: date)
        let hour = components.hour
        
        if (url != self.lastWebSiteVisited || day != dayLastSave || hour != hourLastSave)
        {
            self.lastWebSiteVisited = url
            self.addWebSite(url, latitude: latitude, longitude: longitude)
        }
    }
    
    /*
     Lundi : 1
     Mardi : 2
     Mercredi : 3
     Jeudi : 4
     Vendredi : 5
     Samedi : 6
     Dimanche : 7
     */
    
    // Cette méthode permet de sauvegarder les données de navigation
    fileprivate func addWebSite(_ string: NSString, latitude: Double, longitude: Double)
    {
        Timer.stopTimerAndSaveTime()
        Timer.startTimer()
        
        let date = Date()
        
        let dateFormatter = DateFormatter()
        //dateFormatter.timeZone = TimeZone()
        dateFormatter.dateFormat = "ccc"
        let day = self.getIntDay(dateFormatter.string(from: date))
        
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([NSCalendar.Unit.hour], from: date)
        let hour = components.hour
        
        self.data.set(string, forKey:self.getPrefix() + "webSite" + String(self.data.integer(forKey: self.getPrefix() + "compteur")))
        self.data.set(day, forKey:self.getPrefix() + "dayWebSite" + String(self.data.integer(forKey: self.getPrefix() + "compteur")))
        self.data.set(hour, forKey:self.getPrefix() + "hourWebSite" + String(self.data.integer(forKey: self.getPrefix() + "compteur")))
        self.data.set(latitude, forKey:self.getPrefix() + "latiudeWebSite" + String(self.data.integer(forKey: self.getPrefix() + "compteur")))
        self.data.set(longitude, forKey:self.getPrefix() + "longitudeWebSite" + String(self.data.integer(forKey: self.getPrefix() + "compteur")))
        
        self.data.set(self.data.integer(forKey: self.getPrefix() + "compteur") + 1, forKey: self.getPrefix() + "compteur")
        
        self.data.synchronize()
    }
    
    // Cette méthode permet de sauvegarder le temps de visite
    internal func saveTime()
    {
        print("save time : \(Timer.getTime())")
        let indice = self.data.integer(forKey: self.getPrefix() + "compteur") - 1
        self.data.set(self.data.double(forKey: self.getPrefix() + "timeWebSite\(indice)") + Timer.getTime(), forKey: self.getPrefix() + "timeWebSite\(indice)")
    }
    
    // Cette méthode permet de supprimer les données les plus anciennes pour qu'elles puissent être remplacées par des données de navigation plus récentes et donc plus proche de la navigation actuelle de l'utilisateur
    fileprivate func removeOldData()
    {
        // on supprime les données les plus anciennes, si on a plus de 4 semaines de données
        // on doit toujours avoir 4 semaines de données 
        // donc 4*7 = 28 jours différents
        // dès qu'on a plus on supprime les données associées au premier jour
        while (self.getNumberOfDay() > 28)
        {
            let day = self.data.integer(forKey: self.getPrefix() + "dayWebSite0")
            while (day == self.data.integer(forKey: self.getPrefix() + "dayWebSite0"))
            {
                self.removeDataAtIndex(0)
            }
        }
    }
    
    fileprivate func getNumberOfDay() -> Int
    {
        if (self.data.integer(forKey: self.getPrefix() + "compteur") <= 0)
        {
            return 0
        }
        var resultat = 1
        var i = 1
        var currentDay = self.data.integer(forKey: self.getPrefix() + "dayWebSite0")
        while (i < self.data.integer(forKey: self.getPrefix() + "compteur"))
        {
            if (currentDay != self.data.integer(forKey: self.getPrefix() + "dayWebSite" + String(i)))
            {
                currentDay = self.data.integer(forKey: self.getPrefix() + "dayWebSite" + String(i))
                resultat += 1
            }
            i += 1
        }
        return resultat
    }
    
    // Cette méthode permet de supprimer les données de navigation
    fileprivate func removeDataAtIndex(_ index: Int)
    {
        if (index >= self.data.integer(forKey: self.getPrefix() + "compteur") || index < 0)
        {
            return
        }
        var i = index
        while (i < self.data.integer(forKey: self.getPrefix() + "compteur") - 1)
        {
            self.data.set(self.data.string(forKey: self.getPrefix() + "webSite" + String(i+1)), forKey: self.getPrefix() + "webSite" + String(i))
            self.data.set(self.data.integer(forKey: self.getPrefix() + "dayWebSite" + String(i+1)), forKey: self.getPrefix() + "dayWebSite" + String(i))
            self.data.set(self.data.integer(forKey: self.getPrefix() + "hourWebSite" + String(i+1)), forKey: self.getPrefix() + "hourWebSite" + String(i))
            self.data.set(self.data.double(forKey: self.getPrefix() + "latitudeWebSite\(i+1)"), forKey: self.getPrefix() + "latitudeWebSite\(i)")
            self.data.set(self.data.double(forKey: self.getPrefix() + "longitudeWebSite\(i+1)"), forKey: self.getPrefix() + "longitudeWebSite\(i)")
            self.data.set(self.data.double(forKey: self.getPrefix() + "timeWebSite\(i+1)"), forKey: self.getPrefix() + "timeWebSite\(i)")
            i += 1
        }
        self.data.set(self.data.integer(forKey: self.getPrefix() + "compteur") - 1, forKey: self.getPrefix() + "compteur")
        self.data.removeObject(forKey: self.getPrefix() + "webSite" + String(self.data.integer(forKey: self.getPrefix() + "compteur")))
        self.data.removeObject(forKey: self.getPrefix() + "dayWebSite" + String(self.data.integer(forKey: self.getPrefix() + "compteur")))
        self.data.removeObject(forKey: self.getPrefix() + "hourWebSite" + String(self.data.integer(forKey: self.getPrefix() + "compteur")))
        self.data.removeObject(forKey: self.getPrefix() + "latitudeWebSite\(self.data.integer(forKey: self.getPrefix() + "compteur"))")
        self.data.removeObject(forKey: self.getPrefix() + "longitudeWebSite\(self.data.integer(forKey: self.getPrefix() + "compteur"))")
        self.data.removeObject(forKey: self.getPrefix() + "timeWebSite\(self.data.integer(forKey: self.getPrefix() + "compteur"))")
        
        self.data.synchronize()
    }
    
    // Cette méthode permet de récupérer les sites web visités au cours du timeSolt considéré
    internal func getWebSiteViewForTimeSolt(_ timeSolt: TimeSolt) -> NSMutableArray
    {
        let array = NSMutableArray()
        
        let compteur = self.data.integer(forKey: self.getPrefix() + "compteur")
        var i = 0
        while (i < compteur)
        {
            let day = self.data.integer(forKey: self.getPrefix() + "dayWebSite" + String(i))
            let hour = self.data.integer(forKey: self.getPrefix() + "hourWebSite" + String(i))
            if (day == timeSolt.getDay() && timeSolt.getHourMin() <= hour && hour < timeSolt.getHourMax())
            {
                let webSiteAddress = self.data.string(forKey: self.getPrefix() + "webSite" + String(i))
                let time = self.data.double(forKey: self.getPrefix() + "timeWebSite\(i)")
                let indice = self.webSiteAlreadyInArray(webSiteAddress!, array: array)
                if (indice == -1)
                {
                    let webSite = WebSite()
                    webSite.initWebSite(webSiteAddress!, time: time)
                    array.add(webSite)
                }
                else
                {
                    let webSite = array[indice] as! WebSite
                    webSite.addTime(time)
                }
            }
            i += 1
        }
        return array
    }
    
    fileprivate func webSiteAlreadyInArray(_ webSiteAddress: String, array: NSArray) -> Int
    {
        var i = 0
        while (i < array.count)
        {
            let webSite = array[i] as! WebSite
            if (webSite.getAddress() == webSiteAddress)
            {
                return i
            }
            i += 1
        }
        return -1
    }
    
    // Cette méthode permet de récupérer les sites web visités à la position considérée
    internal func getSiteWebForLocation(_ latitude: Double, longitude: Double) -> NSArray
    {
        let array = NSMutableArray()
        
        let compteur = self.data.integer(forKey: self.getPrefix() + "compteur")
        var i = 0
        while (i < compteur)
        {
            let lat = self.data.double(forKey: self.getPrefix() + "latitudeWebSite\(i)")
            let lon = self.data.double(forKey: self.getPrefix() + "longitudeWebSite\(i)")
            if (lat == latitude && lon == longitude)
            {
                let webSite = WebSite()
                webSite.initWebSite(self.data.string(forKey: self.getPrefix() + "webSite\(i)")!, time: 0.0)
                // aspect que l'on met en avant avec coeff
                webSite.addScore(self.data.double(forKey: self.getPrefix() + "timeWebSite\(i)"), coeff: 2.0)
                
                array.add(webSite)
            }
            i += 1
        }
        return array
    }
    
    // Cette méthode permet de charger les données test de l'utilisateur test considéré
    fileprivate func loadUserData()
    {
        var array = NSArray()
        
        if (self.user_id == 1)
        {
            //[webSite, dayWebSite, hourWebSite, timeWebSite, latitudeWebSite, longitudeWebSite]
            array = UserData.getDataArrayForUser1()
        }
        else if (self.user_id == 2)
        {
            array = UserData.getDataArrayForUser2()
        }
        else if (self.user_id == 3)
        {
            array = UserData.getDataArrayForUser3()
        }
        else if (self.user_id == 4)
        {
            array = UserData.getDataArrayForUser4()
        }
        else if (self.user_id == 5)
        {
            array = UserData.getDataArrayForUser5()
        }
        else if (self.user_id == 6)
        {
            array = UserData.getDataArrayForUser6()
        }
        else if (self.user_id == 7)
        {
            array = UserData.getDataArrayForUser7()
        }
        self.removeAllData()
        self.loadUserDataArray(array)
    }
    
    // Cette méthode permet de supprimer toutes les données de navigation de l'utilisateur considéré
    fileprivate func removeAllData()
    {
        var i = 0
        let compteur = self.data.integer(forKey: self.getPrefix() + "compteur")
        while (i < compteur)
        {
            self.data.removeObject(forKey: self.getPrefix() + "webSite\(i)")
            self.data.removeObject(forKey: self.getPrefix() + "dayWebSite\(i)")
            self.data.removeObject(forKey: self.getPrefix() + "hourWebSite\(i)")
            self.data.removeObject(forKey: self.getPrefix() + "latitudeWebSite\(i)")
            self.data.removeObject(forKey: self.getPrefix() + "longitudeWebSite\(i)")
            self.data.removeObject(forKey: self.getPrefix() + "timeWebSite\(i)")
            i += 1
        }
        self.data.removeObject(forKey: self.getPrefix() + "compteur")
        self.data.synchronize()
    }
    
    // Cette méthode permet de sauvegarder les données tests de l'utilisateur test considéré
    fileprivate func loadUserDataArray(_ array: NSArray)
    {
        var i = 0
        while (i < array.count)
        {
            //[webSite, dayWebSite, hourWebSite, timeWebSite, latitudeWebSite, longitudeWebSite]
            let tab: NSArray = array[i] as! NSArray
            self.data.set(tab[0], forKey: self.getPrefix() + "webSite" + String(i))
            self.data.set(Int(tab[1] as! NSNumber), forKey: self.getPrefix() + "dayWebSite" + String(i))
            self.data.set(Int(tab[2] as! NSNumber), forKey: self.getPrefix() + "hourWebSite" + String(i))
            self.data.set(Double(tab[3] as! NSNumber), forKey: self.getPrefix() + "timeWebSite\(i)")
            self.data.set(Double(tab[4] as! NSNumber), forKey: self.getPrefix() + "latitudeWebSite\(i)")
            self.data.set(Double(tab[5] as! NSNumber), forKey: self.getPrefix() + "longitudeWebSite\(i)")
            i += 1
        }
        self.data.set(array.count, forKey:self.getPrefix() + "compteur")
        self.data.synchronize()
    }
    
    // Cette méthode permet de récupérer l'entier associé au jour considéré
    fileprivate func getIntDay(_ day: String) -> Int
    {
        var i = 0
        let array = ["Lun.", "Mar.", "Mer.", "Jeu.", "Ven.", "Sam.", "Dim."]
        while (i < array.count)
        {
            if (day == array[i])
            {
                return i+1
            }
            i += 1
        }
        return 0
    }
    
}
