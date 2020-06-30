//
//  EkoRecommendedCollectionViewCell.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class EkoRecommendedCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var containerView: UIView!
    @IBOutlet private var profileView: UIView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var followerLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var joinButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        containerView.layer.cornerRadius = 6
        
        profileView.backgroundColor = UIColor(white: 0.75, alpha: 1)
        profileView.layer.cornerRadius = profileView.frame.height / 2
        
        nameLabel.font = .systemFont(ofSize: 14)
        
        followerLabel.font = .systemFont(ofSize: 13)
        followerLabel.textColor = UIColor(white: 0.75, alpha: 1)
        
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = UIColor(white: 0.5, alpha: 1)
        descriptionLabel.numberOfLines = 2
        
        joinButton.layer.cornerRadius = 8
        joinButton.backgroundColor = UIColor.black
        joinButton.setTitle("+ Join", for: .normal)
        joinButton.setTitleColor(.white, for: .normal)
        
    }
    
    func configureRecommend(with recommend: EkoRecommendObject) {
        nameLabel.text = recommend.name
        followerLabel.text = recommend.memberFollower
        descriptionLabel.text = recommend.description
    }

}
