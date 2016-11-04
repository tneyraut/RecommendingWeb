//
//  Data.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 06/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit
import CoreLocation

class Data: NSObject {
    
    private var user_id = 0
    
    private let data = NSUserDefaults()
    
    private var lastWebSiteVisited: NSString = ""
    
    internal func setUserId(id: Int)
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
    
    internal func getAllData(numberOfUser: Int) -> NSArray
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
            let compteur = self.data.integerForKey(self.getPrefix() + "compteur")
            var j = 0
            while (j < compteur)
            {
                //["User", "Site Web", "Day", "Hour", "Time", "Latitude", "Longitude"]
                let tab: NSArray = [
                    "\(self.user_id)",
                    self.data.stringForKey(self.getPrefix() + "webSite\(j)")!,
                    "\(self.data.integerForKey(self.getPrefix() + "dayWebSite\(j)"))",
                    "\(self.data.integerForKey(self.getPrefix() + "hourWebSite\(j)"))",
                    "\(self.data.doubleForKey(self.getPrefix() + "timeWebSite\(j)"))",
                    "\(self.data.doubleForKey(self.getPrefix() + "latitudeWebSite\(j)"))",
                    "\(self.data.doubleForKey(self.getPrefix() + "longitudeWebSite\(j)"))"
                ]
                array.addObject(tab)
                j += 1
            }
            i += 1
        }
        return array
    }
    
    private func getPrefix() -> String
    {
        return "user" + String(self.user_id) + "_"
    }
    
    // initialement le compteur est à 0. Les indices vont de 0 à ...
    // récupère l'url host parfaite
    internal func saveData(url: NSString, latitude: Double, longitude: Double)
    {
        //print(url)
        if (url.containsString("https://www.google."))
        {
            self.lastWebSiteVisited = url
            Timer.stopTimerAndSaveTime()
            return
        }
        else if (self.data.integerForKey(self.getPrefix() + "compteur") == 0)
        {
            self.lastWebSiteVisited = url
            self.addWebSite(url, latitude: latitude, longitude: longitude)
            return
        }
        
        let dayLastSave = self.data.integerForKey(self.getPrefix() + "dayWebSite" + String(self.data.integerForKey(self.getPrefix() + "compteur") - 1))
        let hourLastSave = self.data.integerForKey(self.getPrefix() + "hourWebSite" + String(self.data.integerForKey(self.getPrefix() + "compteur") - 1))
        
        let date = NSDate()
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone()
        dateFormatter.dateFormat = "ccc"
        let day = self.getIntDay(dateFormatter.stringFromDate(date))
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([NSCalendarUnit.Hour], fromDate: date)
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
    private func addWebSite(string: NSString, latitude: Double, longitude: Double)
    {
        Timer.stopTimerAndSaveTime()
        Timer.startTimer()
        
        let date = NSDate()
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone()
        dateFormatter.dateFormat = "ccc"
        let day = self.getIntDay(dateFormatter.stringFromDate(date))
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([NSCalendarUnit.Hour], fromDate: date)
        let hour = components.hour
        
        self.data.setObject(string, forKey:self.getPrefix() + "webSite" + String(self.data.integerForKey(self.getPrefix() + "compteur")))
        self.data.setInteger(day, forKey:self.getPrefix() + "dayWebSite" + String(self.data.integerForKey(self.getPrefix() + "compteur")))
        self.data.setInteger(hour, forKey:self.getPrefix() + "hourWebSite" + String(self.data.integerForKey(self.getPrefix() + "compteur")))
        self.data.setDouble(latitude, forKey:self.getPrefix() + "latiudeWebSite" + String(self.data.integerForKey(self.getPrefix() + "compteur")))
        self.data.setDouble(longitude, forKey:self.getPrefix() + "longitudeWebSite" + String(self.data.integerForKey(self.getPrefix() + "compteur")))
        
        self.data.setInteger(self.data.integerForKey(self.getPrefix() + "compteur") + 1, forKey: self.getPrefix() + "compteur")
        
        self.data.synchronize()
    }
    
    internal func saveTime()
    {
        print("save time : \(Timer.getTime())")
        let indice = self.data.integerForKey(self.getPrefix() + "compteur") - 1
        self.data.setDouble(self.data.doubleForKey(self.getPrefix() + "timeWebSite\(indice)") + Timer.getTime(), forKey: self.getPrefix() + "timeWebSite\(indice)")
    }
    
    private func removeOldData()
    {
        // on supprime les données les plus anciennes
        // si on a plus de 4 semaines de données 
        // on doit toujours avoir 4 semaines de données 
        // donc 4*7 = 28 jours différents
        // dès qu'on a plus on supprime les données associées au premier jour
        while (self.getNumberOfDay() > 28)
        {
            let day = self.data.integerForKey(self.getPrefix() + "dayWebSite0")
            while (day == self.data.integerForKey(self.getPrefix() + "dayWebSite0"))
            {
                self.removeDataAtIndex(0)
            }
        }
    }
    
    private func getNumberOfDay() -> Int
    {
        if (self.data.integerForKey(self.getPrefix() + "compteur") <= 0)
        {
            return 0
        }
        var resultat = 1
        var i = 1
        var currentDay = self.data.integerForKey(self.getPrefix() + "dayWebSite0")
        while (i < self.data.integerForKey(self.getPrefix() + "compteur"))
        {
            if (currentDay != self.data.integerForKey(self.getPrefix() + "dayWebSite" + String(i)))
            {
                currentDay = self.data.integerForKey(self.getPrefix() + "dayWebSite" + String(i))
                resultat += 1
            }
            i += 1
        }
        return resultat
    }
    
    // une méthode de ce type pourrait être plus rapide...
    //private func removeDataUntilIndex(index: Int)
    private func removeDataAtIndex(index: Int)
    {
        if (index >= self.data.integerForKey(self.getPrefix() + "compteur") || index < 0)
        {
            return
        }
        var i = index
        while (i < self.data.integerForKey(self.getPrefix() + "compteur") - 1)
        {
            self.data.setObject(self.data.stringForKey(self.getPrefix() + "webSite" + String(i+1)), forKey: self.getPrefix() + "webSite" + String(i))
            self.data.setInteger(self.data.integerForKey(self.getPrefix() + "dayWebSite" + String(i+1)), forKey: self.getPrefix() + "dayWebSite" + String(i))
            self.data.setInteger(self.data.integerForKey(self.getPrefix() + "hourWebSite" + String(i+1)), forKey: self.getPrefix() + "hourWebSite" + String(i))
            self.data.setDouble(self.data.doubleForKey(self.getPrefix() + "latitudeWebSite\(i+1)"), forKey: self.getPrefix() + "latitudeWebSite\(i)")
            self.data.setDouble(self.data.doubleForKey(self.getPrefix() + "longitudeWebSite\(i+1)"), forKey: self.getPrefix() + "longitudeWebSite\(i)")
            self.data.setDouble(self.data.doubleForKey(self.getPrefix() + "timeWebSite\(i+1)"), forKey: self.getPrefix() + "timeWebSite\(i)")
            i += 1
        }
        self.data.setInteger(self.data.integerForKey(self.getPrefix() + "compteur") - 1, forKey: self.getPrefix() + "compteur")
        self.data.removeObjectForKey(self.getPrefix() + "webSite" + String(self.data.integerForKey(self.getPrefix() + "compteur")))
        self.data.removeObjectForKey(self.getPrefix() + "dayWebSite" + String(self.data.integerForKey(self.getPrefix() + "compteur")))
        self.data.removeObjectForKey(self.getPrefix() + "hourWebSite" + String(self.data.integerForKey(self.getPrefix() + "compteur")))
        self.data.removeObjectForKey(self.getPrefix() + "latitudeWebSite\(self.data.integerForKey(self.getPrefix() + "compteur"))")
        self.data.removeObjectForKey(self.getPrefix() + "longitudeWebSite\(self.data.integerForKey(self.getPrefix() + "compteur"))")
        self.data.removeObjectForKey(self.getPrefix() + "timeWebSite\(self.data.integerForKey(self.getPrefix() + "compteur"))")
        
        self.data.synchronize()
    }
    
    internal func getWebSiteViewForTimeSolt(timeSolt: TimeSolt) -> NSMutableArray
    {
        let array = NSMutableArray()
        
        let compteur = self.data.integerForKey(self.getPrefix() + "compteur")
        var i = 0
        while (i < compteur)
        {
            let day = self.data.integerForKey(self.getPrefix() + "dayWebSite" + String(i))
            let hour = self.data.integerForKey(self.getPrefix() + "hourWebSite" + String(i))
            if (day == timeSolt.getDay() && timeSolt.getHourMin() <= hour && hour < timeSolt.getHourMax())
            {
                let webSiteAddress = self.data.stringForKey(self.getPrefix() + "webSite" + String(i))
                let time = self.data.doubleForKey(self.getPrefix() + "timeWebSite\(i)")
                let indice = self.webSiteAlreadyInArray(webSiteAddress!, array: array)
                if (indice == -1)
                {
                    let webSite = WebSite()
                    webSite.initWebSite(webSiteAddress!, time: time)
                    array.addObject(webSite)
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
    
    private func webSiteAlreadyInArray(webSiteAddress: String, array: NSArray) -> Int
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
    
    internal func getSiteWebForLocation(latitude: Double, longitude: Double) -> NSArray
    {
        let array = NSMutableArray()
        
        let compteur = self.data.integerForKey(self.getPrefix() + "compteur")
        var i = 0
        while (i < compteur)
        {
            let lat = self.data.doubleForKey(self.getPrefix() + "latitudeWebSite\(i)")
            let lon = self.data.doubleForKey(self.getPrefix() + "longitudeWebSite\(i)")
            if (lat == latitude && lon == longitude)
            {
                let webSite = WebSite()
                webSite.initWebSite(self.data.stringForKey(self.getPrefix() + "webSite\(i)")!, time: 0.0)
                // aspect que l'on met en avant avec coeff
                webSite.addScore(self.data.doubleForKey(self.getPrefix() + "timeWebSite\(i)"), coeff: 2.0)
                
                array.addObject(webSite)
            }
            i += 1
        }
        return array
    }
    
    private func loadUserData()
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
        self.removeAllData()
        self.loadUserDataArray(array)
    }
    
    private func removeAllData()
    {
        var i = 0
        let compteur = self.data.integerForKey(self.getPrefix() + "compteur")
        while (i < compteur)
        {
            self.data.removeObjectForKey(self.getPrefix() + "webSite\(i)")
            self.data.removeObjectForKey(self.getPrefix() + "dayWebSite\(i)")
            self.data.removeObjectForKey(self.getPrefix() + "hourWebSite\(i)")
            self.data.removeObjectForKey(self.getPrefix() + "latitudeWebSite\(i)")
            self.data.removeObjectForKey(self.getPrefix() + "longitudeWebSite\(i)")
            self.data.removeObjectForKey(self.getPrefix() + "timeWebSite\(i)")
            i += 1
        }
        self.data.removeObjectForKey(self.getPrefix() + "compteur")
        self.data.synchronize()
    }
    
    private func loadUserDataArray(array: NSArray)
    {
        var i = 0
        while (i < array.count)
        {
            //[webSite, dayWebSite, hourWebSite, timeWebSite, latitudeWebSite, longitudeWebSite]
            let tab: NSArray = array[i] as! NSArray
            self.data.setObject(tab[0], forKey: self.getPrefix() + "webSite" + String(i))
            self.data.setInteger(Int(tab[1] as! NSNumber), forKey: self.getPrefix() + "dayWebSite" + String(i))
            self.data.setInteger(Int(tab[2] as! NSNumber), forKey: self.getPrefix() + "hourWebSite" + String(i))
            self.data.setDouble(Double(tab[3] as! NSNumber), forKey: self.getPrefix() + "timeWebSite\(i)")
            self.data.setDouble(Double(tab[4] as! NSNumber), forKey: self.getPrefix() + "latitudeWebSite\(i)")
            self.data.setDouble(Double(tab[5] as! NSNumber), forKey: self.getPrefix() + "longitudeWebSite\(i)")
            i += 1
        }
        self.data.setInteger(array.count, forKey:self.getPrefix() + "compteur")
        self.data.synchronize()
    }
    
    private func getIntDay(day: String) -> Int
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
