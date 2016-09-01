//
//  InterestCollectionViewCell.swift
//  StretchyHeader
//
//  Created by yanze on 9/1/16.
//  Copyright © 2016 yanzeliu. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    //MARK: Public
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    
    //MARK: Private
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLable: UILabel!
    
    
    private func updateUI() {
        interestTitleLable.text = interest.title
        featuredImageView.image = interest.featuredImage
    }
    
    
}
