//
//  InterestViewController.swift
//  StretchyHeader
//
//  Created by yanze on 9/2/16.
//  Copyright © 2016 yanzeliu. All rights reserved.
// header view viewController

import UIKit

class InterestViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let tableHeaderHeight: CGFloat = 330.0
    private let tableHeaderCutAway: CGFloat = 50.0
    
    private var headerView: InterestHeaderView!
    private var headerMaskLayer: CAShapeLayer!
    
    // MARK: Public API
    var interest: Interest! = Interest.createInterests()[0]

    override func viewDidLoad() {
        super.viewDidLoad()
        headerView = tableView.tableHeaderView as! InterestHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight, left: 0.0, bottom: 0.0, right: 0.0)
        tableView.contentOffset = CGPoint(x: 0, y: -tableHeaderHeight)
        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.blueColor().CGColor
        headerView.layer.mask = headerMaskLayer
        
        updateHeaderView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateHeaderView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateHeaderView()
    }

    func updateHeaderView() {
        let effectiveHeight = tableHeaderHeight - tableHeaderCutAway / 2
        
        var headerRect = CGRect(x: 0.0, y: -effectiveHeight, width: tableView.bounds.width, height: tableHeaderHeight)
        
        if tableView.contentOffset.y < -effectiveHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + tableHeaderCutAway/2
        }
        
        headerView.frame = headerRect
        
        // cut away the header
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x:0, y: 0))
        path.addLineToPoint(CGPoint(x:headerRect.width, y: 0))
        path.addLineToPoint(CGPoint(x:headerRect.width, y: headerRect.height))
        path.addLineToPoint(CGPoint(x:0, y:headerRect.height - tableHeaderCutAway))
        
        headerMaskLayer?.path = path.CGPath
    }

}

extension InterestViewController : UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath) as UITableViewCell
        return cell
    }
}

extension InterestViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
}
