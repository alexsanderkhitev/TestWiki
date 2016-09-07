//
//  DownloadManager.swift
//  TestWiki
//
//  Created by Alexsander Khitev on 9/7/16.
//  Copyright © 2016 Alexsander Khitev. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

class DownloadManager {
    
    static let shared = DownloadManager()
    
    // MARK: - links 
    private let wikiLocationBaseURL = "https://en.wikipedia.org/w/api.php?format=json&action=query&list=geosearch&gsradius=10000&gscoord="

    func downloadWiliArticles(coordinate: CLLocationCoordinate2D) {
        let additionalPath = "\(coordinate.latitude)%7C\(coordinate.longitude)&gslimit=50"
        let fullPath = wikiLocationBaseURL + additionalPath
        guard let url = NSURL(string: fullPath) else { return }
        Manager.sharedInstance.request(.GET, url).responseJSON { (response) in
            print(response.result.value)
        }
    }
    
}