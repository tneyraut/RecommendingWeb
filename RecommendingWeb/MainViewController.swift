//
//  MainViewController.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 05/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//
//  Cette interface est l'unique interface que l'application finale disposera. Cette interface permet à l'utilisateur de naviguer sur le web et propose les recommandations à l'utilisateur
//

import UIKit
import CoreLocation

class MainViewController: UIViewController, UIWebViewDelegate, UISearchBarDelegate, CLLocationManagerDelegate {
    
    private var recommandationCollectionViewController:RecommendationCollectionViewController! = nil
    
    private let webView = UIWebView()
    
    private var buttonPrevious: UIBarButtonItem! = nil
    
    private var buttonForward: UIBarButtonItem! = nil
    
    private let searchBar = UISearchBar()
    
    private let data = Data()
    
    private let locationManager = CLLocationManager()
    
    internal var user_id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.initTimer(self.data)
        
        self.locationManager.delegate = self
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
        //print("INIT = \(self.locationManager.location?.coordinate.latitude) \(self.locationManager.location?.coordinate.longitude)")
        //print(round(1000 * (self.locationManager.location?.coordinate.latitude)!) / 1000)
        
        self.data.setUserId(self.user_id)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        self.recommandationCollectionViewController = RecommendationCollectionViewController(collectionViewLayout: layout)
        self.recommandationCollectionViewController.data = self.data
        self.recommandationCollectionViewController.locationManager = self.locationManager
        self.recommandationCollectionViewController.mainViewController = self
        self.recommandationCollectionViewController.collectionView?.frame = CGRectMake(0, (self.navigationController?.navigationBar.frame.size.height)! + 20.0, self.view.frame.size.width, 80.0)
        
        self.view.addSubview(self.recommandationCollectionViewController.collectionView!)
        
        var y = (self.recommandationCollectionViewController.collectionView?.frame.origin.y)! + (self.recommandationCollectionViewController.collectionView?.frame.size.height)!
        
        self.webView.frame = CGRectMake(0, y, self.view.frame.size.width, self.view.frame.size.height - y)
        self.webView.delegate = self
        self.webView.loadRequest(NSURLRequest(URL:NSURL(string:"https://www.google.fr")!))
        self.view.addSubview(self.webView)
        
        let shadow = NSShadow()
        shadow.shadowColor = UIColor(red:0.0, green:0.0, blue:0.0, alpha:0.8)
        shadow.shadowOffset = CGSizeMake(0, 1)
        
        self.buttonPrevious = UIBarButtonItem(title:"<-", style:UIBarButtonItemStyle.Done, target:self, action:#selector(self.buttonPreviousActionListener))
        self.buttonPrevious.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red:245.0/255.0, green:245.0/255.0, blue:245.0/255.0, alpha:1.0), NSShadowAttributeName: shadow, NSFontAttributeName: UIFont(name:"HelveticaNeue-CondensedBlack", size:30.0)!], forState:UIControlState.Normal)
        self.setButtonPreviousHidden()
        
        self.buttonForward = UIBarButtonItem(title:"->", style:UIBarButtonItemStyle.Done, target:self, action:#selector(self.buttonForwardActionListener))
        self.buttonForward.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red:245.0/255.0, green:245.0/255.0, blue:245.0/255.0, alpha:1.0), NSShadowAttributeName: shadow, NSFontAttributeName: UIFont(name:"HelveticaNeue-CondensedBlack", size:30.0)!], forState:UIControlState.Normal)
        self.setButtonForwardHidden()
        
        self.navigationItem.leftBarButtonItem = self.buttonPrevious
        self.navigationItem.rightBarButtonItem = self.buttonForward
        
        self.searchBar.delegate = self
        let x = CGFloat(50.0)
        y = 10.0
        self.searchBar.frame = CGRectMake(x, y, self.view.frame.size.width - 2 * x, (self.navigationController?.navigationBar.frame.size.height)! - 2 * y)
        self.searchBar.keyboardType = .WebSearch
        
        let toolbarDone = UIToolbar()
        toolbarDone.sizeToFit()
        let barButtonDone = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(self.buttonDoneActionListener))
        toolbarDone.items = [barButtonDone]
        self.searchBar.inputAccessoryView = toolbarDone
        
        self.navigationController?.navigationBar.addSubview(self.searchBar)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        if (fromInterfaceOrientation.isPortrait)
        {
            self.recommandationCollectionViewController.collectionView?.frame = CGRectMake(0, 32.0, self.view.frame.size.width, 80.0)
        }
        else
        {
            self.recommandationCollectionViewController.collectionView?.frame = CGRectMake(0, (self.navigationController?.navigationBar.frame.size.height)! + 20.0, self.view.frame.size.width, 80.0)
        }
        self.recommandationCollectionViewController.collectionView?.reloadData()
        
        let y = (self.recommandationCollectionViewController.collectionView?.frame.origin.y)! + (self.recommandationCollectionViewController.collectionView?.frame.size.height)!
        
        self.webView.frame = CGRectMake(0, y, self.view.frame.size.width, self.view.frame.size.height - y)
        
        self.searchBar.frame = CGRectMake(self.searchBar.frame.origin.x, self.searchBar.frame.origin.y, self.view.frame.size.width - 2 * self.searchBar.frame.origin.x, (self.navigationController?.navigationBar.frame.size.height)! - 2 * self.searchBar.frame.origin.y)
    }

    @objc private func buttonPreviousActionListener()
    {
        if (self.webView.canGoBack)
        {
            self.webView.goBack()
        }
    }
    
    private func setButtonPreviousHidden()
    {
        if (self.webView.canGoBack)
        {
            self.buttonPrevious.title = "<-"
        }
        else
        {
            self.buttonPrevious.title = ""
        }
    }
    
    @objc private func buttonForwardActionListener()
    {
        if (self.webView.canGoForward)
        {
            self.webView.goForward()
        }
    }
    
    private func setButtonForwardHidden()
    {
        if (self.webView.canGoForward)
        {
            self.buttonForward.title = "->"
        }
        else
        {
            self.buttonForward.title = ""
        }
    }
    
    @objc internal func webViewDidFinishLoad(webView: UIWebView) {
        self.setButtonPreviousHidden()
        self.setButtonForwardHidden()
        
        let currentURL: NSString = (webView.request?.URL?.scheme)! + "://" + (webView.request?.URL?.host)!
        
        //print("\(self.locationManager.location?.coordinate.latitude) \(self.locationManager.location?.coordinate.longitude)")
        
        //print((webView.request?.URL?.scheme)! + " + " + (webView.request?.URL?.host)!)
        //print(currentURL)
        
        self.data.saveData(currentURL, latitude: round(1000 * (self.locationManager.location?.coordinate.latitude)!) / 1000, longitude: round(1000 * (self.locationManager.location?.coordinate.longitude)!) / 1000)
    }
    
    @objc internal func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        
        let string = self.searchBar.text?.stringByReplacingOccurrencesOfString(" ", withString: "+")
        if (UIApplication.sharedApplication().canOpenURL(NSURL(string: (string?.lowercaseString)!)!))
        {
            self.webView.loadRequest(NSURLRequest(URL:NSURL(string: (string?.lowercaseString)!)!))
        }
        else
        {
            let url = NSURL(string: "https://www.google.fr/#q=" + string!)
            self.webView.loadRequest(NSURLRequest(URL: url!))
        }
    }
    
    @objc private func buttonDoneActionListener()
    {
        self.searchBar.resignFirstResponder()
    }
    
    internal func goToWebSite(string: NSString)
    {
        let url = NSURL(string: string as String)
        if (UIApplication.sharedApplication().canOpenURL(url!))
        {
            self.webView.loadRequest(NSURLRequest(URL: url!))
        }
        else
        {
            let alertController = UIAlertController(title: "Erreur de chargement", message: "La page demandée ne comporte pas une adresse valide", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(alertAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
}
