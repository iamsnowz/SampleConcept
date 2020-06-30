//
//  EkoProfileViewController.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 30/6/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class EkoProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func defaultInstance() -> EkoProfileViewController {
        let vc = UIStoryboard(name: "EkoCommunity", bundle: nil).instantiateViewController(withIdentifier: "EkoProfileViewController") as! EkoProfileViewController
        return vc
    }
    
    static func createInstance() -> EkoProfileViewController {
        let vc = UIStoryboard(name: "EkoCommunity", bundle: nil).instantiateViewController(withIdentifier: "EkoProfileViewController") as! EkoProfileViewController
        return vc
    }
}
