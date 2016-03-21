//
//  ChatViewController.swift
//  SFArtOpenings
//
//  Created by christopher soria on 3/20/16.
//  Copyright © 2016 Codepath-Juan-Yousef-Chris. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var chatTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        chatTableView.dataSource = self
        chatTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    //the send button
    @IBAction func onSend(sender: AnyObject) {
        //Creating an instance of message as a PFObject.
        var message = PFObject (className: "Message")
        message["text"] = messageField.text
        
        //Storing message on Parse
        message.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if (success){
                print("successfully saved")
                
            } else {
                print("saving failed")
            }
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCellWithIdentifier( "ChatTableViewCell", forIndexPath: indexPath) as! ChatTableViewCell
        
        cell.messageLabel.text = "\(indexPath.row)"
        return cell
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
