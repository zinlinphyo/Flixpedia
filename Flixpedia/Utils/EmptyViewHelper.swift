//
//  EmptyViewHelper.swift
//  Flixpedia
//
//  Created by Zin Lin Phyo on 19/11/2022.
//

import Foundation
import UIKit
import SnapKit

class TableViewHelper {
    
    class func EmptyMessage(from: String, message: String, showIcon: Bool, viewController: UIViewController, tableview: UITableView) {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: viewController.view.bounds.size.width, height: viewController.view.bounds.size.height))
        
        let view = UIView(frame: rect)
        
        let messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.textColor = UIColor.black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        
        let image = UIImageView()
            image.image = UIImage(named: "empty-folder")
            image.tintColor = UIColor.black
        
        if showIcon {
            image.isHidden = false
        } else {
            image.isHidden = true
        }
        
        view.addSubview(messageLabel)
        view.addSubview(image)
        
        messageLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        image.snp.makeConstraints { (make) in
            make.bottom.equalTo(messageLabel.snp.top).offset(-8)
            make.centerX.equalTo(messageLabel)
            make.width.height.equalTo(48)
        }
        
        tableview.backgroundView = view;
        tableview.separatorStyle = .none;
    }
}

class CollectionViewHelper {
    
    class func EmptyMessage(message: String, viewController: UIViewController, collectionview: UICollectionView) {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: viewController.view.bounds.size.width, height: viewController.view.bounds.size.height))
        let messageLabel = UILabel(frame: rect)
        messageLabel.text = message
        messageLabel.textColor = UIColor.black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        
        collectionview.backgroundView = messageLabel;
    }
}

