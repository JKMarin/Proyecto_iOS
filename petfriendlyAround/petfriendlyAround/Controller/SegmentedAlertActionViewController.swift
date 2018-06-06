//
//  SegmentedAlertActionViewController.swift
//  petfriendlyAround
//
//  Created by user139236 on 6/6/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import UIKit

class SegmentedAlertActionViewController: UIViewController {
    
    @IBOutlet weak var mySegcon: UISegmentedControl!
    //var isSwitchOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myArray: NSArray = ["Red","Blue","Green"]
        
        // make SegmentedControl
        mySegcon = UISegmentedControl(items: myArray as [AnyObject])
        // mySegcon.center = CGPoint(x: self.view.frame.width/2, y: 400)
        mySegcon.backgroundColor = UIColor.gray
        mySegcon.tintColor = UIColor.white
    }
    
}
