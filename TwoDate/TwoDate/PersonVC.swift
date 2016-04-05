//
//  PersonVC.swift
//  TwoDate
//
//  Created by Max Matuson on 4/4/16.
//  Copyright © 2016 Chris Falvo. All rights reserved.
//

import UIKit

class PersonVC: UIViewController {
    
    var choice: String = ""
    
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
        
        print("Begin of code")
        if let checkedUrl = NSURL(string: "http://www.famousbirthdays.com/headshots/zac-efron-1.jpg") {
            personPlaceHolder.contentMode = .ScaleAspectFit
            downloadImage(checkedUrl)
        }
        print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")

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
    // get the data from your url
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
    // download the image
    func downloadImage(url: NSURL){
        print("Download Started")
        print("lastPathComponent: " + (url.lastPathComponent ?? ""))
        getDataFromUrl(url) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                print(response?.suggestedFilename ?? "")
                print("Download Finished")
                self.personPlaceHolder.image = UIImage(data: data)
            }
        }
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
