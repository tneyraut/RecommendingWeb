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
    
    internal static let numberOfUser: Int = 8;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        self.tableView.register(TableViewCellWithImage.classForCoder(), forCellReuseIdentifier:"cell")
        
        self.title = "Sélection d'un utilisateur"
        
        let buttonPrevious = UIBarButtonItem(title: "Retour", style: .done, target: nil, action: nil)
        
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

    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setToolbarHidden(false, animated:true)
        
        self.navigationController?.toolbar.barTintColor = UIColor(red:0.439, green:0.776, blue:0.737, alpha:1)
        
        let shadow = NSShadow()
        
        shadow.shadowColor = UIColor(red:0.0, green:0.0, blue:0.0, alpha:0.8)
        
        shadow.shadowOffset = CGSize(width: 0, height: 1)
        
        let showDataButton = UIBarButtonItem(title:"Show data", style:.plain, target:self, action:#selector(self.showDataButtonActionListener))
        
        showDataButton.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red:245.0/255.0, green:245.0/255.0, blue:245.0/255.0, alpha:1.0), NSShadowAttributeName: shadow, NSFontAttributeName: UIFont(name:"HelveticaNeue-CondensedBlack", size:21.0)!], for:UIControlState())
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target:nil, action:nil)
        
        self.navigationController?.toolbar.setItems([flexibleSpace, showDataButton, flexibleSpace], animated:true)
        
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated:true)
        
        super.viewDidDisappear(animated)
    }
    
    @objc fileprivate func showDataButtonActionListener()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let detailsDataCollectionViewController = DetailsDataCollectionViewController(collectionViewLayout: layout)
        
        detailsDataCollectionViewController.numberOfUser = UsersTableViewController.numberOfUser
        
        self.navigationController?.pushViewController(detailsDataCollectionViewController, animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UsersTableViewController.numberOfUser
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellWithImage

        cell.accessoryType = .detailDisclosureButton
        
        cell.imageView?.image = UIImage(named: "iconUser.png")
        
        cell.textLabel?.numberOfLines = 0
        
        cell.textLabel?.lineBreakMode = .byWordWrapping
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainViewController = MainViewController()
        
        mainViewController.user_id = indexPath.row
        
        self.navigationController?.pushViewController(mainViewController, animated:true)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let detailRecommendationTableViewController = DetailRecommendationTableViewController(style: .plain)
        
        detailRecommendationTableViewController.user_id = indexPath.row
        
        self.navigationController?.pushViewController(detailRecommendationTableViewController, animated: true)
    }

}
