//
//  EkoRecommendedView.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class EkoRecommendedView: UIView, NibFileOwnerLoadable {
    @IBOutlet private var collectionView: UICollectionView!
    
    var contentView: UIView!
    private var adapter: EkoRecommendedAdapter = EkoRecommendedAdapter()
    
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
    
    convenience init(adapter: EkoRecommendedAdapter) {
        self.init(frame: .zero)
        initialView()
        setupAdapter(adapter: adapter)
    }
    
    func initialView() {

    }
    
    private func setupAdapter(adapter: EkoRecommendedAdapter) {
        if let layout = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout) {
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: 312 , height: 200)
            layout.minimumLineSpacing = 20
            layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        }
        
        adapter.setup(in: collectionView)
        self.adapter = adapter
    }
}
