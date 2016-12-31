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
    
    fileprivate var recommandationCollectionViewController:RecommendationCollectionViewController! = nil
    
    fileprivate let webView = UIWebView()
    
    fileprivate var buttonPrevious: UIBarButtonItem! = nil
    
    fileprivate var buttonForward: UIBarButtonItem! = nil
    
    fileprivate let searchBar = UISearchBar()
    
    fileprivate let data = Data()
    
    fileprivate let locationManager = CLLocationManager()
    
    internal var user_id = 0
    
    //fileprivate var ongletCollectionViewController:OngletCollectionViewController! = nil
    
    //fileprivate let newOngletButton = SpecificButton(type: .roundedRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.initTimer(self.data)
        
        self.locationManager.delegate = self
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
        
        self.data.setUserId(self.user_id)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        self.recommandationCollectionViewController = RecommendationCollectionViewController(collectionViewLayout: layout)
        self.recommandationCollectionViewController.data = self.data
        self.recommandationCollectionViewController.locationManager = self.locationManager
        self.recommandationCollectionViewController.mainViewController = self
        self.recommandationCollectionViewController.collectionView?.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.size.height)! + 20.0, width: self.view.frame.size.width, height: 80.0)
        
        self.view.addSubview(self.recommandationCollectionViewController.collectionView!)
        
        var y = (self.recommandationCollectionViewController.collectionView?.frame.origin.y)! + (self.recommandationCollectionViewController.collectionView?.frame.size.height)! + 0.1
        
        /*self.ongletCollectionViewController = OngletCollectionViewController(collectionViewLayout: layout)
        self.ongletCollectionViewController.mainViewController = self
        self.ongletCollectionViewController.collectionView?.frame = CGRect(x: 0, y: y, width: self.view.frame.size.width - 40.0, height: 40.0)
        
        self.view.addSubview(self.ongletCollectionViewController.collectionView!)
        
        self.newOngletButton.frame = CGRect(x: (self.ongletCollectionViewController.collectionView?.frame.size.width)!, y: (self.ongletCollectionViewController.collectionView?.frame.origin.y)!, width: 40.0, height: 40.0)
        self.newOngletButton.setTitle("+", for: UIControlState())
        self.newOngletButton.addTarget(self, action: #selector(self.newOngletButtonActionListener), for: .touchUpInside)
        self.view.addSubview(self.newOngletButton)
        
        y = (self.ongletCollectionViewController.collectionView?.frame.origin.y)! + (self.ongletCollectionViewController.collectionView?.frame.size.height)!*/
        
        self.webView.frame = CGRect(x: 0, y: y, width: self.view.frame.size.width, height: self.view.frame.size.height - y)
        self.webView.delegate = self
        self.webView.loadRequest(URLRequest(url:URL(string:"https://www.google.fr")!))
        //self.webView.loadRequest(URLRequest(url: self.ongletCollectionViewController.getWebSiteOngletActivated()))
        self.view.addSubview(self.webView)
        
        let shadow = NSShadow()
        shadow.shadowColor = UIColor(red:0.0, green:0.0, blue:0.0, alpha:0.8)
        shadow.shadowOffset = CGSize(width: 0, height: 1)
        
        self.buttonPrevious = UIBarButtonItem(title:"<-", style:UIBarButtonItemStyle.done, target:self, action:#selector(self.buttonPreviousActionListener))
        self.buttonPrevious.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red:245.0/255.0, green:245.0/255.0, blue:245.0/255.0, alpha:1.0), NSShadowAttributeName: shadow, NSFontAttributeName: UIFont(name:"HelveticaNeue-CondensedBlack", size:30.0)!], for:UIControlState())
        self.setButtonPreviousHidden()
        
        self.buttonForward = UIBarButtonItem(title:"->", style:UIBarButtonItemStyle.done, target:self, action:#selector(self.buttonForwardActionListener))
        self.buttonForward.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red:245.0/255.0, green:245.0/255.0, blue:245.0/255.0, alpha:1.0), NSShadowAttributeName: shadow, NSFontAttributeName: UIFont(name:"HelveticaNeue-CondensedBlack", size:30.0)!], for:UIControlState())
        self.setButtonForwardHidden()
        
        self.navigationItem.leftBarButtonItem = self.buttonPrevious
        self.navigationItem.rightBarButtonItem = self.buttonForward
        
        self.searchBar.delegate = self
        let x = CGFloat(50.0)
        y = 10.0
        self.searchBar.frame = CGRect(x: x, y: y, width: self.view.frame.size.width - 2 * x, height: (self.navigationController?.navigationBar.frame.size.height)! - 2 * y)
        self.searchBar.keyboardType = .webSearch
        
        let toolbarDone = UIToolbar()
        toolbarDone.sizeToFit()
        let barButtonDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.buttonDoneActionListener))
        toolbarDone.items = [barButtonDone]
        self.searchBar.inputAccessoryView = toolbarDone
        
        self.navigationController?.navigationBar.addSubview(self.searchBar)
        
        //self.setElementPositionForOrientation(UIDevice.currentDevice().orientation.isFlat || UIDevice.currentDevice().orientation.isPortrait)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if (fromInterfaceOrientation.isPortrait)
        {
            
            self.setElementPositionForOrientation(false)
        }
        else
        {
            self.setElementPositionForOrientation(true)
        }
    }
    
    // à modifier : intégrer les nouveaux éléments
    fileprivate func setElementPositionForOrientation(_ orientationPortrait: Bool)
    {
        if (!orientationPortrait)
        {
            self.recommandationCollectionViewController.collectionView?.frame = CGRect(x: 0, y: 32.0, width: self.view.frame.size.width, height: 80.0)
            if (UIDevice.current.userInterfaceIdiom == .pad)
            {
                self.recommandationCollectionViewController.collectionView?.frame = CGRect(x: 0, y: 32.0, width: self.view.frame.size.width, height: 112.0)
            }
        }
        else
        {
            self.recommandationCollectionViewController.collectionView?.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.size.height)! + 20.0, width: self.view.frame.size.width, height: 80.0)
        }
        self.recommandationCollectionViewController.collectionView?.reloadData()
        
        let y = (self.recommandationCollectionViewController.collectionView?.frame.origin.y)! + (self.recommandationCollectionViewController.collectionView?.frame.size.height)!
        
        self.webView.frame = CGRect(x: 0, y: y, width: self.view.frame.size.width, height: self.view.frame.size.height - y)
        
        self.searchBar.frame = CGRect(x: self.searchBar.frame.origin.x, y: self.searchBar.frame.origin.y, width: self.view.frame.size.width - 2 * self.searchBar.frame.origin.x, height: (self.navigationController?.navigationBar.frame.size.height)! - 2 * self.searchBar.frame.origin.y)
    }

    @objc fileprivate func buttonPreviousActionListener()
    {
        if (self.webView.canGoBack)
        {
            self.webView.goBack()
        }
    }
    
    fileprivate func setButtonPreviousHidden()
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
    
    @objc fileprivate func buttonForwardActionListener()
    {
        if (self.webView.canGoForward)
        {
            self.webView.goForward()
        }
    }
    
    fileprivate func setButtonForwardHidden()
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
    
    @objc fileprivate func newOngletButtonActionListener()
    {
        //self.ongletCollectionViewController.createNewOnglet()
    }
    
    @objc internal func webViewDidFinishLoad(_ webView: UIWebView) {
        self.setButtonPreviousHidden()
        self.setButtonForwardHidden()
        
        let currentURL: String = (webView.request?.url?.scheme)! + "://" + (webView.request?.url?.host)!
        
        if (CLLocationManager.authorizationStatus() ==  CLAuthorizationStatus.authorizedAlways)
        {
            self.data.saveData(currentURL as NSString, latitude: round(1000 * (self.locationManager.location?.coordinate.latitude)!) / 1000, longitude: round(1000 * (self.locationManager.location?.coordinate.longitude)!) / 1000)
        }
        
        //self.ongletCollectionViewController.setWebSiteOngletActivated(siteWeb: (webView.request?.url)!)
    }
    
    @objc internal func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        
        let string = self.searchBar.text?.replacingOccurrences(of: " ", with: "+")
        if (UIApplication.shared.canOpenURL(URL(string: (string?.lowercased())!)!))
        {
            self.webView.loadRequest(URLRequest(url:URL(string: (string?.lowercased())!)!))
            
            //self.ongletCollectionViewController.setWebSiteOngletActivated(siteWeb: URL(string: (string?.lowercased())!)!)
        }
        else
        {
            let url = URL(string: "https://www.google.fr/#q=" + string!)
            self.webView.loadRequest(URLRequest(url: url!))
            
            //self.ongletCollectionViewController.setWebSiteOngletActivated(siteWeb: url!)
        }
    }
    
    @objc fileprivate func buttonDoneActionListener()
    {
        self.searchBar.resignFirstResponder()
    }
    
    internal func goToWebSite(_ string: String)
    {
        let url = URL(string: string)
        
        //self.ongletCollectionViewController.setWebSiteOngletActivated(siteWeb: url!)
        
        if (UIApplication.shared.canOpenURL(url!))
        {
            self.webView.loadRequest(URLRequest(url: url!))
        }
        else
        {
            let alertController = UIAlertController(title: "Erreur de chargement", message: "La page demandée ne comporte pas une adresse valide", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}
