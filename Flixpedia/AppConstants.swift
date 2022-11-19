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
    
//    static let BaseURL = Bundle.main.infoDictionary?["BASEURL"] as! String
//    static let ApiKey = Bundle.main.infoDictionary?["APIKEY"] as! String
    
    static let BaseURL = "https://api.themoviedb.org/3/"
    static let ApiKey = "9f04c49e56282d595c3ac1fa31ea742d"
    static let ImagePath = "https://image.tmdb.org/t/p/w342/"
    
    enum StoryboardID {
        static let MAIN = "Main"
    }
}
