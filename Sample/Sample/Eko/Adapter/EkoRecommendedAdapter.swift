//
//  EkoRecommendedAdapter.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class EkoRecommendedAdapter: NSObject {
    
    private var recommendManager = EkoRecommendManager()
    private var collectionView: UICollectionView?
    
    func setup(in collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: "EkoRecommendedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EkoRecommendedCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView = collectionView
    }
}

extension EkoRecommendedAdapter: UICollectionViewDelegate {
    
}

extension EkoRecommendedAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendManager.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EkoRecommendedCollectionViewCell", for: indexPath) as! EkoRecommendedCollectionViewCell
        cell.configureRecommend(with: recommendManager.getRecommend(at: indexPath.row))
        return cell
    }
}
