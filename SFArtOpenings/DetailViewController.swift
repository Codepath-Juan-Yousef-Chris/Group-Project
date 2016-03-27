//
//  DetailViewController.swift
//  SFArtOpenings
//
//  Created by christopher soria on 3/23/16.
//  Copyright © 2016 Codepath-Juan-Yousef-Chris. All rights reserved.
//

import UIKit
import Parse

class DetailViewController: UIViewController {
    
    var event: PFObject?

    @IBOutlet weak var galleryLabelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let galleryName = event!["galleryName"] as? String
        galleryLabelText.text = galleryName
//
//        //print(event)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
