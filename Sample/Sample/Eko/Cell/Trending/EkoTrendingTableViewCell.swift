//
//  EkoTrendingTableViewCell.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class EkoTrendingTableViewCell: UITableViewCell {

    @IBOutlet private var profileView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var followerLabel: UILabel!
    @IBOutlet private var joinButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        profileView.layer.cornerRadius = profileView.frame.height / 2
        profileView.backgroundColor = UIColor(white: 0.75, alpha: 1)
        
        titleLabel.font = .boldSystemFont(ofSize: 15)
        descriptionLabel.font = .systemFont(ofSize: 13)
        followerLabel.font = .systemFont(ofSize: 13)
        followerLabel.textColor = UIColor(white: 0.5, alpha: 1)
        
        joinButton.layer.cornerRadius = 6
        joinButton.setTitleColor(.white, for: .normal)
        joinButton.setTitle("+ Join", for: .normal)
        joinButton.backgroundColor = UIColor.black
    }
    
    @IBAction func joinTapped() {
        
    }
    
    func configureTrending(with model: EkoTrendingObject) {
        titleLabel.text = model.name
        descriptionLabel.text = model.description
        followerLabel.text = model.follower
    }
    
    
}
