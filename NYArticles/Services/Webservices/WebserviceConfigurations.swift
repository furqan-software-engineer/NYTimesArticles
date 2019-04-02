//
//  WebserviceConfigurations.swift
//
//  Created by Furqan on 01/04/2019.
//  Copyright © 2019 Muhammad Furqan khan. All rights reserved.
//

import Foundation
import Alamofire



protocol Endpoint {
    var baseURL: String { get } // https://server/api/1.0/
    var path: String { get } // /users/
    var fullURL: String { get } // This will automatically be set. https://server/api/1.0/users/
    var method: HTTPMethod { get } // .get
    var parameters: Dictionary<String,Any>? { get }
    var headers: HTTPHeaders { get } // ["Authorization" : "Bearer SOME_TOKEN"]
}


extension Endpoint { // global settings
    
    var fullURL: String {
        return baseURL + path
    }
    
    var headers: HTTPHeaders {
        var headersDictionary = [String: String]()
        headersDictionary["Content-Type"] = "application/json"
        headersDictionary["Accept"] = "application/json"
      
        /*
        if let accessToken = WebserviceCredentials.shared.accessToken {
            headersDictionary["Authorization"] = "Bearer " + accessToken
        }
         */
        return headersDictionary
    }
    
    
    
}
