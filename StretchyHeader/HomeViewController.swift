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

    fileprivate var interests = Interest.createInterests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
     

}

// to comfort uicollection protocol
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCell", for: indexPath) as! InterestCollectionViewCell
        cell.interest = self.interests[(indexPath as NSIndexPath).item]
        return cell
    }
    
    
}
