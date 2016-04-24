//
//  ReceptionTableViewCell.swift
//  SFArtOpenings
//
//  Created by christopher soria on 3/9/16.
//  Copyright © 2016 Codepath-Juan-Yousef-Chris. All rights reserved.
//

import CoreGraphics

public struct DGElasticPullToRefreshConstants {
    
    struct KeyPaths {
        static let ContentOffset = "contentOffset"
        static let ContentInset = "contentInset"
        static let Frame = "frame"
        static let PanGestureRecognizerState = "panGestureRecognizer.state"
    }
    
    public static var WaveMaxHeight: CGFloat = 0.0
    public static var MinOffsetToPull: CGFloat = 95.0
    public static var LoadingContentInset: CGFloat = 70.0
    public static var LoadingViewSize: CGFloat = 30.0
	
}