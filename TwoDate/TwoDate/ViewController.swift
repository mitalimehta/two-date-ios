//
//  ViewController.swift
//  TwoDate
//
//  Created by Chris Falvo on 3/28/16.
//  Copyright © 2016 Chris Falvo. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ViewController: UIViewController {

    @IBOutlet weak var menButton: UIButton!
    @IBOutlet weak var womenButton: UIButton!
    
    var preferMen = false
    var preferWomen = false
    
    @IBAction func menButtonTapped(sender: AnyObject) {
        if preferMen == false {
            menButton.setImage(UIImage(named: "menChecked"), forState:.Normal)
            preferMen = true
        } else {
            menButton.setImage(UIImage(named: "menUnchecked"), forState:.Normal)
            preferMen = false
        }
        
    }
    
    @IBAction func womenButtonTapped(sender: AnyObject) {
        if preferWomen == false {
            womenButton.setImage(UIImage(named: "womenChecked"), forState:.Normal)
            preferWomen = true
        } else {
            womenButton.setImage(UIImage(named: "womenUnchecked"), forState:.Normal)
            preferWomen = false
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

