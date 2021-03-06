//
//  ChatTableViewCell.swift
//  SFArtOpenings
//
//  Created by Yousef Kazerooni on 3/21/16.
//  Copyright © 2016 Codepath-Juan-Yousef-Chris. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var gradientView: UIView!
    let gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        //Gradient code
//        // 1
//        self.gradientView.backgroundColor = UIColor.clearColor()
//        
//        // 2
//        gradientLayer.frame = self.gradientView.bounds
//        
//        // 3
//        let color1 = UIColor.clearColor().CGColor as CGColorRef
//        
//        //        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0).CGColor as CGColorRef
//        
//        let color4 = UIColor(
//            red: 0xd9/255,
//            green: 0x5b/255,
//            blue: 0x43/255,
//            alpha: 0.9).CGColor as CGColorRef
//        
//        //        let color4 = UIColor(
//        //            red: 0xFF/255,
//        //            green: 0xFF/255,
//        //            blue: 0xFF/255,
//        //            alpha: 1).CGColor as CGColorRef
//        
//        gradientLayer.colors = [color1, color4]
//        
//        // 4
//        gradientLayer.locations = [0, 1]
//        
//        // 5
//        self.gradientView.layer.addSublayer(gradientLayer)
//        
//        
//        // Initialization code
//        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
