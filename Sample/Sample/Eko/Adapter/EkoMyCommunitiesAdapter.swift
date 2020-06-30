//
//  EkoMyCommunitiesAdapter.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class EkoMyCommunitiesAdapter: NSObject {
    var myCommunityManager = EkoMyCommunityManager()
    
    private var collectionView: UICollectionView?
    
    func setup(in collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: "EkoMyCommunitiesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EkoMyCommunitiesCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView = collectionView
    }
}


extension EkoMyCommunitiesAdapter: UICollectionViewDelegate {
    
}

extension EkoMyCommunitiesAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myCommunityManager.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EkoMyCommunitiesCollectionViewCell", for: indexPath) as! EkoMyCommunitiesCollectionViewCell
        cell.configureCommunity(with: myCommunityManager.getMyCommunityItem(at: indexPath.row))
        return cell
    }
}

