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
    
    static let ApiKey = "" // Add TMDB ApiKey
    static let BaseURL = "https://api.themoviedb.org/3/"
    static let PosterPath = "https://image.tmdb.org/t/p/w342"
    static let BackdropPath = "https://image.tmdb.org/t/p/w780"
    
    enum StoryboardID {
        static let MAIN = "Main"
    }
}
