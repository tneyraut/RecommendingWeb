//
//  TimeSolt.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 15/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//
//  Cette classe permet de définir les timeSolt
//

import UIKit

class TimeSolt: NSObject {

    private var hourMin: Int!
    
    private var hourMax: Int!
    
    private var day: Int!
    
    /*
     TimeSolt considérés :
     5h - 9h
     9h - 12h
     12h - 14h
     14h - 19h
     19h - 24h
     0h - 5h
     */
    
    /*
     Jour considérés :
     Lundi : 1
     Mardi : 2
     Mercredi : 3
     Jeudi : 4
     Vendredi : 5
     Samedi : 6
     Dimanche : 7
     */
    
    internal func initTimeSolt(hour: Int, day: Int)
    {
        self.setTimeSoltHourMin(hour)
        self.setTimeSoltHourMax(hour)
        self.day = day
    }
    
    internal func initTimeSolt(hour_min: Int, hour_max: Int, day: Int)
    {
        self.hourMin = hour_min
        self.hourMax = hour_max
        self.day = day
    }
    
    internal func getHourMin() -> Int
    {
        return self.hourMin
    }
    
    internal func getHourMax() -> Int
    {
        return self.hourMax
    }
    
    internal func getDay() -> Int
    {
        return self.day
    }
    
    internal func getPreviousTimeSolt() -> TimeSolt
    {
        let previousTimeSolt = TimeSolt()
        
        previousTimeSolt.initTimeSolt(self.getPreviousTimeSoltHourMin(), hour_max:self.getPreviousTimeSoltHourMax(), day:self.getPreviousTimeSoltDay())
        
        return previousTimeSolt
    }
    
    internal func getNextTimeSolt() -> TimeSolt
    {
        let nextTimeSolt = TimeSolt()
        
        nextTimeSolt.initTimeSolt(self.getNextTimeSoltHourMin(), hour_max:self.getNextTimeSoltHourMax(), day:self.getNextTimeSoltDay())
        
        return nextTimeSolt
    }
    
    internal func getNextDayTimeSolt() -> TimeSolt
    {
        let nextDayTimeSolt = TimeSolt()
        
        nextDayTimeSolt.initTimeSolt(self.hourMin, hour_max: self.hourMax, day: self.getNextDay())
        
        return nextDayTimeSolt
    }
    
    internal func getPreviousDayTimeSolt() -> TimeSolt
    {
        let previousDayTimeSolt = TimeSolt()
        
        previousDayTimeSolt.initTimeSolt(self.hourMin, hour_max: self.hourMax, day: self.getPreviousDay())
        
        return previousDayTimeSolt
    }
    
    private func getPreviousTimeSoltHourMin() -> Int
    {
        if (self.hourMin == 5)
        {
            return 0
        }
        else if (self.hourMin == 9)
        {
            return 5
        }
        else if (self.hourMin == 12)
        {
            return 9
        }
        else if (self.hourMin == 14)
        {
            return 12
        }
        else if (self.hourMin == 19)
        {
            return 14
        }
        return 19
    }
    
    private func getPreviousTimeSoltHourMax() -> Int
    {
        if (self.hourMin == 5)
        {
            return 5
        }
        else if (self.hourMin == 9)
        {
            return 9
        }
        else if (self.hourMin == 12)
        {
            return 12
        }
        else if (self.hourMin == 14)
        {
            return 14
        }
        else if (self.hourMin == 19)
        {
            return 19
        }
        return 24
    }
    
    private func getPreviousTimeSoltDay() -> Int
    {
        if (self.hourMin == 5)
        {
            return self.day
        }
        else if (self.hourMin == 9)
        {
            return self.day
        }
        else if (self.hourMin == 12)
        {
            return self.day
        }
        else if (self.hourMin == 14)
        {
            return self.day
        }
        else if (self.hourMin == 19)
        {
            return self.day
        }
        return self.getPreviousDay()
    }
 
    private func getNextTimeSoltHourMin() -> Int
    {
        if (self.hourMin == 5)
        {
            return 9
        }
        else if (self.hourMin == 9)
        {
            return 12
        }
        else if (self.hourMin == 12)
        {
            return 14
        }
        else if (self.hourMin == 14)
        {
            return 19
        }
        else if (self.hourMin == 19)
        {
            return 0
        }
        return 5
    }
    
    private func getNextTimeSoltHourMax() -> Int
    {
        if (self.hourMin == 5)
        {
            return 12
        }
        else if (self.hourMin == 9)
        {
            return 14
        }
        else if (self.hourMin == 12)
        {
            return 19
        }
        else if (self.hourMin == 14)
        {
            return 24
        }
        else if (self.hourMin == 19)
        {
            return 5
        }
        return 9
    }
    
    private func getNextTimeSoltDay() -> Int
    {
        if (self.hourMin == 5)
        {
            return self.day
        }
        else if (self.hourMin == 9)
        {
            return self.day
        }
        else if (self.hourMin == 12)
        {
            return self.day
        }
        else if (self.hourMin == 14)
        {
            return self.day
        }
        else if (self.hourMin == 19)
        {
            return self.getNextDay()
        }
        return self.day
    }
    
    private func getNextDay() -> Int
    {
        if (self.day < 7)
        {
            return self.day + 1
        }
        return 1
    }
    
    private func getPreviousDay() -> Int
    {
        if (self.day > 1)
        {
            return self.day - 1
        }
        return 7
    }
    
    private func setTimeSoltHourMin(hour: Int)
    {
        self.hourMin = 0
        if (5 <= hour && hour < 9)
        {
            self.hourMin = 5
        }
        else if (9 <= hour && hour < 12)
        {
            self.hourMin = 9
        }
        else if (12 <= hour && hour < 14)
        {
            self.hourMin = 12
        }
        else if (14 <= hour && hour < 19)
        {
            self.hourMin = 14
        }
        else if (19 <= hour && hour < 24)
        {
            self.hourMin = 19
        }
    }
    
    private func setTimeSoltHourMax(hour: Int)
    {
        self.hourMax = 5
        if (5 <= hour && hour < 9)
        {
            self.hourMax = 9
        }
        else if (9 <= hour && hour < 12)
        {
            self.hourMax = 12
        }
        else if (12 <= hour && hour < 14)
        {
            self.hourMax = 14
        }
        else if (14 <= hour && hour < 19)
        {
            self.hourMax = 19
        }
        else if (19 <= hour && hour < 24)
        {
            self.hourMax = 24
        }
    }
    
}
