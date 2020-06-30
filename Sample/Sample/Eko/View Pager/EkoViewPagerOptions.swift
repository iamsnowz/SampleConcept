//
//  EkoViewPagerOptions.swift
//  EkoUIKit
//
//  Created by Sarawoot Khunsri on 18/6/2563 BE.
//  Copyright © 2563 Eko Communication. All rights reserved.
//

import UIKit

struct EkoViewPagerOptions {
    enum Distribution {
        /// Tabs are laid out from Left to Right and can be scrolled if the size of all tabs combined exceeds the width of the container view
        /// Width of each tabs is equal to its content width + paddings set in options.
        case normal
        
        /// Tabs are laid out from Left to Right and can be scrolled similar to Normal Distribution. Size of all the tabs are equal.
        /// Width of each tab is equal to the width of the largest tab. Width of largest tab is determined similar to Normal Distribution.
        case equal
        
        /// Tabs are laid out from Left to Right in such a way that it doesnot exceeds the width of its container. So its not scrollable.
        /// Container is divided into equal parts. Number of parts is determined by the number of tabs. Paddings are ignored.
        case segmented
    }
    
    var distribution: Distribution = .normal
    
    var isTabIndicatorAvailable: Bool = true
    var isBottomLineAvailable: Bool = true
    
    var tabViewHeight: CGFloat = 44
    var tabViewPaddingTop: CGFloat = 0
    var tabViewPaddingLeft: CGFloat = 0
    var tabViewPaddingRight: CGFloat = 0
    var tabViewPaddingBottom: CGFloat = 0
    var tabViewBackgroundColor: UIColor = .white
    
    var indicatorHeight: CGFloat = 3
    var indicatorColor: UIColor = .black
    
    var titleActiveColor: UIColor = .black
    var titleInactiveColor: UIColor = .black
    var titleFontActive: UIFont = UIFont.systemFont(ofSize: 16)
    var titleFontInactive: UIFont = UIFont.systemFont(ofSize: 16)
    
    var bottomLineColor: UIColor = UIColor(white: 0.75, alpha: 1)
    
}
