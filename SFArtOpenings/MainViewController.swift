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
    
    var refreshControl = UIRefreshControl()
    
    var today: [PFObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        cell.galleryNameLabel.text = galleryName
        cell.galleryAddressLabel.text = galleryAddress
        
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
        let query = PFQuery(className: "Today")
        query.orderByAscending("_id")
        query.limit = 20
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if let objects = objects  {
                // do something with the data fetched
                self.today = objects
                print(self.today)
                self.tableView.reloadData()
            } else {
                //                // handle error
                print ("Error")
                
            }
            
        }
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let cell = sender as! UITableViewCell
//        let indexPath = tableView.indexPathForCell(cell)

        
        //print("prepare for segue called")
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
   // }
  

}
