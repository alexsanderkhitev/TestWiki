//
//  MainTableViewController.swift
//  TestWiki
//
//  Created by Alexsander Khitev on 9/6/16.
//  Copyright © 2016 Alexsander Khitev. All rights reserved.
//

import UIKit
import CoreLocation

class MainTableViewController: UITableViewController, LocationManagerDelegate {
    
    // MARK: - Controllers
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // settings
        setupSettings()
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
        LocationManager.shared.requestLocation()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

 
    // MARK: - LocationManagerDelegate functions 
    func didReceiveCoordinate(coordinate: CLLocationCoordinate2D) {
        print("didReceiveCoordinate", coordinate)
        DownloadManager.shared.downloadWiliArticles(coordinate)
    }
}
