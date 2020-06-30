//
//  EkoTopCategoriesCollectionViewCell.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class EkoTopCategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var containerView: UIView!
    @IBOutlet private var iconView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        containerView.layer.cornerRadius = 6
        iconView.layer.cornerRadius = iconView.frame.height / 2
        iconView.backgroundColor = .black
        
    }
    
    func configureCategory(with model: EkoCategoryiesObject) {
        titleLabel.text = model.name
    }

    
    
}
