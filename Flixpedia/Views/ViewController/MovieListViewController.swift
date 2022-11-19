//
//  ViewController.swift
//  Flixpedia
//
//  Created by Zin Lin Phyo on 17/11/2022.
//

import UIKit
import Alamofire
import ViewAnimator

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var dataList = [Movie]()
    var filteredData: [Movie]!
    
    var page : Int = 1
    
    private let animations = [AnimationType.vector(CGVector(dx: 0, dy: 50))]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        filteredData = dataList
        
        movieTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        
        fetchData()
    }
    
    func fetchData() {
        ApiManager.instance.fetchUpcomingMovieList(self.page) { result in
            DispatchQueue.main.async {
                
                if self.page == 1 {
                    self.dataList = result
                    self.filteredData = self.dataList
                } else {
                    
                }
                
                self.movieTableView.reloadData()
                UIView.animate(views: self.movieTableView.visibleCells, animations: self.animations, completion: {})
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

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (movieTableView.contentSize.height - 100 - scrollView.frame.size.height) {
            
        }
    }
}

extension MovieListViewController: UISearchBarDelegate {
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
