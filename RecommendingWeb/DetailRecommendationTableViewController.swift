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
    
    fileprivate let recommendation = Recommendation()
    
    fileprivate var recommendationArray: NSArray = []
    
    fileprivate let locationManager = CLLocationManager()
    
    fileprivate let data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        self.tableView.register(TableViewCellWithImage.classForCoder(), forCellReuseIdentifier:"cell")
        
        self.title = "Recommandations : User\(self.user_id)"
        
        self.data.setUserId(self.user_id)
        
        let date = Date()
        
        let dateFormatter = DateFormatter()
        //dateFormatter.timeZone = TimeZone()
        dateFormatter.dateFormat = "ccc"
        let day = self.getIntDay(dateFormatter.string(from: date))
        
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([NSCalendar.Unit.hour, NSCalendar.Unit.minute], from: date)
        let hour = components.hour
        
        let timeSolt = TimeSolt()
        timeSolt.initTimeSolt(hour!, day: day)
        
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.recommendationArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let webSite = self.recommendationArray[section] as! WebSite
        return webSite.getName()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellWithImage
        
        cell.accessoryType = .none
        
        cell.selectionStyle = .none
        
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
