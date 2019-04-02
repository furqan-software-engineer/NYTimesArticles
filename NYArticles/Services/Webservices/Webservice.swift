//
//  Webservice.swift

//
//  Created by Furqan on 01/04/2019.
//  Copyright © 2019 Muhammad Furqan khan. All rights reserved.
//

import Foundation
import Alamofire



typealias WebServiceCompletionBlock = (_ success:Bool, _ result: Any?, _ error: Error?) -> Void


final class Webservice {
    
    func processRequest(url: URL, parameters: Dictionary<String,Any>?, httpMethod: HTTPMethod, headers: HTTPHeaders?,encoding: ParameterEncoding = JSONEncoding.default, completion:@escaping(WebServiceCompletionBlock)) {
        
        print("request parameters: \(String(describing: parameters))")
        URLCache.shared.removeAllCachedResponses()
        Alamofire.request(url, method: httpMethod, parameters: parameters, encoding: encoding, headers: headers).responseJSON { dataResponse in
            
            WebServiceLogger.log(dataResponse: dataResponse)
            if let statusCode = dataResponse.response?.statusCode {
                if statusCode == 200 { //OK
                    if dataResponse.result.isSuccess {
                        completion(true,dataResponse.result.value,nil)
                        return
                    }
                }
                else if statusCode == 401 { // Unauthorized
                    
                }
            }
            completion(false,nil,dataResponse.result.error)
        }
    }
    
}
