//
//  EkoNewsfeedDetailViewController.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 30/6/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class EkoNewsfeedDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func defaultInstance() -> EkoNewsfeedDetailViewController {
        let vc = UIStoryboard(name: "EkoCommunity", bundle: nil).instantiateViewController(withIdentifier: "EkoNewsfeedDetailViewController") as! EkoNewsfeedDetailViewController
        return vc
    }
    
    static func createInstance() -> EkoNewsfeedDetailViewController {
        let vc = UIStoryboard(name: "EkoCommunity", bundle: nil).instantiateViewController(withIdentifier: "EkoNewsfeedDetailViewController") as! EkoNewsfeedDetailViewController
        return vc
    }
    
    
}
