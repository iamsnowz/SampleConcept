//
//  EkoTrendingManager.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

struct EkoTrendingObject {
    let name: String
    let description: String
    let follower: String
}

class EkoTrendingManager {
    private var trendingObject: [EkoTrendingObject] = [
        EkoTrendingObject(name: "Liverpool", description: "Anything all about Liverpool", follower: "150K followers | 148 mutual friends"),
        EkoTrendingObject(name: "Who will win the Oscars", description: "Anything all about oscarsoscar...", follower: "150K followers | 148 mutual friends"),
        EkoTrendingObject(name: "BTS", description: "Official community for Army", follower: "150K followers | 148 mutual friends"),
        EkoTrendingObject(name: "BLACKPINK", description: "BlinkBlinkBlink", follower: "150K followers | 148 mutual friends"),
        EkoTrendingObject(name: "Meme of the day", description: "Express your everyday’s mood", follower: "150K followers | 148 mutual friends")
    ]
    
    func getTrendingItem(at index: Int) -> EkoTrendingObject {
        return trendingObject[index]
    }
    
    func numberOfItems() -> Int {
        return trendingObject.count
    }
}
