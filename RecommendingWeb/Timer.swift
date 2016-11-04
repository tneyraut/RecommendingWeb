//
//  Timer.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 23/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class Timer: NSObject {

    private static var timer: NSTimer! = nil
    private static var time: Double = 0.0
    private static var data: Data! = nil

    internal static func initTimer(data: Data)
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
        //print("start timer")
        Timer.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(self.timerActionListener), userInfo: nil, repeats: true)
    }
    
    @objc private static func timerActionListener()
    {
        Timer.time += 0.1
        //print(Timer.time)
    }
    
    internal static func getTime() -> Double
    {
        return Timer.time
    }
    
}
