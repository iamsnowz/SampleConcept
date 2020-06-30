//
//  EkoTrendingAdapter.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class EkoTrendingAdapter: NSObject {
    private var trendingManager = EkoTrendingManager()
    
    private var tableView: UITableView?
    
    func setup(in tableView: UITableView) {
        tableView.register(UINib(nibName: "EkoTrendingTableViewCell", bundle: nil), forCellReuseIdentifier: "EkoTrendingTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView = tableView
    }
}

extension EkoTrendingAdapter: UITableViewDelegate {
    
}

extension EkoTrendingAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingManager.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EkoTrendingTableViewCell", for: indexPath) as! EkoTrendingTableViewCell
        cell.configureTrending(with: trendingManager.getTrendingItem(at: indexPath.row))
        return cell
    }
}
