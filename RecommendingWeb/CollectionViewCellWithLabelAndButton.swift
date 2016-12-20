//
//  CollectionViewCellWithLabelAndButton.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 13/12/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class CollectionViewCellWithLabelAndButton: UICollectionViewCell {
    
    internal let titleLabel = UILabel()
    
    internal let button = UIButton(type: .roundedRect)
    
    internal var index: Int! = nil
    
    internal var ongletCollectionViewController: OngletCollectionViewController! = nil
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width - self.frame.size.height / 2 - 5.0, height: self.frame.size.height)
        self.titleLabel.textAlignment = NSTextAlignment.center
        self.titleLabel.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        self.titleLabel.shadowOffset = CGSize(width: 0, height: 1)
        self.titleLabel.textColor = UIColor.black
        self.titleLabel.numberOfLines = 5
        self.titleLabel.lineBreakMode = .byClipping
        self.addSubview(self.titleLabel)
        
        self.button.frame = CGRect(x: self.titleLabel.frame.origin.x + self.titleLabel.frame.size.width, y: 0.0, width: self.frame.size.height / 2, height: self.frame.size.height)
        self.button.setTitleColor(UIColor.black, for: UIControlState())
        self.button.titleLabel?.textAlignment = NSTextAlignment.center
        self.button.titleLabel?.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        self.button.titleLabel?.shadowOffset = CGSize(width: 0, height: 1)
        self.button.backgroundColor = UIColor.clear
        self.button.titleLabel?.font = UIFont(name: (self.button.titleLabel?.font.fontName)!, size: 20.0)
        self.button.setTitle("X", for: UIControlState())
        self.button.addTarget(self, action: #selector(self.buttonActionListener), for: .touchUpInside)
        self.addSubview(self.button)
        
        self.layer.borderColor = UIColor(red:213.0/255.0, green:210.0/255.0, blue:199.0/255.0, alpha:1.0).cgColor
        
        self.layer.borderWidth = 2.5
        self.layer.cornerRadius = 7.5
        //self.layer.shadowOffset = CGSizeMake(0, 1)
        //self.layer.shadowColor = UIColor.lightGrayColor().CGColor
        //self.layer.shadowRadius = 8.0
        //self.layer.shadowOpacity = 0.8
        self.layer.masksToBounds = false
    }
    
    @objc fileprivate func buttonActionListener()
    {
        self.ongletCollectionViewController.removeOngletAtIndex(self.index)
    }
    
}
