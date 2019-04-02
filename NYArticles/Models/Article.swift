//
//  Article.swift
//  NYArticles
//
//  Created by Furqan on 01/04/2019.
//  Copyright © 2019 Muhammad Furqan. All rights reserved.
//

import Foundation


struct Article {
    
    let id: Double
    let title: String?
    let author: String?
    let abstract: String?
    let date: String?
    let url: String?
}


extension Article {
    init?(json: [String: Any]) {
        guard let _Id = json["id"] as? Double else { return nil }

        self.id = _Id
        self.title = json["title"] as? String
        self.author = json["byline"] as? String
        self.abstract = json["abstract"] as? String
        self.date = json["published_date"] as? String
        self.url = json["url"] as? String
        
    }
}
