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
    
    func fetchTrendingMovieList(_ page: Int, completion: @escaping ([Movie]) -> Void) {
        AF.request(AppConstants.BaseURL + "trending/movie/day?api_key=" + AppConstants.ApiKey + "&page=\(page)").responseJSON { response in
            
            switch response.result {
            case .success:
                guard let value = response.data else { return }
                do {
                    let result = try JSONDecoder().decode(TrendingMoviesResponse.self, from: value)
                    completion(result.results)
                } catch {
                    print("error")
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func searchMovies(keyword: String,_ page: Int, completion: @escaping ([Movie]) -> Void) {
        AF.request(AppConstants.BaseURL + "search/movie?api_key=\(AppConstants.ApiKey)&query=\(keyword)&page=\(page)")
            .responseJSON { response in
            
            switch response.result {
            case .success:
                guard let value = response.data else { return }
                do {
                    let result = try JSONDecoder().decode(TrendingMoviesResponse.self, from: value)
                    completion(result.results)
                } catch {
                    print("error")
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchVideoList(for movieId: Int, completion: @escaping ([Video]) -> Void) {
        AF.request(AppConstants.BaseURL + "movie/\(movieId)/videos?api_key=" + AppConstants.ApiKey + "&language=en-US").responseJSON { response in
            
            switch response.result {
            case .success:
                guard let value = response.data else { return }
                do {
                    let result = try JSONDecoder().decode(VideoListResponse.self, from: value)
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
