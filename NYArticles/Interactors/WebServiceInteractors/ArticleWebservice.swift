//
//  ArticleWebservice.swift
//  NYArticles
//
//  Created by Furqan on 01/04/2019.
//  Copyright © 2019 Muhammad Furqan. All rights reserved.
//

import Foundation
import Alamofire

enum ArticleEndpoints {
    case mostPopular(section: String, period: Int)
    case searchByKeyword(searchText: String)
}

extension ArticleEndpoints: Endpoint {
    
    //https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=mbAGhuWsRnZi9WjwHeAS0kNErCQ0I8B7
    
    var baseURL: String {
        return Constants.URLs.Api_BaseUrl
    }

    
    var path: String {
        switch self {
            case .mostPopular(let section, let period):
                return "mostpopular/v2/mostviewed/" + "\(section)/\(period).json"
            case .searchByKeyword:
                return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .mostPopular: return .get
            case .searchByKeyword: return .get
        }
    }
    
    
    var parameters: Dictionary<String,Any>? {
        switch self {
        case .mostPopular:
            var param = [String: Any]()
            param["api-key"] = Constants.ApiKeys.NYTimes
            return param
        case .searchByKeyword:
            return nil
        }
    }
    
}




final class ArticleWebservice {
    
    private func processRequest(endpoint: ArticleEndpoints, completion:@escaping(WebServiceCompletionBlock)) {
        let url = URL(string: endpoint.fullURL)!
        Webservice().processRequest(url: url, parameters: endpoint.parameters, httpMethod: endpoint.method, headers: endpoint.headers, encoding: URLEncoding.default) { (success, result, error) in
            completion(success,result,error)
        }
    }
    
    
    
    func getPopularArticles(section: String, period: Int, completion: @escaping ([Article]?, Error?) -> ()) {
        processRequest(endpoint: .mostPopular(section: section, period: period)) { (success, result, error) in
            if let json = result as? [String: Any] {
                if let results = json["results"] as? [[String: Any]] {
                    if results.count > 0 {
                        var articles = [Article]()
                        for result in results {
                            if let article = Article(json: result) {
                                articles.append(article)
                            }
                        }
                        completion(articles,nil)
                        return
                    }
                }
            }
            completion(nil,error)
        }
    }
    
    
    
    
    
}


