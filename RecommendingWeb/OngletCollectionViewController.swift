//
//  OngletCollectionViewController.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 13/12/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class OngletCollectionViewController: UICollectionViewController {

    private let sauvegarde = NSUserDefaults()
    
    private var ongletActivatedIndex = 0
    
    internal var mainViewController: MainViewController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(CollectionViewCellWithLabelAndButton.self, forCellWithReuseIdentifier: "cellWithButton")

        self.collectionView?.backgroundColor = UIColor.clearColor()
        
        self.ongletActivatedIndex = self.sauvegarde.integerForKey("ongletActivatedIndex")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func removeOngletAtIndex(index: Int)
    {
        let nbOnglets = self.sauvegarde.integerForKey("nbOnglets")
        var i = index
        while (i + 1 < nbOnglets)
        {
            self.sauvegarde.setObject(self.sauvegarde.stringForKey("onglet_\(i)"), forKey: "onglet_\(i + 1)")
            i += 1
        }
        if (nbOnglets == 1)
        {
            self.sauvegarde.setObject("https://www.google.fr", forKey: "onglet_0")
        }
        else
        {
            self.sauvegarde.removeObjectForKey("onglet_\(i-1)")
            
            self.sauvegarde.setInteger(nbOnglets - 1, forKey: "nbOnglets")
        }
        self.sauvegarde.synchronize()
        
        if (index == self.ongletActivatedIndex)
        {
            // à modifier peut être...
            self.setOngletActivatedIndex(0)
        }
        self.collectionView?.reloadData()
    }
    
    internal func getWebSiteOngletActivated() -> String
    {
        if (self.sauvegarde.integerForKey("nbOnglets") == 0)
        {
            return "https://www.google.fr"
        }
        else
        {
            return self.sauvegarde.stringForKey("onglet_\(self.ongletActivatedIndex)")!
        }
    }
    
    internal func createNewOnglet()
    {
        self.sauvegarde.setObject("https://www.google.fr", forKey: "onglet_\(self.sauvegarde.integerForKey("nbOnglets"))")
        
        self.sauvegarde.setInteger(self.sauvegarde.integerForKey("nbOnglets") + 1, forKey: "nbOnglets")
        
        self.sauvegarde.synchronize()
        
        self.collectionView?.reloadData()
        
        self.setOngletActivatedIndex(self.sauvegarde.integerForKey("nbOnglets") - 1)
    }
    
    private func getCellWidth() -> CGFloat
    {
        if (self.collectionView!.frame.size.width / CGFloat(self.collectionView!.numberOfItemsInSection(0)) < 200.0)
        {
            return 200.0
        }
        return self.collectionView!.frame.size.width / CGFloat(self.collectionView!.numberOfItemsInSection(0))
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if (self.sauvegarde.integerForKey("nbOnglets") == 0)
        {
            return 1
        }
        return self.sauvegarde.integerForKey("nbOnglets")
    }
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        if (self.sauvegarde.integerForKey("nbOnglets") <= 1)
        {
            return CGSizeMake(self.collectionView!.frame.size.width, 40.0)
        }
        return CGSizeMake(self.getCellWidth(), 40.0)
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellWithButton", forIndexPath: indexPath) as! CollectionViewCellWithLabelAndButton
        
        cell.index = indexPath.row
        
        cell.ongletCollectionViewController = self
        
        if (self.sauvegarde.integerForKey("nbOnglets") == 0)
        {
            cell.titleLabel.text = "https://www.google.fr"
            self.sauvegarde.setObject("https://www.google.fr", forKey: "onglet_0")
            self.sauvegarde.synchronize()
        }
        else
        {
            cell.titleLabel.text = self.sauvegarde.stringForKey("onglet_\(indexPath.row)")
        }
        
        /*cell.backgroundColor = UIColor.whiteColor()
        cell.titleLabel.textColor = UIColor.blackColor()
        if (indexPath.row == self.ongletActivatedIndex)
        {
            cell.backgroundColor = UIColor.blackColor()
            cell.titleLabel.textColor = UIColor.whiteColor()
        }*/
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.setOngletActivatedIndex(indexPath.row)
    }
    
    private func setOngletActivatedIndex(index: Int)
    {
        self.ongletActivatedIndex = index
        
        self.sauvegarde.setInteger(self.ongletActivatedIndex, forKey: "ongletActivatedIndex")
        self.sauvegarde.synchronize()
        
        self.collectionView?.reloadData()
        
        self.mainViewController.goToWebSite(self.sauvegarde.stringForKey("onglet_\(self.ongletActivatedIndex)")!)
        // vérifier que quand on change d'onglet on sauvegarde la navigation précédente (pas décrasement ou autre...)
    }

}
