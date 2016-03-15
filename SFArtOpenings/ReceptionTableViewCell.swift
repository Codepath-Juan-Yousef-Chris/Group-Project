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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
