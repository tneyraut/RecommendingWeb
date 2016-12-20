//
//  Timer.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 23/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//
//  Cette classe static permet de définir le timer permettant de comptabilisé le temps de navigation sur les différents sites
//

import UIKit

class Timer: NSObject {

    fileprivate static var timer: Foundation.Timer! = nil
    fileprivate static var time: Double = 0.0
    fileprivate static var data: Data! = nil

    internal static func initTimer(_ data: Data)
    {
        if (Timer.data == nil)
        {
            Timer.data = data
        }
    }
    
    internal static func stopTimerAndSaveTime()
    {
        if (Timer.timer == nil)
        {
            return 
        }
        Timer.timer.invalidate()
        self.saveTime()
        Timer.time = 0.0
    }
    
    internal static func saveTime()
    {
        if (Timer.time != 0.0 && Timer.data != nil)
        {
            Timer.data.saveTime()
            Timer.time = 0.0
        }
    }
    
    internal static func startTimer()
    {
        Timer.timer = Foundation.Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.timerActionListener), userInfo: nil, repeats: true)
    }
    
    @objc fileprivate static func timerActionListener()
    {
        Timer.time += 0.1
    }
    
    internal static func getTime() -> Double
    {
        return Timer.time
    }
    
}
