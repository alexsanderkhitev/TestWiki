//
//  WikiResponse.swift
//  TestWiki
//
//  Created by Alexsander Khitev on 9/7/16.
//  Copyright © 2016 Alexsander Khitev. All rights reserved.
//

import Foundation
import ObjectMapper

class WikiResponse: Mappable {
    
    var wikiArticles = [WikiArticle]()
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        wikiArticles <- map["query.geosearch"]
    }
}