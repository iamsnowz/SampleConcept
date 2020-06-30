//
//  EkoRecommendManager.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

struct EkoRecommendObject {
    let name: String
    let memberFollower: String
    let description: String
}

class EkoRecommendManager {
    private var recommendObject: [EkoRecommendObject] = [
    EkoRecommendObject(name: "Jamie Oliver", memberFollower: "150K members | 148 mutual friends", description: "Chef & Dad\nRecipe, book & more right here 👇"),
    EkoRecommendObject(name: "Giada Food", memberFollower: "150K members | 148 mutual friends", description: "Chef, author, mother\nwww.giadzy.com"),
    EkoRecommendObject(name: "Jamie Oliver", memberFollower: "150K members | 148 mutual friends", description: "Chef & Dad\nRecipe, book & more right here 👇"),
    EkoRecommendObject(name: "Giada Food", memberFollower: "150K members | 148 mutual friends", description: "Chef, author, mother\nwww.giadzy.com")
    ]
    
    func getRecommend(at index: Int) -> EkoRecommendObject {
        return recommendObject[index]
    }
    
    func numberOfItems() -> Int {
        return recommendObject.count
    }
}
