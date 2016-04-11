//
//  MainViewController.swift
//  SFArtOpenings
//
//  Created by christopher soria on 3/9/16.
//  Copyright © 2016 Codepath-Juan-Yousef-Chris. All rights reserved.
//

import UIKit
import AFNetworking
import Parse

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var usernameBarButton: UIButton!
    
    var refreshControl = UIRefreshControl()
    
    @IBOutlet weak var todaySideImageView: UIImageView!
    
    @IBOutlet weak var upcomingSideImageView: UIImageView!
    
    @IBOutlet weak var galleryImageView: UIImageView!
    
    
    var today: [PFObject]?
    
    var parseClass: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //User Persistence)"
        let user = PFUser.currentUser()
        //print ("current user here it is: \(user?.username)")
        usernameBarButton.setTitle(user?.username, forState: UIControlState.Normal)
        
        
        refreshControl.addTarget(self, action: "refreshControlAction:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
        
        tableView.dataSource = self
        tableView.delegate = self



        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        parseAPICall()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        tabColor0()
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        tabColor1()
        
    }
    


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return today?.count ?? 0
//        if let today = today {
//            return today.count
//        }else{
//            return 0
//        }
        
    
}

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("ReceptionCell", forIndexPath: indexPath) as! ReceptionTableViewCell
        let reception = today![indexPath.row]
        
        let galleryName = reception["galleryName"] as! String
        let galleryAddress = reception["galleryAddress"] as! String
        let receptionTime = reception["receptionTime"] as! String
        let receptionDate = reception["receptionDate"] as! String
//        let galleryImage = reception["galleryImage"] as? String
        //print (galleryImage!)
//        load_image(galleryImageView, cell: ReceptionTableViewCell)
        cell.galleryNameLabel.text = galleryName
        cell.galleryAddressLabel.text = galleryAddress
        cell.startTimeLabel.text = receptionTime
        cell.startDateLabel.text = receptionDate
        

        
        
        print("getting gallery name")
    
    
        return cell
}
    
    func refreshControlAction(refreshControl: UIRefreshControl) {
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        let request = NSURLRequest()
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (data, response, error) in
                
                // ... Use the new data to update the data source ...
                
                // Reload the tableView now that there is new data
                self.tableView.reloadData()
                print("reloading")
                
                // Tell the refreshControl to stop spinning
                refreshControl.endRefreshing()
        });
        task.resume()
        
    }
    
    func parseAPICall() {
        // construct PFQuery
        let query = PFQuery(className: parseClass)
        query.orderByAscending("_id")
        query.limit = 20
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if let objects = objects  {
                // do something with the data fetched
                self.today = objects
                print(self.parseClass)
                
                self.tableView.reloadData()
            } else {
                //                // handle error
                print ("Error")
                
            }
            
        }
    }
    
    func tabColor0 () {
        if parseClass == "Today" {
            UIView.animateWithDuration(1, animations: {
                
                self.todaySideImageView.alpha = 1
//                UIView.animateWithDuration(1, animations: {
//                    self.upcomingSideImageView.alpha = 0
//                    print("CHANGEDDDDDDDDDD Upcoming back to 0000000000")
//                })
                
                
                
            })
            
        } else if parseClass == "Upcoming"{
            
            UIView.animateWithDuration(
                1, animations: {
                    self.upcomingSideImageView.alpha = 1
//                UIView.animateWithDuration(1, animations: {
//                    self.todaySideImageView.alpha = 0
//                    print("CHANGEDDDDDDDDDD today back to 0000000000")
//                })
    
                    
            })
            
        }
    }
    
    func tabColor1 () {
            
            if parseClass == "Today" {
                
                                                    UIView.animateWithDuration(1, animations: {
                                        self.upcomingSideImageView.alpha = 0
                                        print("CHANGEDDDDDDDDDD Upcoming back to 0000000000")
                                    })
                
                    
                    

                
            } else if parseClass == "Upcoming"{
                
                                        UIView.animateWithDuration(1, animations: {
                                            self.todaySideImageView.alpha = 0
                                            print("CHANGEDDDDDDDDDD today back to 0000000000")
                                        })
                
                
            
        }
    }
    
//    func load_image(urlString:String, cell: ReceptionTableViewCell)
//    {
//        let imgURL = NSURL(string: urlString)
//        let request: NSURLRequest = NSURLRequest(URL: imgURL!)
//        
//        let session = NSURLSession.sharedSession()
//        let task = session.dataTaskWithRequest(request) {
//            (data, response, error) -> Void in
//            if (error == nil && data != nil)
//            {
//                func display_image()
//                {
//                    cell.galleryImageView.image = UIImage(data: data!)
//                }
//                
//                dispatch_async(dispatch_get_main_queue(), display_image)
//            }
//        }
//        
//        task.resume()
//    }
    
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if (segue.identifier == "detailsSegue") {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)
        let event = today![indexPath!.row]
        
        let detailViewController = segue.destinationViewController as! DetailViewController
        detailViewController.event = event
        }
        
        
    
        //print(event)
         //Get the new view controller using segue.destinationViewController.
         //Pass the selected object to the new view controller.
    }


}
