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

    fileprivate var cellSize = CGFloat(80.0)
    
    fileprivate let recommendation = Recommendation()
    
    internal var data: Data! = nil
    
    fileprivate var recommendationArray: NSArray = []
    
    internal var mainViewController: MainViewController! = nil
    
    internal var locationManager: CLLocationManager! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(CollectionViewCellWithLabel.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView?.backgroundColor = UIColor.clear
        
        if (CLLocationManager.authorizationStatus() ==  CLAuthorizationStatus.authorizedAlways)
        {
            self.setRecommandationArray()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadData), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc fileprivate func reloadData()
    {
        self.setRecommandationArray()
        
        self.collectionView?.reloadData()
    }
    
    fileprivate func setRecommandationArray()
    {
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

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if (self.recommendationArray.count == 0)
        {
            self.collectionView?.frame = CGRect(x: 0, y: self.collectionView!.frame.origin.y, width: self.view.frame.size.width, height: self.collectionView!.frame.size.height)
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

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCellWithLabel
        
        var width = self.cellSize
        if (self.recommendationArray.count == 0)
        {
            width = self.collectionView!.frame.size.width
        }
        
        if (UIApplication.shared.statusBarOrientation.isPortrait)
        {
            cell.frame = CGRect(x: cell.frame.origin.x, y: -63.5, width: width, height: self.cellSize)
        }
        else
        {
            cell.frame = CGRect(x: cell.frame.origin.x, y: -32, width: width, height: self.cellSize)
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (self.recommendationArray.count > 0)
        {
            let webSite = self.recommendationArray[indexPath.row] as! WebSite
            self.mainViewController.goToWebSite(webSite.getAddress())
        }
    }
    
}
