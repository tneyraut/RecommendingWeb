//
//  DetailsDataCollectionViewController.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 29/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//
//  Cette classe définit l'interface permettant de visualiser l'ensemble des données de navigation présentes sur l'application
//

import UIKit

private let reuseIdentifier = "Cell"

class DetailsDataCollectionViewController: UICollectionViewController {
    
    fileprivate var dataArray: NSArray = []
    
    fileprivate let data = Data()
    
    internal var numberOfUser: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(CollectionViewCellWithLabel.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.dataArray = self.data.getAllData(self.numberOfUser)
        
        self.title = "Détails des données"
        
        self.collectionView?.backgroundColor = UIColor.clear
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        self.collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 + self.dataArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 7
    }

    func collectionView(_ collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:IndexPath) -> CGSize
    {
        let size = Int(self.view.frame.size.width / 7)
        return CGSize(width: CGFloat(size), height: CGFloat(size))
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCellWithLabel
    
        if (indexPath.section == 0)
        {
            let array = ["User", "Site Web", "Day", "Hour", "Time", "Latitude", "Longitude"]
            
            cell.titleLabel.text = array[indexPath.row]
        }
        else
        {
            let array: NSArray = self.dataArray[indexPath.section - 1] as! NSArray
            
            cell.titleLabel.text = array[indexPath.row] as? String
        }
        return cell
    }

}
