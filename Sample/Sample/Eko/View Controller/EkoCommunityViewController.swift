//
//  EkoCommunityViewController.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 30/6/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit
protocol EkoView: UIView { }

protocol EkoCommunityViewControllerDataSource: AnyObject {
    func viewForNewsfeed() -> EkoViewPagerTab?
    func viewForExplore() -> EkoViewPagerTab?
}

class EkoCommunityViewController: UIViewController {
    weak var dataSource: EkoCommunityViewControllerDataSource?
    
    private var viewPager: EkoViewPager?
    private var viewPagerTab: [EkoViewPagerTab]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Community"
        setupView()
    }
    
    static func defaultInstance() -> EkoCommunityViewController {
        let vc = UIStoryboard(name: "EkoCommunity", bundle: nil).instantiateViewController(withIdentifier: "EkoCommunityViewController") as! EkoCommunityViewController
        return vc
    }
    
    static func createInstance() -> EkoCommunityViewController {
        let vc = UIStoryboard(name: "EkoCommunity", bundle: nil).instantiateViewController(withIdentifier: "EkoCommunityViewController") as! EkoCommunityViewController
        return vc
    }
    
    private func setupView() {
        var options = EkoViewPagerOptions()
        options.tabViewPaddingLeft = 16
        options.tabViewPaddingRight = 16
        options.distribution = .normal
        
        viewPagerTab = [
            dataSource?.viewForNewsfeed() ?? EkoViewPagerTab(title: "Newsfeed", viewController: EkoNewsfeedViewController.createInstance()),
            dataSource?.viewForExplore() ?? EkoViewPagerTab(title: "Explore", viewController: EkoExploreViewController.defaultInstance())
        ]
        
        viewPager = EkoViewPager(viewController: self)
        viewPager?.setDataSource(dataSource: self)
        viewPager?.setOptions(options: options)
        viewPager?.build()
    }
}

extension EkoCommunityViewController: EkoViewPagerDataSource {
    func numberOfPages() -> Int {
        return viewPagerTab.count
    }
    
    func viewControllerAtPosition(position: Int) -> UIViewController {
        return viewPagerTab[position].viewController
    }
    
    func tabsForPages(position: Int) -> EkoViewPagerTab {
        return viewPagerTab[position]
    }
    
    func startViewPagerAtIndex() -> Int {
        return 0
    }
    
    
}
