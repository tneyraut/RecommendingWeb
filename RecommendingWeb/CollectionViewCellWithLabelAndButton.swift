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
    
    internal let button = UIButton()
    
    internal var index: Int! = nil
    
    internal var ongletCollectionViewController: OngletCollectionViewController! = nil
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel.frame = CGRectMake(5.0, 0.0, self.frame.size.width - 15.0 - self.frame.size.height, self.frame.size.height)
        self.titleLabel.textAlignment = NSTextAlignment.Center
        self.titleLabel.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        self.titleLabel.shadowOffset = CGSizeMake(0, 1)
        self.titleLabel.textColor = UIColor.blackColor()
        self.titleLabel.numberOfLines = 5
        self.titleLabel.lineBreakMode = .ByClipping
        self.addSubview(self.titleLabel)
        
        
        self.button.frame = CGRectMake(self.titleLabel.frame.origin.x + self.titleLabel.frame.size.width + 5.0, 0.0, self.frame.size.height, self.frame.size.height)
        self.button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.button.titleLabel?.textAlignment = NSTextAlignment.Center
        self.button.titleLabel?.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        self.button.titleLabel?.shadowOffset = CGSizeMake(0, 1)
        self.button.setTitle("X", forState: .Normal)
        self.button.addTarget(self, action: #selector(self.buttonActionListener), forControlEvents: .TouchUpInside)
        self.addSubview(self.button)
        
        self.layer.borderColor = UIColor(red:213.0/255.0, green:210.0/255.0, blue:199.0/255.0, alpha:1.0).CGColor
        
        self.layer.borderWidth = 2.5
        self.layer.cornerRadius = 7.5
        //self.layer.shadowOffset = CGSizeMake(0, 1)
        //self.layer.shadowColor = UIColor.lightGrayColor().CGColor
        //self.layer.shadowRadius = 8.0
        //self.layer.shadowOpacity = 0.8
        self.layer.masksToBounds = false
    }
    
    @objc private func buttonActionListener()
    {
        self.ongletCollectionViewController.removeOngletAtIndex(self.index)
    }
    
}
