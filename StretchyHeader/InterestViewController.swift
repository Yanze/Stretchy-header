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
    fileprivate let tableHeaderHeight: CGFloat = 330.0
    fileprivate let tableHeaderCutAway: CGFloat = 50.0
    
    fileprivate var headerView: InterestHeaderView!
    fileprivate var headerMaskLayer: CAShapeLayer!
    
    // MARK: Public API
//    var interest: Interest! = Interest.createInterests()[0]

    override func viewDidLoad() {
        super.viewDidLoad()
        headerView = tableView.tableHeaderView as! InterestHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight, left: 0.0, bottom: 0.0, right: 0.0)
        tableView.contentOffset = CGPoint(x: 0, y: -tableHeaderHeight)
        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.blue.cgColor
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
        path.move(to: CGPoint(x:0, y: 0))
        path.addLine(to: CGPoint(x:headerRect.width, y: 0))
        path.addLine(to: CGPoint(x:headerRect.width, y: headerRect.height))
        path.addLine(to: CGPoint(x:0, y:headerRect.height - tableHeaderCutAway))
        
        headerMaskLayer?.path = path.cgPath
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}



extension InterestViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath) as UITableViewCell
        return cell
    }
}



extension InterestViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
}
