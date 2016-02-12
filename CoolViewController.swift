//
//  coolViewController.swift
//  FoodTracker
//
//  Created by Jayson Kadlecek on 2/11/16.
//  Copyright © 2016 Kadalyst Design. All rights reserved.
//

import Foundation
import UIKit

class CoolViewController: UIViewController, UIScrollViewDelegate {
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        let scrollView = UIScrollView(frame: view.frame)
        scrollView.delegate = self
        scrollView.alwaysBounceVertical = true
        scrollView.flashScrollIndicators()
        view.addSubview(scrollView)

        let newButton = UIButton(type: UIButtonType.Custom)
        scrollView.addSubview(newButton)
        newButton.frame.size.width = 100
        newButton.frame.size.height = 70
        newButton.frame.origin.x = 20
        newButton.frame.origin.y = 150
        newButton.setTitle("Back...", forState: UIControlState.Normal)
        newButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        newButton.titleLabel?.font = UIFont.systemFontOfSize(CGFloat(integerLiteral: 24), weight: UIFontWeightThin)
        newButton.layer.borderWidth = 0
        newButton.addTarget(self, action: "showCoolViewController", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func showCoolViewController() {
        
        let myCoolViewController = ViewController()
        self.showViewController(myCoolViewController, sender: self)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        
    }

    
}