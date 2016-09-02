//
//  HomeViewController.swift
//  StretchyHeader
//
//  Created by yanze on 9/1/16.
//  Copyright © 2016 yanzeliu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView! // explicitly unwrapping, don't need initializer for this homeviewcontroller
    @IBOutlet weak var collectionView: UICollectionView!

    private var interests = Interest.createInterests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    

}

// to comfort uicollection protocol
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("InterestCell", forIndexPath: indexPath) as! InterestCollectionViewCell
        cell.interest = self.interests[indexPath.item]
        return cell
    }
    
    
}