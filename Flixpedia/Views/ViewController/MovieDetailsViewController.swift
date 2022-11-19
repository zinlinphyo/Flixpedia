//
//  MovieDetailsViewController.swift
//  Flixpedia
//
//  Created by Zin Lin Phyo on 18/11/2022.
//

import UIKit
import Kingfisher
import AVKit
import youtube_ios_player_helper

class MovieDetailsViewController: UIViewController {
    
    var item: Movie?
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtDescription: UILabel!
    @IBOutlet weak var btnPlayTrailer: UIButton!
    @IBOutlet weak var ytPlayer: YTPlayerView!
    
    lazy var titleBgView: UIView = {
        let view = GradientView()
        view.topColor = .clear
        view.bottomColor = .darkGray
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchVideos()
        
        btnPlayTrailer.isHidden = true
        
        imgCover.addSubview(titleBgView)
        titleBgView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(txtTitle.snp.height).offset(16)
        }

        txtTitle.text = item?.originalTitle
        txtDescription.text = item?.overview
        if let image = item?.backdropPath {
            imgCover.kf.setImage(with: URL(string: "\(AppConstants.BackdropPath)\(image)")!, placeholder: UIImage(named: "Flixpedia-icon"))
        }
        
        
    }
    
    func fetchVideos() {
        
        guard let movieId = item?.id else { return }
        
        ApiManager.instance.fetchVideoList(for: movieId) { results in
            if results.count > 0 {
                self.ytPlayer.load(withVideoId: results.first?.key ?? "")
            }
        }
    }
    
    @IBAction func didTapBtnBack(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func didTapBtnPlayTrailer(_ sender: Any) {
        
        
        
//        let videoURL = URL(string: "https://www.youtube.com/embed/7buFoxectEM")
//        let player = AVPlayer(url: videoURL!)
//        let playerViewController = AVPlayerViewController()
//        playerViewController.player = player
//        self.present(playerViewController, animated: true) {
//            playerViewController.player!.play()
//        }
    }
    
}
