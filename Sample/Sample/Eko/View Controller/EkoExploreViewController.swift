//
//  EkoExploreViewController.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 30/6/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

protocol EkoExploreViewControllerDataSource: AnyObject {
    func viewForRecommended(_ controller: EkoExploreViewController) -> UIView?
    func viewForTrending(_ controller: EkoExploreViewController) -> UIView?
    func viewForTopCategories(_ controller: EkoExploreViewController) -> UIView?
}

class EkoExploreViewController: UIViewController {
    
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var headerView: UIView!
    @IBOutlet private var bodyView: UIView!
    @IBOutlet private var footerView: UIView!
    
    
    weak var dataSource: EkoExploreViewControllerDataSource?
    private var recommendedView: UIView?
    private var trendingView: UIView?
    private var topCategoryiesView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    static func defaultInstance() -> EkoExploreViewController {
        let vc = UIStoryboard(name: "EkoCommunity", bundle: nil).instantiateViewController(withIdentifier: "EkoExploreViewController") as! EkoExploreViewController
        return vc
    }
    
    static func createInstance() -> EkoExploreViewController {
        let vc = UIStoryboard(name: "EkoCommunity", bundle: nil).instantiateViewController(withIdentifier: "EkoExploreViewController") as! EkoExploreViewController
        return vc
    }
    
    private func setupView() {
        recommendedView = dataSource?.viewForRecommended(self) ?? EkoRecommendedView()
        recommendedView?.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(recommendedView!)
        NSLayoutConstraint.activate([
            recommendedView!.topAnchor.constraint(equalTo: headerView.topAnchor),
            recommendedView!.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            recommendedView!.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            recommendedView!.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
        ])
        
        trendingView = dataSource?.viewForTrending(self) ?? EkoTrendingView()
        trendingView?.translatesAutoresizingMaskIntoConstraints = false
        bodyView.addSubview(trendingView!)
        NSLayoutConstraint.activate([
            trendingView!.topAnchor.constraint(equalTo: bodyView.topAnchor),
            trendingView!.bottomAnchor.constraint(equalTo: bodyView.bottomAnchor),
            trendingView!.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor),
            trendingView!.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor),
        ])
       
        topCategoryiesView = dataSource?.viewForTopCategories(self) ?? EkoTopCategoriesView()
        topCategoryiesView?.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(topCategoryiesView!)
        NSLayoutConstraint.activate([
            topCategoryiesView!.topAnchor.constraint(equalTo: footerView.topAnchor),
            topCategoryiesView!.bottomAnchor.constraint(equalTo: footerView.bottomAnchor),
            topCategoryiesView!.leadingAnchor.constraint(equalTo: footerView.leadingAnchor),
            topCategoryiesView!.trailingAnchor.constraint(equalTo: footerView.trailingAnchor),
        ])
    }
    
    func navigateToCategoriesList() {
        let categoryListVC = EkoCategoriesListViewController.createInstance()
        parent?.navigationController?.pushViewController(categoryListVC, animated: true)
    }
    
}

extension EkoExploreViewController: EkoTopCategoriesViewDelegate {
    func userDidSelectCategoryItem() {
        navigateToCategoriesList()
    }
}
