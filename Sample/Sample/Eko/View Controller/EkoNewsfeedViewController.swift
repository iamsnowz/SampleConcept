//
//  EkoNewsfeedViewController.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 30/6/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

protocol EkoNewsfeedViewControllerDataSource: AnyObject {
    func viewForMyCommunities() -> UIView?
    func viewForFeed() -> UIView?
}

class EkoNewsfeedViewController: UIViewController {
    @IBOutlet private var headerView: UIView!
    @IBOutlet private var containerView: UIView!
    weak var dataSource: EkoNewsfeedViewControllerDataSource?
    private var feedAdapter: EkoFeedAdapter = EkoFeedAdapter()
    private var header: UIView?
    private var body: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    static func createInstance() -> EkoNewsfeedViewController {
        let vc = UIStoryboard(name: "EkoCommunity", bundle: nil).instantiateViewController(withIdentifier: "EkoNewsfeedViewController") as! EkoNewsfeedViewController
        return vc
    }
    
    func setFeedAdapter(adapter: EkoFeedAdapter) {
        feedAdapter = adapter
    }
    
    private func setupView() {
        body = dataSource?.viewForMyCommunities() ?? EkoFeedView()
        if let feedView = body as? EkoFeedView {
            feedView.delegate = self
        }
        body?.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(body!)
        
        NSLayoutConstraint.activate([
            body!.topAnchor.constraint(equalTo: containerView.topAnchor),
            body!.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            body!.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            body!.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
        
        header = dataSource?.viewForMyCommunities() ?? EkoMyCommunitiesView()
        header?.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(header!)
        NSLayoutConstraint.activate([
            header!.topAnchor.constraint(equalTo: headerView.topAnchor),
            header!.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            header!.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            header!.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
        ])
    }
    
    
}

extension EkoNewsfeedViewController: EkoFeedViewDelegate {
    func userDidTapOnFeed(postId: String) {
        let feedDetail = EkoNewsfeedDetailViewController.createInstance()
        parent?.navigationController?.pushViewController(feedDetail, animated: true)
    }
    
    func userDidTapOnProfile() {
        let profile = EkoProfileViewController.createInstance()
        parent?.navigationController?.pushViewController(profile, animated: true)
    }
}
