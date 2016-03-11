//
//  MainViewController.swift
//  SFArtOpenings
//
//  Created by christopher soria on 3/9/16.
//  Copyright © 2016 Codepath-Juan-Yousef-Chris. All rights reserved.
//

import UIKit
import AFNetworking

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl = UIRefreshControl()
    
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
    


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    
}

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("ReceptionCell", forIndexPath: indexPath)
        print("row\(indexPath.row)")
    
    
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
