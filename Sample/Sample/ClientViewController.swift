//
//  ClientViewController.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 30/6/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class ClientViewController: UIViewController {
    var exploreViewController: EkoExploreViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func communityTapped() {
        let community = EkoCommunityViewController.createInstance()
        community.dataSource = self
        let nav = UINavigationController(rootViewController: community)
        present(nav, animated: true, completion: nil)
    }
    
    @IBAction func customAdapterTapped() {
        let customVC = CustomAdapterViewController(nibName: "CustomAdapterViewController", bundle: nil)
        let nav = UINavigationController(rootViewController: customVC)
        present(nav, animated: true, completion: nil)
    }
}

extension ClientViewController: EkoCommunityViewControllerDataSource {
    func viewForNewsfeed() -> EkoViewPagerTab? {
        return nil
    }
    func viewForExplore() -> EkoViewPagerTab? {
        exploreViewController = EkoExploreViewController.createInstance()
        exploreViewController?.dataSource = self
        return EkoViewPagerTab(title: "Explore", viewController: exploreViewController!)//nil//EkoViewPagerTab(title: "Friends", viewController: FriendListViewController())
    }
}

extension ClientViewController: EkoExploreViewControllerDataSource {
    func viewForRecommended(_ controller: EkoExploreViewController) -> UIView? {
        let replaceView = ClientReplaceView()
        replaceView.actionHandler = exploreViewController?.navigateToCategoriesList

        replaceView.actionHandler = {
            let alert = UIAlertController(title: "Alert", message: "This is action from custom replace view of some part", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            controller.present(alert, animated: true, completion: nil)
        }
        return replaceView
    }
    
    func viewForTrending(_ controller: EkoExploreViewController) -> UIView? {
        let replaceView = ClientSecondReplaceView()
        replaceView.actionHandler = exploreViewController?.navigateToCategoriesList
        return replaceView
    }
    
    func viewForTopCategories(_ controller: EkoExploreViewController) -> UIView? {
        return nil
    }
    
    
}
