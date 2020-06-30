//
//  CustomAdapterViewController.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class CustomAdapterViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    var adapter = EkoFeedAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        adapter.setup(in: tableView)
        adapter.delegate = self
    }
}

extension CustomAdapterViewController: EkoFeedAdapterDelegate {
    
    func userDidTapOnFeed(postId: String) {
        let customDetail = ClientCustomFeedDetailViewController(nibName: "ClientCustomFeedDetailViewController", bundle: nil)
        navigationController?.pushViewController(customDetail, animated: true)
    }
    
    func userDidTapOnProfile() {
        let profile = EkoProfileViewController.createInstance()
        navigationController?.pushViewController(profile, animated: true)
    }
    
    
}
