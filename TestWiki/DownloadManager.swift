//
//  DownloadManager.swift
//  TestWiki
//
//  Created by Alexsander Khitev on 9/7/16.
//  Copyright © 2016 Alexsander Khitev. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import CoreLocation

class DownloadManager {
    
    static let shared = DownloadManager()
    
    // MARK: - links 
    private let wikiLocationBaseURL = "https://en.wikipedia.org/w/api.php?format=json&action=query&list=geosearch&gsradius=10000&gscoord="
    
    private let commonPath = "https://en.wikipedia.org/wiki?curid="

    func downloadWiliArticles(coordinate: CLLocationCoordinate2D, success: ((wikiArticles: [WikiArticle]) -> ())?, fail: ((error: NSError?) -> ())?) {
        let additionalPath = "\(coordinate.latitude)%7C\(coordinate.longitude)&gslimit=50"
        let fullPath = wikiLocationBaseURL + additionalPath
        guard let url = NSURL(string: fullPath) else { return }
        Manager.sharedInstance.request(.GET, url).responseObject { (response: Response<WikiResponse, NSError>) in
            guard let wikiArticles = response.result.value?.wikiArticles else {
                guard let error = response.result.error else { return }
                fail?(error: error)
                return
            }
            success?(wikiArticles: wikiArticles)
        }
    }
    
    func returnArticlePage(id: Int) -> NSURL? {
        let fullPath = commonPath + "\(id)"
        guard let url = NSURL(string: fullPath) else {
            return nil
        }
        return url 
    }
    
}