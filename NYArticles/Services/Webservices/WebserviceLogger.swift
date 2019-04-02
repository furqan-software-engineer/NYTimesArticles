//
//  WebserviceLogger.swift
//
//  Created by Furqan on 01/04/2019.
//  Copyright © 2019 Muhammad Furqan khan. All rights reserved.
//

import Foundation
import Alamofire

class WebServiceLogger {
    
    static func log(dataResponse: DataResponse<Any>) {
        debugPrint(dataResponse)
        print(dataResponse.request as Any)  // original URL request
        print(dataResponse.response as Any) // URL response
        print(dataResponse.data as Any)     // server data
        print(dataResponse.result)   // result of response serialization
        debugPrint(dataResponse.metrics as Any)
        print(dataResponse.result.value as Any)
        print(dataResponse.result.error as Any)
        
        if let error = dataResponse.result.error {
            if let error = error as? AFError {
                switch error {
                case .invalidURL(let url):
                    print("Invalid URL: \(url) - \(error.localizedDescription)")
                case .parameterEncodingFailed(let reason):
                    print("Parameter encoding failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                case .multipartEncodingFailed(let reason):
                    print("Multipart encoding failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                case .responseValidationFailed(let reason):
                    print("Response validation failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                    
                    switch reason {
                    case .dataFileNil, .dataFileReadFailed:
                        print("Downloaded file could not be read")
                    case .missingContentType(let acceptableContentTypes):
                        print("Content Type Missing: \(acceptableContentTypes)")
                    case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                        print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                    case .unacceptableStatusCode(let code):
                        print("Response status code was unacceptable: \(code)")
                    }
                case .responseSerializationFailed(let reason):
                    print("Response serialization failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                }
                
                print("Underlying error: \(String(describing: error.underlyingError))")
            } else if let error = error as? URLError {
                print("URLError occurred: \(error)")
            } else {
                print("Unknown error: \(error)")
            }
        }
    }
    
    
    
    
    
}
