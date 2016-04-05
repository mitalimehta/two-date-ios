//
//  PersonVC.swift
//  TwoDate
//
//  Created by Max Matuson on 4/4/16.
//  Copyright © 2016 Chris Falvo. All rights reserved.
//

import UIKit

class PersonVC: UIViewController {
    
    @IBOutlet weak var personPlaceHolder: UIImageView!
    
    @IBOutlet weak var btnNope: UIButton!
    
    @IBOutlet weak var btnLike: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(PersonVC.Nope))
        swipeGestureLeft.direction = .Left
        
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(PersonVC.Like))
        swipeGestureRight.direction = .Right
        
        personPlaceHolder.addGestureRecognizer(swipeGestureLeft)
        personPlaceHolder.addGestureRecognizer(swipeGestureRight)
        
        btnNope.addTarget(self, action: #selector(PersonVC.Nope), forControlEvents: .TouchUpInside)
        btnLike.addTarget(self, action: #selector(PersonVC.Like), forControlEvents: .TouchUpInside)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Nope() {
        print("Swiped Left / NOPE")
    }
    
    func Like() {
        print("Swiped Right / LIKE")

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
