//
//  ReceptionTableViewCell.swift
//  SFArtOpenings
//
//  Created by christopher soria on 3/9/16.
//  Copyright © 2016 Codepath-Juan-Yousef-Chris. All rights reserved.
//

import UIKit

class ReceptionTableViewCell: UITableViewCell {

    @IBOutlet weak var galleryImageView: UIImageView!
    
    @IBOutlet weak var galleryNameLabel: UILabel!
    
    @IBOutlet weak var galleryAddressLabel: UILabel!
    
    @IBOutlet weak var startTimeLabel: UILabel!
    
    @IBOutlet weak var myFavoritesView: UIImageView!
    
    @IBOutlet weak var startDateLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        // Initialization code
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
        func load_image(urlString:String, cell: ReceptionTableViewCell)
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
                        cell.galleryImageView.image = UIImage(data: data!)
                    }
    
                    dispatch_async(dispatch_get_main_queue(), display_image)
                }
            }
            
            task.resume()
        }

}
