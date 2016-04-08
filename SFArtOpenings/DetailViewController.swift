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

    @IBOutlet weak var galleryView: UIImageView!
    @IBOutlet weak var galleryLabelText: UILabel!
    @IBOutlet weak var exhibtionDescriptionLabel: UILabel!
    @IBOutlet weak var receptionTimeLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lowerView: UIView!
    
    
    enum ErrorHandling:ErrorType{
        case NetworkError
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: lowerView.frame.origin.y + lowerView.frame.size.height)
        
        let galleryImage1 = event!["galleryImage"] as? String
        //print (galleryImage!)
        load_image(galleryImage1!)
        
        let galleryName = event!["galleryName"] as? String
        let receptionTime = event!["receptionTime"] as? String
        let exhibitionDescription = event!["description"] as? String
        galleryLabelText.text = galleryName
        receptionTimeLabel.text = receptionTime
        exhibtionDescriptionLabel.text = exhibitionDescription
        
//
//        //print(event)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func load_image(urlString:String)
    {
        let imgURL = NSURL(string: urlString)
        let request: NSURLRequest = NSURLRequest(URL: imgURL!)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            if (error == nil && data != nil)
            {
                func display_image()
                {
                    self.galleryView.image = UIImage(data: data!)
                }
                
                dispatch_async(dispatch_get_main_queue(), display_image)
            }
        }
        
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
