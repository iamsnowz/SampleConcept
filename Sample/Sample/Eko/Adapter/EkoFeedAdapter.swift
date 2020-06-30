//
//  EkoFeedAdapter.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

protocol EkoFeedAdapterDataSource: AnyObject {
    
}
protocol EkoFeedAdapterDelegate: AnyObject {
    func userDidTapOnFeed(postId: String)
    func userDidTapOnProfile()
}

class EkoFeedAdapter: NSObject {
    weak var delegate: EkoFeedAdapterDelegate?
    weak var dataSource: EkoFeedAdapterDataSource?
    private var tableView: UITableView?
    
    private var feedManager: EkoFeedManager = EkoFeedManager()
    
    func setup(in tableView: UITableView) {
        tableView.register(UINib.init(nibName: "EkoFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "EkoFeedTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView = tableView
    }
}

extension EkoFeedAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = feedManager.getFeedItem(at: indexPath.row)
        delegate?.userDidTapOnFeed(postId: item.postId)
    }
}

extension EkoFeedAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedManager.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EkoFeedTableViewCell", for: indexPath) as! EkoFeedTableViewCell
        cell.configureFeed(with: feedManager.getFeedItem(at: indexPath.row))
        cell.profileHandler = { [weak self] in
            self?.delegate?.userDidTapOnProfile()
        }
        return cell
    }
}
