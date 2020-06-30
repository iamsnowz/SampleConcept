//
//  EkoTopCategoriesView.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

protocol EkoTopCategoriesViewDelegate: AnyObject {
    func userDidSelectCategoryItem()
}

class EkoTopCategoriesView: UIView, NibFileOwnerLoadable {

    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet private var heightCollectionView: NSLayoutConstraint!
    var contentView: UIView!
    weak var delegate: EkoTopCategoriesViewDelegate?
    private var adapter: EkoTopCategoriesAdapter = EkoTopCategoriesAdapter()
    
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
    
    convenience init(adapter: EkoTopCategoriesAdapter) {
        self.init(frame: .zero)
        initialView()
        setupAdapter(adapter: adapter)
    }
    
    func initialView() {

    }
    
    private func setupAdapter(adapter: EkoTopCategoriesAdapter) {
        if let layout = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout) {
            layout.scrollDirection = .vertical
            layout.itemSize = CGSize(width: 165 , height: 126)
            layout.minimumLineSpacing = 20
            layout.minimumInteritemSpacing = 20
            layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        }
        
        heightCollectionView.constant = 3 * 120 + (20 * 3) + 100
        
        adapter.setup(in: collectionView)
        adapter.delegate = self
        self.adapter = adapter
    }
}

extension EkoTopCategoriesView: EkoTopCategoriesAdapterDelegate {
    func userDidSelectCategoryItem() {
        delegate?.userDidSelectCategoryItem()
    }
}
