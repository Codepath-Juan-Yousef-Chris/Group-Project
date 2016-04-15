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
        
        // Animating the picture and text
        
        UIView.animateWithDuration(1) { () -> Void in
            self.galleryView.frame.size.height += 338
            self.galleryView.alpha = 1
        }

        UIView.animateWithDuration(1) { () -> Void in
            self.lowerView.frame.size.height -= 1438
        }
        
//        self.galleryView.alpha = 0
//        UIView.animateWithDuration(0.8, delay: 0.2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.galleryView.alpha = 1
//            }, completion: nil)
        
        self.exhibitionNameLabel.alpha = 0
        UIView.animateWithDuration(2.3, delay: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.exhibitionNameLabel.alpha = 1
            }, completion: nil)
        
        self.lineView.alpha = 0
        UIView.animateWithDuration(2.3, delay: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.lineView.alpha = 1
            }, completion: nil)
        
        self.galleryLabelText.alpha = 0
        UIView.animateWithDuration(2.3, delay: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.galleryLabelText.alpha = 1
            }, completion: nil)
        
        self.receptionTimeLabel.alpha = 0
        UIView.animateWithDuration(2.3, delay: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.receptionTimeLabel.alpha = 1
            }, completion: nil)
        
        self.artistsLabel.alpha = 0
        UIView.animateWithDuration(2.3, delay: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.artistsLabel.alpha = 1
            }, completion: nil)
        
        
        
        
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
        
        self.exhibitionDescriptionLabel.alpha = 0
        UIView.animateWithDuration(1.8, delay: 1.5, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.exhibitionDescriptionLabel.alpha = 1
            }, completion: nil)
        
        self.galleryAdressLabel.alpha = 0
        UIView.animateWithDuration(1.8, delay: 1.5, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.galleryAdressLabel.alpha = 1
            }, completion: nil)
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
