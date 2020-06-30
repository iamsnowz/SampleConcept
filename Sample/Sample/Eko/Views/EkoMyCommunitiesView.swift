//
//  EkoMyCommunitiesView.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class EkoMyCommunitiesView: UIView, NibFileOwnerLoadable {
    var contentView: UIView!
    
    @IBOutlet private var collectionView: UICollectionView!
    
    private var adapter: EkoMyCommunitiesAdapter = EkoMyCommunitiesAdapter()
    
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
    
    convenience init(adapter: EkoMyCommunitiesAdapter) {
        self.init(frame: .zero)
        initialView()
        setupAdapter(adapter: adapter)
    }
    
    func initialView() {

    }
    
    private func setupAdapter(adapter: EkoMyCommunitiesAdapter) {
        if let layout = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout) {
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: 85, height: 95)
        }
        
        adapter.setup(in: collectionView)
        self.adapter = adapter
    }
}
