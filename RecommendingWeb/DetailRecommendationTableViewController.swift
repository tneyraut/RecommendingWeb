//
//  DetailRecommendationTableViewController.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 29/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//
//  Cette classe définit l'interface présentant en détails les recommandations pour l'utilisateur considéré
//

import UIKit
import CoreLocation

class DetailRecommendationTableViewController: UITableViewController {

    internal var user_id: Int!
    
    private let recommendation = Recommendation()
    
    private var recommendationArray: NSArray = []
    
    private let locationManager = CLLocationManager()
    
    private let data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView.registerClass(TableViewCellWithImage.classForCoder(), forCellReuseIdentifier:"cell")
        
        self.title = "Recommandations : User\(self.user_id)"
        
        self.data.setUserId(self.user_id)
        
        let date = NSDate()
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone()
        dateFormatter.dateFormat = "ccc"
        let day = self.getIntDay(dateFormatter.stringFromDate(date))
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([NSCalendarUnit.Hour, NSCalendarUnit.Minute], fromDate: date)
        let hour = components.hour
        
        let timeSolt = TimeSolt()
        timeSolt.initTimeSolt(hour, day: day)
        
        self.recommendationArray = self.recommendation.getRecommendationArrayForTimeSolt(timeSolt, latitude: round(1000 * (self.locationManager.location?.coordinate.latitude)!) / 1000, longitude: round(1000 * (self.locationManager.location?.coordinate.longitude)!) / 1000, data: self.data)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.recommendationArray.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75.0
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let webSite = self.recommendationArray[section] as! WebSite
        return webSite.getName()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCellWithImage
        
        cell.accessoryType = .None
        
        cell.selectionStyle = .None
        
        let webSite  = self.recommendationArray[indexPath.section] as! WebSite
        
        if (indexPath.row == 0)
        {
            cell.imageView?.image = UIImage(named: "iconCalculator.png")
            
            cell.textLabel?.text = String(webSite.getScore())
        }
        else if (indexPath.row == 1)
        {
            cell.imageView?.image = UIImage(named: "iconTime.png")
            
            cell.textLabel?.text = "\(webSite.getTime())s"
        }
        
        return cell
    }
    
}
