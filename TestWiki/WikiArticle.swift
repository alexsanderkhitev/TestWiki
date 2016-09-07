//
//  WikiArticle.swift
//  TestWiki
//
//  Created by Alexsander Khitev on 9/7/16.
//  Copyright © 2016 Alexsander Khitev. All rights reserved.
//

import Foundation
import ObjectMapper

class WikiArticle: Mappable {
   
    var dist = ""
    var lat = ""
    var lon = ""
    var ns = 0
    var pageid = 2468001
    var primary = ""
    var title = ""
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        dist <- map["dist"]
        lat <- map["lat"]
        lon <- map["lon"]
        ns <- map["ns"]
        pageid <- map["pageid"]
        primary <- map["primary"]
        title <- map["title"]
    }

}