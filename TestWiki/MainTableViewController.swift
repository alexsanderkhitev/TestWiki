//
//  MainTableViewController.swift
//  TestWiki
//
//  Created by Alexsander Khitev on 9/6/16.
//  Copyright © 2016 Alexsander Khitev. All rights reserved.
//

import UIKit
import CoreLocation
import SVProgressHUD

class MainTableViewController: UITableViewController, LocationManagerDelegate {
    
    // MARK: - Data 
    private var wikiArticles = [WikiArticle]()
    
    // MARK: - Identifiers
    private let mainTableViewCellIdentifier = "mainTableViewCellIdentifier"
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // settings
        setupSettings()
        setupTableViewSettings()
        setupDelegates()
        // requests
        requestLocation()
    }

    // MARK: - Settings functions 
    private func setupSettings() {
        definesPresentationContext = true
    }
    
    private func setupDelegates() {
        LocationManager.shared.delegate = self
    }
    
    // MARK: - Requests functions
    private func requestLocation() {
        SVProgressHUD.show()
        LocationManager.shared.requestLocation()
    }
    
    // MARK: - Table view settings functions 
    private func setupTableViewSettings() {
        tableView.registerClass(MainTableViewCell.self, forCellReuseIdentifier: mainTableViewCellIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 ?? 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wikiArticles.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mainTableViewCellIdentifier", forIndexPath: indexPath) as! MainTableViewCell

        let wikiArticle = wikiArticles[indexPath.row]
        
        cell.textLabel?.text = wikiArticle.title
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let wikiArticle = wikiArticles[indexPath.row]
        guard let url = DownloadManager.shared.returnArticlePage(wikiArticle.pageid) else { return }
        let detailViewController = DetailViewController()
        detailViewController.url = url
        navigationController?.pushViewController(detailViewController, animated: true)
    }

 
    // MARK: - LocationManagerDelegate functions 
    func didReceiveCoordinate(coordinate: CLLocationCoordinate2D) {
        DownloadManager.shared.downloadWiliArticles(coordinate, success: { (wikiArticles) in
            self.wikiArticles = wikiArticles
            self.wikiArticles.sortInPlace({ (first, second) -> Bool in
                first.title < second.title
            })
            self.tableView.reloadData()
            if SVProgressHUD.isVisible() {
                SVProgressHUD.dismiss()
            }
            }) { (error) in
                
        }
    }
}
