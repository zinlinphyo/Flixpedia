//
//  MovieTableViewCell.swift
//  Flixpedia
//
//  Created by Zin Lin Phyo on 17/11/2022.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtDesc: UILabel!
    @IBOutlet weak var txtReleaseDate: UILabel!
    @IBOutlet weak var imgCover: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func onBind(data: Movie) {
        txtTitle.text = data.originalTitle
        txtDesc.text = "\(round(10 * (data.voteAverage ?? 0)) / 10)"
        txtReleaseDate.text = data.releaseDate
        
        imgCover.kf.setImage(with: URL(string: "\(AppConstants.PosterPath)\(data.posterPath ?? "")")!, placeholder: UIImage(named: "Flixpedia-icon"))
        
    }
}
