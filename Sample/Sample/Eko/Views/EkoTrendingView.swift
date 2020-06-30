//
//  EkoTrendingView.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class EkoTrendingView: UIView, NibFileOwnerLoadable {
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var heightTableView: NSLayoutConstraint!
    var contentView: UIView!
    
    private var adapter: EkoTrendingAdapter = EkoTrendingAdapter()
    
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
    
    convenience init(adapter: EkoTrendingAdapter) {
        self.init(frame: .zero)
        initialView()
        setupAdapter(adapter: adapter)
    }
    
    func initialView() {
        
    }
    
    private func setupAdapter(adapter: EkoTrendingAdapter) {
        tableView.tableFooterView = UIView()
        
        adapter.setup(in: tableView)
        heightTableView.constant = 5 * 100
        self.adapter = adapter
    }
}
