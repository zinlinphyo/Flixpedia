//
//  MovieModel.swift
//  Flixpedia
//
//  Created by Zin Lin Phyo on 19/11/2022.
//

import Foundation

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case ja = "ja"
    case ko = "ko"
    case sv = "sv"
    case de = "de"
    case it = "it"
}

enum MediaType: String, Codable {
    case movie = "movie"
}

class MovieModel {
    
    var movieList: [Movie] = []
    
    // MARK: - Singleton
    private init() {}
    
    class func shared() -> MovieModel {
        return sharedDataModel
    }
    
    private static var sharedDataModel: MovieModel = {
        let dataModel = MovieModel()
        return dataModel
    }()

}
