//
//  ApiManager.swift
//  Flixpedia
//
//  Created by Zin Lin Phyo on 19/11/2022.
//

import Foundation
import Alamofire

class ApiManager {
    
    static let instance = ApiManager()
    
    func fetchUpcomingMovieList(_ page: Int, completion: @escaping ([Movie]) -> Void) {
        AF.request(AppConstants.BaseURL + "movie/upcoming?api_key=" + AppConstants.ApiKey + "&page=\(page)").responseJSON { response in
            
            switch response.result {
            case .success:
                guard let value = response.data else { return }
                do {
                    let result = try JSONDecoder().decode(MovieListResponse.self, from: value)
                    completion(result.results)
                } catch {
                    print("error")
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
