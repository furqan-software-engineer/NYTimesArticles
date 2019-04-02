//
//  WebserviceCredentials.swift
//
//  Created by Furqan on 01/04/2019.
//  Copyright © 2019 Muhammad Furqan khan. All rights reserved.
//

import Foundation


class WebserviceCredentials {
    
    static let shared = WebserviceCredentials()
    
    var accessToken: String?
    var refreshToken: String?

    private init() {
        
    }

    
    func updateAccessToken(token: String?) {
        self.accessToken = token
    }
    
}
