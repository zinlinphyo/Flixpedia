//
//  MovieDetailsViewController.swift
//  Flixpedia
//
//  Created by Zin Lin Phyo on 18/11/2022.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    
    var item: Movie?
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtTitle.text = item?.originalTitle
        txtDescription.text = item?.overview
        if let photo = item?.posterPath {
            imgCover.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w342/\(photo)")!)
        }
        
    }
    

}
