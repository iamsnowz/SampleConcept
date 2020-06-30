//
//  EkoFeedTableViewCell.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class EkoFeedTableViewCell: UITableViewCell {
    
    @IBOutlet private var profileView: UIView!
    @IBOutlet private var usernameLabel: UILabel!
    @IBOutlet private var postDateLabel: UILabel!
    @IBOutlet private var postContentLabel: UILabel!
    
    var profileHandler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupView()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(profileTap))
        tap.numberOfTapsRequired = 1
        profileView.addGestureRecognizer(tap)
    }
    
    private func setupView() {
        profileView.layer.cornerRadius = profileView.frame.height / 2
        profileView.backgroundColor = UIColor(white: 0.75, alpha: 1)
        usernameLabel.font = .systemFont(ofSize: 15)
        postDateLabel.font = .systemFont(ofSize: 12)
        postDateLabel.textColor = UIColor(white: 0.25, alpha: 1)
        postContentLabel.numberOfLines = 0
    }
    
    func configureFeed(with feed: EkoFeedObject) {
        usernameLabel.text = feed.userName
        postDateLabel.text = feed.postDate
        postContentLabel.text = feed.postContent
    }
    
    @objc private func profileTap() {
        profileHandler?()
    }
}
