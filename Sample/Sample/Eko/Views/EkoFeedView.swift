//
//  EkoFeedView.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit
protocol EkoFeedViewDelegate: AnyObject {
    func userDidTapOnFeed(postId: String)
    func userDidTapOnProfile()
}
class EkoFeedView: UIView, NibFileOwnerLoadable {
    var contentView: UIView!
    
    @IBOutlet private var tableView: UITableView!
    private var adapter: EkoFeedAdapter = EkoFeedAdapter()
    
    weak var delegate: EkoFeedViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibContent()
    }
    
    convenience init() {
        self.init(frame: .zero)
        initialView()
        setupAdapter(adapter: adapter)
    }
    
    convenience init(adapter: EkoFeedAdapter) {
        self.init(frame: .zero)
        initialView()
        setupAdapter(adapter: adapter)
    }
    
    func initialView() {

    }
    
    private func setupAdapter(adapter: EkoFeedAdapter) {
        adapter.setup(in: tableView)
        adapter.delegate = self
        self.adapter = adapter
    }
}

extension EkoFeedView: EkoFeedAdapterDelegate {
    func userDidTapOnFeed(postId: String) {
        delegate?.userDidTapOnFeed(postId: postId)
    }
    
    func userDidTapOnProfile() {
        delegate?.userDidTapOnProfile()
    }
}
