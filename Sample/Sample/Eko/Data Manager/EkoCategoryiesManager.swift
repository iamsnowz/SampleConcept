//
//  EkoCategoryiesManager.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

struct EkoCategoryiesObject {
    let name: String
}

class EkoCategoryiesManager {
    private var object: [EkoCategoryiesObject] = [
        EkoCategoryiesObject(name: "Sport"),
        EkoCategoryiesObject(name: "Travel"),
        EkoCategoryiesObject(name: "Music"),
        EkoCategoryiesObject(name: "Movie"),
        EkoCategoryiesObject(name: "Music"),
        EkoCategoryiesObject(name: "Movie")
    ]
    
    func getCategoryItem(at index: Int) -> EkoCategoryiesObject {
        return object[index]
    }
    
    func numberOfItems() -> Int {
        return object.count
    }
}
