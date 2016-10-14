//
//  InterestHeaderView.swift
//  StretchyHeader
//
//  Created by yanze on 9/2/16.
//  Copyright © 2016 yanzeliu. All rights reserved.
//
// header view class
import UIKit

class InterestHeaderView: UIView {
    
    var interest : Interest! {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        headerImageView.image = interest.featuredImage
        titleLabel.text = interest.title
        pullDownToClose.text = "Pull down to close"
        pullDownToClose.isHidden = true
    }

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var pullDownToClose: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closeButtonBlurBackgroundView: UIView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        closeButtonBlurBackgroundView.layer.cornerRadius = closeButtonBlurBackgroundView.bounds.width / 2
//        
//        closeButtonBlurBackgroundView.layer.masksToBounds = true
    }
}
