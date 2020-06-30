//
//  EkoTopCategoriesAdapter.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit
protocol EkoTopCategoriesAdapterDelegate: AnyObject {
    func userDidSelectCategoryItem()
}
class EkoTopCategoriesAdapter: NSObject {
    weak var delegate: EkoTopCategoriesAdapterDelegate?
    private var categoryManager = EkoCategoryiesManager()
    private var collectionView: UICollectionView?
    
    func setup(in collectionView: UICollectionView) {
        
        collectionView.register(UINib(nibName: "EkoTopCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EkoTopCategoriesCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView = collectionView
    }
}

extension EkoTopCategoriesAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.userDidSelectCategoryItem()
    }
}

extension EkoTopCategoriesAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryManager.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EkoTopCategoriesCollectionViewCell", for: indexPath) as! EkoTopCategoriesCollectionViewCell
        cell.configureCategory(with: categoryManager.getCategoryItem(at: indexPath.row))
        return cell
    }
}
