//
//  EkoCategoriesListViewController.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class EkoCategoriesListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    static func defaultInstance() -> EkoCategoriesListViewController {
        let vc = UIStoryboard(name: "EkoCommunity", bundle: nil).instantiateViewController(withIdentifier: "EkoCategoriesListViewController") as! EkoCategoriesListViewController
        return vc
    }
    
    static func createInstance() -> EkoCategoriesListViewController {
        let vc = UIStoryboard(name: "EkoCommunity", bundle: nil).instantiateViewController(withIdentifier: "EkoCategoriesListViewController") as! EkoCategoriesListViewController
        return vc
    }

}
