//
//  ViewController.swift
//  Flixpedia
//
//  Created by Zin Lin Phyo on 17/11/2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    var dataList = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        
        AF.request("https://api.themoviedb.org/3/movie/upcoming?api_key=9f04c49e56282d595c3ac1fa31ea742d").responseJSON { response in
            
            switch response.result {
            case .success:
                guard let value = response.data else { return }
                do {
                    let result = try JSONDecoder().decode(MovieListResponse.self, from: value)
                    DispatchQueue.main.async {
                        self.dataList = result.results
                        self.movieTableView.reloadData()
                    }
                } catch {
                    print("error")
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        cell.onBind(data: dataList[indexPath.row])
        
        return cell
    }
    
    
}
