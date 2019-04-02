//
//  Constants.swift
//
//  Created by Furqan on 01/04/2019.
//  Copyright © 2019 Muhammad Furqan khan. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    
    struct AlertMessages {
        static let InternetConnectionUnavailable = "internet connection appears to be offline!"
        static let GenericError = "something went wrong. please try again later!"
    }
    
    
    struct Fonts {
        static let REGULAR = ""
        static let BOLD = ""
    }
    
    struct Colors {
        static let app = Utilities.hexStringToUIColor(hex: "F7405A")
        static let appDarkBlue = Utilities.hexStringToUIColor(hex: "465971")
    }
    
  
    struct ApiKeys {
        static let NYTimes = "mbAGhuWsRnZi9WjwHeAS0kNErCQ0I8B7"
    }
    
    struct URLs {
        static let Api_BaseUrl = "https://api.nytimes.com/svc/"
    }
    

    
    struct Storyboards {
        static var Home: UIStoryboard {
            get {
                return UIStoryboard(name: "Home", bundle: nil)
            }
        }
    }
    
    
    
}
