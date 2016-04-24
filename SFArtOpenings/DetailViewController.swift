//
//  DetailViewController.swift
//  SFArtOpenings
//
//  Created by christopher soria on 3/23/16.
//  Copyright © 2016 Codepath-Juan-Yousef-Chris. All rights reserved.
//

import UIKit
import Parse
import MapKit
import CoreLocation
import Social

class DetailViewController: UIViewController, MKMapViewDelegate {
    
    var event: PFObject?

    @IBOutlet weak var galleryView: UIImageView!
    @IBOutlet weak var galleryLabelText: UILabel!
    @IBOutlet weak var exhibitionNameLabel: UILabel!
    @IBOutlet weak var receptionTimeLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lowerView: UIView!
    @IBOutlet weak var exhibitionDescriptionLabel: UILabel!
    @IBOutlet weak var receptionDateLabel: UILabel!
    @IBOutlet weak var artistsLabel: UILabel!
    @IBOutlet weak var galleryAdressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var thumbDayView: UIView!
    @IBOutlet weak var lineView: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet var openingMonthLabel: UILabel!
    @IBOutlet var openingDateLabel: UILabel!
    
    
    enum ErrorHandling:ErrorType{
        case NetworkError
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Code relating to the map
        let longitude = event!["galleryLongitude"] as? Double
        let lattitude = event!["galleryLattitude"] as? Double
        mapView.delegate = self
        mapView.setRegion(MKCoordinateRegionMake(CLLocationCoordinate2DMake(lattitude!, longitude!), MKCoordinateSpanMake(0.05, 0.05)), animated: false)
        addPin()
        
        // Code to round the thumbDayView's corners
        thumbDayView.layer.cornerRadius = 3
        thumbDayView.clipsToBounds = true
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: lowerView.frame.origin.y + lowerView.frame.size.height)
        
        let galleryImage1 = event!["galleryImage"] as? String
        //print (galleryImage!)
        //galleryView.layer.cornerRadius = 5
        //galleryView.clipsToBounds = true
        load_image(galleryImage1!)
        
        let galleryName = event!["galleryName"] as? String
        galleryLabelText.text = galleryName
        
        let receptionDate = event!["receptionDate"] as? String
        //receptionDateLabel.text = receptionDate
        
        let receptionTime = event!["receptionTime"] as? String
        receptionTimeLabel.text = receptionTime
        
        let artists = event!["artists"] as? String
        artistsLabel.text = artists
        
        let galleryAddress = event!["galleryAddress"] as? String
        galleryAdressLabel.text = galleryAddress
        
        let exhibitionDescription = event!["description"] as? String
        exhibitionDescriptionLabel.text = exhibitionDescription
        
        //exhibitionDescriptionLabel.sizeToFit()
        
        let exhibitionName = event!["exhibitionName"] as? String
        exhibitionNameLabel.text = exhibitionName
        exhibitionNameLabel.sizeToFit()
        
        let openingDate = event!["openingDate"] as? String
        openingDateLabel.text = openingDate
        
        let openingMonth = event!["openingMonth"] as? String
        openingMonthLabel.text = openingMonth
        
        // Animating the picture
        
//        UIView.animateWithDuration(1) { () -> Void in
//            self.galleryView.frame.size.height += 338
//            self.galleryView.alpha = 1
//        }
        
        UIView.animateWithDuration(1.1, delay: 0, usingSpringWithDamping: 12, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            self.galleryView.frame.size.height += 338
            self.galleryView.alpha = 1
        }) { (Bool) -> Void in }

        
//        //TRYING ANIMATION WITH DAMPING
//        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: [], animations: { () -> Void in
//            self.galleryView.frame.size.height += 338
//            self.galleryView.alpha = 1
//        }) { (Bool) -> Void in }

//            completion: { (Bool) -> Void in }
        
        
        
//        UIView.animateWithDuration(4) { () -> Void in
//            self.thumbDayView.frame.size.height += 338
//            self.thumbDayView.alpha = 1
//        }

        
        //Animating the lower view
//        UIView.animateWithDuration(1) { () -> Void in
//            self.lowerView.frame.size.height -= 1438
//        }
        
        //TRYING ANIMATION OF LOWER VIEW WITH DAMPING
        UIView.animateWithDuration(2, delay: 1, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            self.lowerView.frame.size.height -= 1438
//           self.lowerView.alpha = 1
        }) { (Bool) -> Void in }
        
        
        
//        self.galleryView.alpha = 0
//        UIView.animateWithDuration(0.8, delay: 0.2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.galleryView.alpha = 1
//            }, completion: nil)
//
        
        
        //ANIMATING THE TEXT IN LOWER VIEW
        
//        self.exhibitionNameLabel.alpha = 0
//        UIView.animateWithDuration(2.3, delay: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.exhibitionNameLabel.alpha = 1
//            }, completion: nil)
//        
//        self.lineView.alpha = 0
//        UIView.animateWithDuration(2.3, delay: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.lineView.alpha = 1
//            }, completion: nil)
//        
//        self.galleryLabelText.alpha = 0
//        UIView.animateWithDuration(2.3, delay: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.galleryLabelText.alpha = 1
//            }, completion: nil)
//        
//        self.shareButton.alpha = 0
//        UIView.animateWithDuration(2.3, delay: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.shareButton.alpha = 1
//            }, completion: nil)
//        
//        self.receptionTimeLabel.alpha = 0
//        UIView.animateWithDuration(2.3, delay: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.receptionTimeLabel.alpha = 1
//            }, completion: nil)
//        
//        self.artistsLabel.alpha = 0
//        UIView.animateWithDuration(2.3, delay: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.artistsLabel.alpha = 1
//            }, completion: nil)
//        
//        self.exhibitionDescriptionLabel.alpha = 0
//        UIView.animateWithDuration(2.3, delay: 2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.exhibitionDescriptionLabel.alpha = 1
//            }, completion: nil)
//        
//        self.galleryAdressLabel.alpha = 0
//        UIView.animateWithDuration(2.3, delay: 2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.galleryAdressLabel.alpha = 1
//            }, completion: nil)
        
        
        //SUDDEN ANIMATION OF TEXT TO GO WITH DAMPING
        
        self.exhibitionNameLabel.alpha = 0
        UIView.animateWithDuration(0.1, delay: 2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.exhibitionNameLabel.alpha = 1
            }, completion: nil)
        
        self.lineView.alpha = 0
        UIView.animateWithDuration(0.1, delay: 2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.lineView.alpha = 1
            }, completion: nil)
        
        self.galleryLabelText.alpha = 0
        UIView.animateWithDuration(0.1, delay: 2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.galleryLabelText.alpha = 1
            }, completion: nil)
        
        self.shareButton.alpha = 0
        UIView.animateWithDuration(0.1, delay: 2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.shareButton.alpha = 1
            }, completion: nil)
        
        self.receptionTimeLabel.alpha = 0
        UIView.animateWithDuration(0.1, delay: 2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.receptionTimeLabel.alpha = 1
            }, completion: nil)
        
        self.artistsLabel.alpha = 0
        UIView.animateWithDuration(0.1, delay: 2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.artistsLabel.alpha = 1
            }, completion: nil)
        
        self.exhibitionDescriptionLabel.alpha = 0
        UIView.animateWithDuration(0.1, delay: 2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.exhibitionDescriptionLabel.alpha = 1
            }, completion: nil)
        
        self.galleryAdressLabel.alpha = 0
        UIView.animateWithDuration(0.1, delay: 2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.galleryAdressLabel.alpha = 1
            }, completion: nil)
        
        
        
        
        
        //ALTERNATIVE ANIMATION OF TEXT
        
//        self.exhibitionNameLabel.alpha = 0
//        UIView.animateWithDuration(1.8, delay: 0.3, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.exhibitionNameLabel.alpha = 1
//            }, completion: nil)
//        
//        self.galleryLabelText.alpha = 0
//        UIView.animateWithDuration(1.8, delay: 0.7, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.galleryLabelText.alpha = 1
//            }, completion: nil)
//        
//        self.receptionTimeLabel.alpha = 0
//        UIView.animateWithDuration(1.8, delay: 1.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.receptionTimeLabel.alpha = 1
//            }, completion: nil)
//        
//        self.artistsLabel.alpha = 0
//        UIView.animateWithDuration(1.8, delay: 1.5, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.artistsLabel.alpha = 1
//            }, completion: nil)
        
        
        
        //self.receptionDateLabel.alpha = 0
//        UIView.animateWithDuration(1.8, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.receptionDateLabel.alpha = 1
//            }, completion: nil)
        
       
        
        //print(event)

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
    
    
    //Pin on the Map
    func addPin() {
        let longitude = event!["galleryLongitude"] as? Double
        let lattitude = event!["galleryLattitude"] as? Double
        
        let annotation = MKPointAnnotation()
        var locationCoordinate = CLLocationCoordinate2DMake(lattitude!, longitude!)
        annotation.coordinate = locationCoordinate
        mapView.addAnnotation(annotation)
    }
    
    //Getting Directions
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        var appleMapsURL = "http://maps.apple.com/?q=\(view.annotation!.coordinate.latitude),\(view.annotation!.coordinate.longitude)"
        UIApplication.sharedApplication().openURL(NSURL(string: appleMapsURL)!)
        
    }
//code for facebook
    @IBAction func onShare(sender: AnyObject) {
        
        
        if self.receptionTimeLabel.isFirstResponder(){
            self.receptionTimeLabel.resignFirstResponder()
        }
        
        let alertCtrl = UIAlertController(title: "Social Share", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        let tweetAction = UIAlertAction(title: "Twitter", style: .Default, handler:{
            _ in
            
            // If user has signed on Twitter
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
                let twitterVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                if self.receptionTimeLabel.text!.characters.count < 140 {
                    twitterVC.setInitialText(self.receptionTimeLabel.text)
                }else{
                    twitterVC.setInitialText(self.receptionTimeLabel.text!.substringToIndex(self.receptionTimeLabel.text!.startIndex.advancedBy(140)))
                }
                
                self.presentViewController(twitterVC, animated: true, completion: nil)
            }else{
                self.showAlertMessage("Please Sign In Twitter Before You Tweet!")
            }
            
            
        })
        
        let facebookAction = UIAlertAction(title: "Facebook", style: .Default, handler: {
            _ in
            
            let facebookVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            // If user has signed on Facebook
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
                facebookVC.setInitialText("Hey guys! I'm gonna be at the "+self.exhibitionNameLabel.text!+" art opening from "+self.receptionTimeLabel.text!+". Anyone wanna join me?")
                
                self.presentViewController(facebookVC, animated: true, completion: nil)
            }else{
                self.showAlertMessage("Please Sign In to Facebook")
            }
            
        })
        
        let moreAction = UIAlertAction(title: "More", style: .Default, handler: {
            _ in
            
            let activityCtrl = UIActivityViewController(activityItems: [self.receptionTimeLabel.text!], applicationActivities: nil)
            self.presentViewController(activityCtrl, animated: true, completion: nil)
            
        })
        
        
        alertCtrl.addAction(cancelAction)
        alertCtrl.addAction(tweetAction)
        alertCtrl.addAction(facebookAction)
        alertCtrl.addAction(moreAction)
        self.presentViewController(alertCtrl, animated: true, completion: nil)
    }
    
//    func configureTweetTextView(){
//        self.receptionDateLabel.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 0.9, alpha: 1).CGColor
//        
//        self.receptionDateLabel.layer.cornerRadius = 10.0
//        self.receptionDateLabel.layer.borderColor = UIColor.blackColor().CGColor
//        self.receptionDateLabel.layer.borderWidth = 2.0
//        
//    }
    
    func showAlertMessage(message: String){
        let alertCtrl = UIAlertController(title: "Tweet Share", message: message, preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alertCtrl.addAction(alertAction)
        self.presentViewController(alertCtrl, animated: true, completion: nil)
        
    }

//code for share
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
