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
    // willSet and didSet are property observes, are not called when a property is first initialiazed. They are only called when the property's value is set outside of an initialization context.
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
