//
//  ChatViewController.swift
//  SFArtOpenings
//
//  Created by christopher soria on 3/20/16.
//  Copyright © 2016 Codepath-Juan-Yousef-Chris. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var messageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    @IBAction func onSend(sender: AnyObject) {
        var message = PFObject (className: "Message")
        message["text"] = messageField.text
        message.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if (success){
                print("successfully saved")
                
            } else {
                print("saving failed")
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
