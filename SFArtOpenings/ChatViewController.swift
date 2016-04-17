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
    
    var messages: [PFObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        chatTableView.dataSource = self
        chatTableView.delegate = self
        
        //DON'T FORGET TO CALL YOUR FUNCTIONS
        retrievingMessages()
        
        
        //Sets a timer to repeat whatever instruction is inside the onTimer fucntion
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "onTimer", userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        let user = PFUser.currentUser()
        if user == nil {
            
            performSegueWithIdentifier("loginChatSegue", sender: nil)
            print("signed in")
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    //the send button
    @IBAction func onSend(sender: AnyObject) {
        //Creating an instance of message as a PFObject.
        let message = PFObject (className: "Message")
        message["text"] = messageField.text
        message["user"] = PFUser.currentUser()
        
        //Storing message on Parse
        message.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if (success){
                print("successfully saved")
                
            } else {
                print("saving failed")
            }
        }
        
        //Displaying the message that has been save to Parse
        retrievingMessages()
        
        //Deleting what was typed after hitting send
        messageField.text = ""
        
    }
    
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messages?.count ?? 0
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCellWithIdentifier( "ChatTableViewCell", forIndexPath: indexPath) as! ChatTableViewCell
        let message = messages![indexPath.row]
        
        
        cell.messageLabel.text = message["text"] as! String
        
        //showing the user for each message
        let user = message["user"] as? PFUser
        cell.userNameLabel.text = user?.username
        
        return cell
    }
    
    
    
    
    
    
    //pulling messages from Parse
    func retrievingMessages( ) {
        let query = PFQuery (className: "Message")
        query.includeKey("user")
        query.orderByDescending("createdAt")
        query.limit = 20
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if let objects = objects  {
                
                // do something with the data fetched
                self.messages = objects
                //print(self.messages)
                self.chatTableView.reloadData()
                
            } else {
                //                // handle error
                print ("Error")
                
            }
            
        }
    }
    
    
    
    //refreshes the table using NStimer, set in the viewDidLoad
    func onTimer() {
        retrievingMessages()
        //print("hello")
    }
    
    
    
    @IBAction func onCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        print("canceled")
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
