//
//  UsersTableViewController.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 18/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//
//  Cette classe définit la première interface de l'application. Cette interface permet de sélection un utilisateur, visualiser toutes les données de navigation présentes sur l'application, et visualiser en détails les recommandations pour chaque utilisateur
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    internal static let numberOfUser: Int = 3;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView.registerClass(TableViewCellWithImage.classForCoder(), forCellReuseIdentifier:"cell")
        
        self.title = "Sélection d'un utilisateur"
        
        let buttonPrevious = UIBarButtonItem(title: "Retour", style: .Done, target: nil, action: nil)
        
        self.navigationItem.backBarButtonItem = buttonPrevious
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        self.navigationController?.setToolbarHidden(false, animated:true)
        
        self.navigationController?.toolbar.barTintColor = UIColor(red:0.439, green:0.776, blue:0.737, alpha:1)
        
        let shadow = NSShadow()
        
        shadow.shadowColor = UIColor(red:0.0, green:0.0, blue:0.0, alpha:0.8)
        
        shadow.shadowOffset = CGSizeMake(0, 1)
        
        let showDataButton = UIBarButtonItem(title:"Show data", style:.Plain, target:self, action:#selector(self.showDataButtonActionListener))
        
        showDataButton.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red:245.0/255.0, green:245.0/255.0, blue:245.0/255.0, alpha:1.0), NSShadowAttributeName: shadow, NSFontAttributeName: UIFont(name:"HelveticaNeue-CondensedBlack", size:21.0)!], forState:UIControlState.Normal)
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target:nil, action:nil)
        
        self.navigationController?.toolbar.setItems([flexibleSpace, showDataButton, flexibleSpace], animated:true)
        
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated:true)
        
        super.viewDidDisappear(animated)
    }
    
    @objc private func showDataButtonActionListener()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let detailsDataCollectionViewController = DetailsDataCollectionViewController(collectionViewLayout: layout)
        
        detailsDataCollectionViewController.numberOfUser = 3
        
        self.navigationController?.pushViewController(detailsDataCollectionViewController, animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UsersTableViewController.numberOfUser
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75.0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCellWithImage

        cell.accessoryType = .DetailDisclosureButton
        
        cell.imageView?.image = UIImage(named: "iconUser.png")
        
        if (indexPath.row == 0)
        {
            cell.textLabel?.text = "User" + String(indexPath.row) + " (utilisateur initialement vide)"
        }
        else
        {
            cell.textLabel?.text = "User" + String(indexPath.row) + " (utilisateur test)"
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let mainViewController = MainViewController()
        
        mainViewController.user_id = indexPath.row
        
        self.navigationController?.pushViewController(mainViewController, animated:true)
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        let detailRecommendationTableViewController = DetailRecommendationTableViewController(style: .Plain)
        
        detailRecommendationTableViewController.user_id = indexPath.row
        
        self.navigationController?.pushViewController(detailRecommendationTableViewController, animated: true)
    }

}
