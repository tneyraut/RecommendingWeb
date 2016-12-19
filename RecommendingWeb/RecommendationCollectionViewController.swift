//
//  RecommendationCollectionViewController.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 05/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//
// Cette classe définit l'interface permettant d'afficher les recomandations faites à l'utilisateur. Cette interface est intégrée à l'interface définit par la classe MainViewController
//

import UIKit
import CoreLocation

private let reuseIdentifier = "Cell"

class RecommendationCollectionViewController: UICollectionViewController {

    private var cellSize = CGFloat(80.0)
    
    private let recommendation = Recommendation()
    
    internal var data: Data! = nil
    
    private var recommendationArray: NSArray = []
    
    internal var mainViewController: MainViewController! = nil
    
    internal var locationManager: CLLocationManager! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(CollectionViewCellWithLabel.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView?.backgroundColor = UIColor.clearColor()
        
        self.setRecommandationArray()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.reloadData), name: UIApplicationWillEnterForegroundNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func reloadData()
    {
        self.setRecommandationArray()
        
        self.collectionView?.reloadData()
    }
    
    private func setRecommandationArray()
    {
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
    }
    
    /*
     Lun.
     Mar.
     Mer.
     Jeu.
     Ven.
     Sam.
     Dim.
     */
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

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if (self.recommendationArray.count == 0)
        {
            self.collectionView?.frame = CGRectMake(0, self.collectionView!.frame.origin.y, self.view.frame.size.width, self.collectionView!.frame.size.height)
            return 1
        }
        return self.recommendationArray.count
    }
    
    /*func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        if (self.recommendationArray.count == 0)
        {
            return CGSizeMake(self.collectionView!.frame.size.width,self.cellSize)
        }
        return CGSizeMake(self.cellSize,self.cellSize)
    }*/

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCellWithLabel
        
        var width = self.cellSize
        if (self.recommendationArray.count == 0)
        {
            width = self.collectionView!.frame.size.width
        }
        
        if (UIApplication.sharedApplication().statusBarOrientation.isPortrait)
        {
            cell.frame = CGRectMake(cell.frame.origin.x, -63.5, width, self.cellSize)
        }
        else
        {
            cell.frame = CGRectMake(cell.frame.origin.x, -32, width, self.cellSize)
        }
        
        if (self.recommendationArray.count == 0)
        {
            cell.titleLabel.text = "Aucune recommandation disponible"
        }
        else
        {
            let webSite = self.recommendationArray[indexPath.row] as! WebSite
            cell.titleLabel.text = webSite.getName()
        }
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if (self.recommendationArray.count > 0)
        {
            let webSite = self.recommendationArray[indexPath.row] as! WebSite
            self.mainViewController.goToWebSite(webSite.getAddress())
        }
    }
    
}
