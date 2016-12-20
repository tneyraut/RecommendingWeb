//
//  SpecificButton.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 20/12/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class SpecificButton: UIButton {

    override func layoutSubviews() {
        //self.titleLabel?.backgroundColor = UIColor.red
        self.titleLabel?.frame = CGRect(x: 0, y: -2.5, width: self.frame.size.width, height: self.frame.size.height)
        
        self.layer.borderColor = UIColor(red:213.0/255.0, green:210.0/255.0, blue:199.0/255.0, alpha:1.0).cgColor
        self.layer.borderWidth = 2.5
        self.layer.cornerRadius = 7.5
        //self.layer.shadowOffset = CGSizeMake(0, 1)
        //self.layer.shadowColor = UIColor.lightGrayColor().CGColor
        //self.layer.shadowRadius = 8.0
        //self.layer.shadowOpacity = 0.8
        self.layer.masksToBounds = false
        
        self.backgroundColor = UIColor.lightGray
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = UIFont(name: (self.titleLabel?.font.fontName)!, size: 40.0)
        self.setTitleColor(UIColor.black, for: UIControlState())
    }

}
