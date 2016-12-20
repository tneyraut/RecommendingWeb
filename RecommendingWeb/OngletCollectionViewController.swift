//
//  OngletCollectionViewController.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 13/12/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class OngletCollectionViewController: UICollectionViewController {

    fileprivate let sauvegarde = UserDefaults()
    
    fileprivate var ongletActivatedIndex = 0
    
    internal var mainViewController: MainViewController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(CollectionViewCellWithLabelAndButton.self, forCellWithReuseIdentifier: "cellWithButton")

        self.collectionView?.backgroundColor = UIColor.clear
        
        self.ongletActivatedIndex = self.sauvegarde.integer(forKey: "ongletActivatedIndex")
        
        if (self.sauvegarde.integer(forKey: "nbOnglets") == 0)
        {
            self.sauvegarde.set(1, forKey: "nbOnglets")
            self.sauvegarde.set(URL(string: "https://www.google.fr"), forKey: "onglet_0")
            //self.sauvegarde.set("https://www.google.fr", forKey: "onglet_0")
            self.sauvegarde.synchronize()
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func removeOngletAtIndex(_ index: Int)
    {
        let nbOnglets = self.sauvegarde.integer(forKey: "nbOnglets")
        var i = index
        while (i + 1 < nbOnglets)
        {
            self.sauvegarde.set(self.sauvegarde.url(forKey: "onglet_\(i + 1)"), forKey: "onglet_\(i)")
            i += 1
        }
        if (nbOnglets == 1)
        {
            //self.sauvegarde.set("https://www.google.fr", forKey: "onglet_0")
            self.sauvegarde.set(URL(string: "https://www.google.fr"), forKey: "onglet_0")
        }
        else
        {
            self.sauvegarde.removeObject(forKey: "onglet_\(nbOnglets - 1)")
            
            self.sauvegarde.set(nbOnglets - 1, forKey: "nbOnglets")
        }
        self.sauvegarde.synchronize()
        
        if (index == self.ongletActivatedIndex)
        {
            // à modifier peut être...
            self.setOngletActivatedIndex(0)
        }
        else if (index < self.ongletActivatedIndex)
        {
            self.setOngletActivatedIndex(self.ongletActivatedIndex - 1)
        }
        self.collectionView?.reloadData()
    }
    
    internal func getWebSiteOngletActivated() -> URL
    {
        if (self.sauvegarde.integer(forKey: "nbOnglets") == 0)
        {
            return URL(string: "https://www.google.fr")!
        }
        else
        {
            return self.sauvegarde.url(forKey: "onglet_\(self.ongletActivatedIndex)")!
        }
    }
    
    internal func setWebSiteOngletActivated(siteWeb: URL)
    {
        self.sauvegarde.set(siteWeb, forKey: "onglet_\(self.ongletActivatedIndex)")
        self.sauvegarde.synchronize()
        self.collectionView?.reloadData()
    }
    
    internal func createNewOnglet()
    {
        self.sauvegarde.set("https://www.google.fr", forKey: "onglet_\(self.sauvegarde.integer(forKey: "nbOnglets"))")
        self.sauvegarde.set(URL(string: "https://www.google.fr"), forKey: "onglet_\(self.sauvegarde.integer(forKey: "nbOnglets"))")
        
        self.sauvegarde.set(self.sauvegarde.integer(forKey: "nbOnglets") + 1, forKey: "nbOnglets")
        
        self.sauvegarde.synchronize()
        
        self.collectionView?.reloadData()
        
        self.setOngletActivatedIndex(self.sauvegarde.integer(forKey: "nbOnglets") - 1)
    }
    
    fileprivate func getCellWidth() -> CGFloat
    {
        if (self.collectionView!.frame.size.width / CGFloat(self.collectionView!.numberOfItems(inSection: 0)) < 200.0)
        {
            return 200.0
        }
        return self.collectionView!.frame.size.width / CGFloat(self.collectionView!.numberOfItems(inSection: 0))
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if (self.sauvegarde.integer(forKey: "nbOnglets") == 0)
        {
            return 1
        }
        return self.sauvegarde.integer(forKey: "nbOnglets")
    }
    
    func collectionView(_ collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:IndexPath) -> CGSize
    {
        if (self.sauvegarde.integer(forKey: "nbOnglets") <= 1)
        {
            return CGSize(width: self.collectionView!.frame.size.width, height: 40.0)
        }
        return CGSize(width: self.getCellWidth(), height: 40.0)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellWithButton", for: indexPath) as! CollectionViewCellWithLabelAndButton
        
        cell.index = indexPath.row
        
        cell.ongletCollectionViewController = self
        
        if (indexPath.row == self.ongletActivatedIndex)
        {
            cell.backgroundColor = UIColor.lightGray
            //cell.titleLabel.textColor = UIColor.green
        }
        else
        {
            cell.backgroundColor = UIColor.darkGray
            //cell.titleLabel.textColor = UIColor.black
        }
        cell.titleLabel.text = self.sauvegarde.url(forKey: "onglet_\(indexPath.row)")?.host
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.setOngletActivatedIndex(indexPath.row)
    }
    
    fileprivate func setOngletActivatedIndex(_ index: Int)
    {
        self.ongletActivatedIndex = index
        
        self.sauvegarde.set(self.ongletActivatedIndex, forKey: "ongletActivatedIndex")
        self.sauvegarde.synchronize()
        
        //self.collectionView?.reloadData()
        
        self.mainViewController.goToWebSite((self.sauvegarde.url(forKey: "onglet_\(self.ongletActivatedIndex)")?.absoluteString)!)
        // vérifier que quand on change d'onglet on sauvegarde la navigation précédente (pas décrasement ou autre...)
    }

}
