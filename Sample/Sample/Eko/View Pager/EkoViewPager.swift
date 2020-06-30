//
//  EkoViewPager.swift
//  EkoUIKit
//
//  Created by Sarawoot Khunsri on 17/6/2563 BE.
//  Copyright © 2563 Eko Communication. All rights reserved.
//

import UIKit

protocol EkoViewPagerDataSource: AnyObject {
    /// Number of pages to be displayed
    func numberOfPages() -> Int
    
    /// ViewController for required page position
    func viewControllerAtPosition(position: Int) -> UIViewController
    
    /// Tab structure of the page
    func tabsForPages(position: Int) -> EkoViewPagerTab
    
    /// UIViewController which is to be displayed at first. Default is 0
    func startViewPagerAtIndex() -> Int
    
}

private enum IdentifierType {
    static let header = "COLLECTION_HEADER_IDENTIFIER"
    static let page = "COLLECTION_PAGE_IDENTIFIER"
}

final class EkoViewPager: NSObject {
    
    private weak var dataSource: EkoViewPagerDataSource?
    
    private let collectionHeader: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private let collectionPage: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private let bottomLineView: UIView = UIView()
    private let tabIndicatorView: UIView = UIView()
    private var tabIndicatorLeadingConstraint: NSLayoutConstraint!
    
    private var options: EkoViewPagerOptions = EkoViewPagerOptions()
    
    private var containerView: UIView = UIView()
    private var viewController: UIViewController?
    private var view: UIView
    
    private var currentPosition: Int = 0
    
    init(viewController: UIViewController) {
        self.viewController = viewController
        view = viewController.view
    }
    
    /// Sets the customization options for ViewPager. This should be called before the build method.
    /// Setting of options is mandatory.
    ///
    /// - Parameter options: Customization options instance
    func setOptions(options: EkoViewPagerOptions) {
        self.options = options
    }
    
    
    /// Sets the datasource of the viewpager. This should be called before the build method.
    /// Setting of data source is mandatory.
    ///
    /// - Parameter dataSource: DataSource for this viewpager
    func setDataSource(dataSource: EkoViewPagerDataSource) {
        self.dataSource = dataSource
    }
    
    func build() {
        setupContainerView()
        setupCollectionHeader()
        setupCollectionViewPage()
        setupTabIndicator()
        setupBottomLineView()
    }
    
    func setCurrentPosition(position: Int) {
        currentPosition = position
        let path = IndexPath(item: currentPosition, section: 0)
        
        if options.isTabIndicatorAvailable {
            UIView.animate(withDuration: 0.25) { [unowned self] in
                self.tabIndicatorLeadingConstraint.constant = self.sizeForItemHeader().width * CGFloat(position)
                self.collectionHeader.layoutIfNeeded()
            }
        }
        
        DispatchQueue.main.async {
            if self.options.distribution == .normal {
                self.collectionHeader.scrollToItem(at: path, at: .centeredHorizontally, animated: true)
            }
            
            self.collectionHeader.reloadData()
            self.collectionPage.scrollToItem(at: path, at: .centeredHorizontally, animated: true)
        }
    }
    
    private func setupContainerView() {
        setupForAutolayout(view: containerView, inView: view)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: options.tabViewPaddingTop),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: options.tabViewPaddingBottom)
        ])
        
        containerView.backgroundColor = options.tabViewBackgroundColor
    }
    
    private func setupCollectionHeader() {
        setupForAutolayout(view: collectionHeader, inView: containerView)
        
        NSLayoutConstraint.activate([
            collectionHeader.topAnchor.constraint(equalTo: containerView.topAnchor),
            collectionHeader.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: options.tabViewPaddingLeft),
            collectionHeader.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -options.tabViewPaddingRight),
            collectionHeader.heightAnchor.constraint(equalToConstant: options.tabViewHeight)
        ])
        
        (collectionHeader.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        collectionHeader.register(HeaderCell.self, forCellWithReuseIdentifier: IdentifierType.header)
        collectionHeader.backgroundColor = options.tabViewBackgroundColor
        collectionHeader.showsHorizontalScrollIndicator = false
        collectionHeader.delegate = self
        collectionHeader.dataSource = self
        
    }
    
    private func setupCollectionViewPage() {
        setupForAutolayout(view: collectionPage, inView: containerView)
        
        NSLayoutConstraint.activate([
            collectionPage.topAnchor.constraint(equalTo: collectionHeader.bottomAnchor),
            collectionPage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionPage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            collectionPage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        (collectionPage.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        collectionPage.register(UICollectionViewCell.self, forCellWithReuseIdentifier: IdentifierType.page)
        collectionPage.backgroundColor = .white
        collectionPage.showsHorizontalScrollIndicator = false
        collectionPage.isPagingEnabled = true
        collectionPage.delegate = self
        collectionPage.dataSource = self
    }
    
    private func setupTabIndicator() {
        if options.isTabIndicatorAvailable {
            setupForAutolayout(view: tabIndicatorView, inView: collectionHeader)
                
            tabIndicatorLeadingConstraint = NSLayoutConstraint(item: tabIndicatorView, attribute: .leading, relatedBy: .equal, toItem: collectionHeader, attribute: .leading, multiplier: 1, constant: 0)
            collectionHeader.addConstraint(tabIndicatorLeadingConstraint)
            NSLayoutConstraint.activate([
                tabIndicatorView.bottomAnchor.constraint(equalTo: collectionHeader.bottomAnchor, constant: options.tabViewHeight),
                tabIndicatorView.widthAnchor.constraint(equalToConstant: sizeForItemHeader().width),
                tabIndicatorView.heightAnchor.constraint(equalToConstant: 3)
            ])
            tabIndicatorLeadingConstraint.isActive = true
            tabIndicatorView.backgroundColor = options.indicatorColor
        }
    }
    
    private func setupBottomLineView() {
        if options.isBottomLineAvailable {
            setupForAutolayout(view: bottomLineView, inView: containerView)
            bottomLineView.backgroundColor = options.bottomLineColor
        }
    }
    
    private func sizeForItemHeader() -> CGSize {
        guard let viewPagerSource = dataSource else { return .zero }
        let spacer = CGFloat(viewPagerSource.numberOfPages())
        switch options.distribution {
        case .normal:
            return CGSize(width: view.frame.width * 20 / 100, height: options.tabViewHeight)
        case .equal:
            return CGSize(width: view.frame.width / (spacer < 5 ? spacer : 5), height: options.tabViewHeight)
        case .segmented:
            return CGSize(width: view.frame.width / spacer, height: options.tabViewHeight)
        }
    }
    
    private func setupForAutolayout(view: UIView?, inView parentView: UIView) {
        
        guard let v = view else { return }
        
        v.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(v)
    }
    
}

extension EkoViewPager: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionHeader == collectionView {
            setCurrentPosition(position: indexPath.row)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == collectionPage {
            let currentIndex = Int(self.collectionPage.contentOffset.x / collectionPage.frame.size.width)
            setCurrentPosition(position: currentIndex)
        }
    }
}

extension EkoViewPager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewPagerSource = dataSource else { return 0 }
        return viewPagerSource.numberOfPages()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var identifier: String
        if collectionHeader == collectionView {
            identifier = IdentifierType.header
        } else {
            identifier = IdentifierType.page
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        configure(for: cell, at: indexPath)
        return cell
    }
    
    private func configure(for cell: UICollectionViewCell, at indexPath: IndexPath) {
        guard let viewPagerSource = dataSource else { return }
        if let cell = cell as? HeaderCell {
            let tabItem = viewPagerSource.tabsForPages(position: indexPath.row)
            cell.titleLabel.text = tabItem.title
            cell.options = options
            var didSelect = false
            
            if currentPosition == indexPath.row {
                didSelect = true
            }
            
            cell.select(didSelect: didSelect)
            
        } else {
            let vc = viewPagerSource.viewControllerAtPosition(position: indexPath.row)
            viewController?.addChild(vc)
            cell.addSubview(vc.view)
            vc.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                vc.view.topAnchor.constraint(equalTo: cell.topAnchor, constant: 50),
                vc.view.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
                vc.view.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
                vc.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
            ])
        }
    }
}

extension EkoViewPager: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionHeader {
            return sizeForItemHeader()
        }
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

private final class HeaderCell: UICollectionViewCell {
    var titleLabel: UILabel = UILabel()
    var options: EkoViewPagerOptions!
    
    private let indicator = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func select(didSelect: Bool) {
        indicator.backgroundColor = options.indicatorColor
        
        if didSelect {
            titleLabel.textColor = options.titleActiveColor
            titleLabel.font = options.titleFontActive
        } else {
            titleLabel.textColor = options.titleInactiveColor
            titleLabel.font = options.titleFontInactive
        }
    }
    
    private func setupView(){
        setupTitleLabel()
    }
    
    private func setupTitleLabel() {
        // view
        addSubview(titleLabel)
        
        // label
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
        ])
        
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
    }
    
}
