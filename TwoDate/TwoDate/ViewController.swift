//
//  ViewController.swift
//  TwoDate
//
//  Created by Chris Falvo on 3/28/16.
//  Copyright © 2016 Chris Falvo. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var menButton: UIButton!
    @IBOutlet weak var womenButton: UIButton!
    
    
    var preferMen = false
    var preferWomen = false
    
    @IBAction func menButtonTapped(sender: AnyObject) {
        if preferMen == false {
            menButton.setImage(UIImage(named: "menChecked"), forState:.Normal)
            womenButton.setImage(UIImage(named: "womenUnchecked"), forState:.Normal)
            preferMen = true
            preferWomen = false
        } else {
            menButton.setImage(UIImage(named: "menUnchecked"), forState:.Normal)
            preferMen = false
        }
        
    }
    
    @IBAction func womenButtonTapped(sender: AnyObject) {
        if preferWomen == false {
            womenButton.setImage(UIImage(named: "womenChecked"), forState:.Normal)
            menButton.setImage(UIImage(named: "menUnchecked"), forState:.Normal)
            preferWomen = true
            preferMen = false
        } else {
            womenButton.setImage(UIImage(named: "womenUnchecked"), forState:.Normal)
            preferWomen = false
        }
    
    }
    
    var choice: String = ""
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextVC = segue.destinationViewController as! PersonVC
        if preferMen == true {
            choice = "men"
            //do something
        } else {
            choice = "women"
            //do something
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(
            .GET,
            "http://bpascazio.pythonanywhere.com/2date/api/v1.0/men",
            parameters: ["include_docs": "true"],
            encoding: .URL)
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: \(response.result.error)")
                    return
                }
                
                guard let value = response.result.value as? [String: AnyObject],
                    rows = value["men"] as? [[String: AnyObject]] else {
                        print("Malformed data received from fetchAllRooms service")
                        return
                }
                
               var people = [Person]()
               
                for peopleDict in rows {
                   
                    let person       = Person()
                    person.age       = peopleDict["age"] as! Int
                    person.img       = peopleDict["img"] as! String
                    person.married   = peopleDict["married"] as! Bool
                    person.name      = peopleDict["name"] as! String
 
                    people.append(person)
               }
               
               // print("\(response)")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

