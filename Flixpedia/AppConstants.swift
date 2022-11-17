//
//  AppConstants.swift
//  Flixpedia
//
//  Created by Zin Lin Phyo on 17/11/2022.
//

import Foundation

struct AppConstants {
    
//    static let appName = Bundle.main.displayName
//    static let appVersion = Bundle.main.appVersion
    
    static let BaseURL = Bundle.main.infoDictionary?["BASEURL"] as! String
    static let ApiKey = Bundle.main.infoDictionary?["APIKEY"] as! String
    
    enum StoryboardID {
        static let MAIN = "Main"
    }
}
