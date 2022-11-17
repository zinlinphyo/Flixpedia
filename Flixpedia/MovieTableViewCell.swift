//
//  MovieTableViewCell.swift
//  Flixpedia
//
//  Created by Zin Lin Phyo on 17/11/2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtDesc: UILabel!
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
        txtDesc.text = data.overview
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w342/\(data.posterPath)")!)) { data, res, error in
            
            do {
                var datas = try data
                DispatchQueue.main.async {
                    self.imgCover.image = UIImage(data: datas!)
                }
            } catch {
                print("error")
            }
        }.resume()
    }
}
