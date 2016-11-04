//
//  WebSite.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 16/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class WebSite: NSObject {

    private var address: String!
    
    private var score: Double!
    
    private var time: Double!
    
    internal func initWebSite(address: String, time: Double)
    {
        self.address = address
        self.score = 0
        self.time = time
    }
    
    internal func getAddress() -> String
    {
        return self.address
    }
    
    internal func getName() -> String
    {
        var name: String = (NSURL(string: self.address)?.host)!
        
        let array: NSArray = ["www.", ".fr", "http://", "https://", ".ca", ".com", ".net", "fr.", "en.", ".en"]
        
        var i = 0
        while (i < array.count)
        {
            name = name.stringByReplacingOccurrencesOfString(array[i] as! String, withString:"")
            i += 1
        }
        return name
    }
    
    internal func addTime(time: Double)
    {
        self.time = self.time + time
    }
    
    internal func getTime() -> Double
    {
        return self.time
    }
    
    internal func addScore(score: Double, coeff: Double)
    {
        self.score = self.score + score * coeff
    }
    
    internal func getScore() -> Double
    {
        return self.score
    }
    
    internal func normalizationScore(norm: Double)
    {
        if (norm != 0)
        {
            self.score = self.score / norm
        }
    }
    
}
