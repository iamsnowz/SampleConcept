//
//  EkoMyCommunitiesCollectionViewCell.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class EkoMyCommunitiesCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var profileView: UIView!
    @IBOutlet private var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileView.layer.cornerRadius = profileView.frame.height / 2
        profileView.backgroundColor = UIColor(white: 0.75, alpha: 1)
    }
    
    func configureCommunity(with model: EkoMyCommunityObject) {
        nameLabel.text = model.name
    }

}
