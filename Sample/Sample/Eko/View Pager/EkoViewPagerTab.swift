//
//  EkoViewPagerTab.swift
//  EkoUIKit
//
//  Created by Sarawoot Khunsri on 18/6/2563 BE.
//  Copyright © 2563 Eko Communication. All rights reserved.
//

import UIKit

struct EkoViewPagerTab {
    
    var title: String
    var viewController: UIViewController
    init(title: String, viewController: UIViewController) {
        self.title = title
        self.viewController = viewController
    }
}
