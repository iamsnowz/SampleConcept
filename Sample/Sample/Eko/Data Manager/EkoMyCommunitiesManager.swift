//
//  EkoMyCommunitiesManager.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

struct EkoMyCommunityObject {
    let name: String
}

class EkoMyCommunityManager {
    private var myCommunityObject: [EkoMyCommunityObject] = [
        EkoMyCommunityObject(name: "Liverpool"),
        EkoMyCommunityObject(name: "Manchester City"),
        EkoMyCommunityObject(name: "Leicester City"),
        EkoMyCommunityObject(name: "Chelsea"),
        EkoMyCommunityObject(name: "Manchester United"),
        EkoMyCommunityObject(name: "Wolverhampton Wanderers"),
        EkoMyCommunityObject(name: "Tottenham Hotspur"),
        EkoMyCommunityObject(name: "Burnley")
    ]
    
    func getMyCommunityItem(at index: Int) -> EkoMyCommunityObject {
        return myCommunityObject[index]
    }
    
    func numberOfItems() -> Int {
        return myCommunityObject.count
    }
}
