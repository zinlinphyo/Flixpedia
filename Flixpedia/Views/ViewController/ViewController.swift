//
//  ViewController.swift
//  Flixpedia
//
//  Created by Zin Lin Phyo on 17/11/2022.
//

import UIKit
import Alamofire
import ViewAnimator

class ViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var dataList = [Movie]()
    var filteredData: [Movie]!
    
    private let animations = [AnimationType.vector(CGVector(dx: 0, dy: 50))]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        filteredData = dataList
        
        movieTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        
        AF.request(AppConstants.BaseURL + "movie/upcoming?api_key=" + AppConstants.ApiKey).responseJSON { response in
            
            switch response.result {
            case .success:
                guard let value = response.data else { return }
                do {
                    let result = try JSONDecoder().decode(MovieListResponse.self, from: value)
                    DispatchQueue.main.async {
                        self.dataList = result.results
                        self.filteredData = self.dataList
                        self.movieTableView.reloadData()
                        UIView.animate(views: self.movieTableView.visibleCells, animations: self.animations, completion: {})
                    }
                } catch {
                    print("error")
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    // MARK: - Navigation
    private func goToMovieDetails(index: Int) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        vc.item = filteredData[index]
        self.navigationController?.present(vc, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        cell.onBind(data: filteredData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.goToMovieDetails(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            filteredData = []
            for movie in dataList {
                if movie.originalTitle.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(movie)
                }
            }
        } else {
            filteredData = dataList
        }
        
        self.movieTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
