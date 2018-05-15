//
//  BaseViewController.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/15.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    /**
     * Abs
     */
    func inject() {}

    override func viewDidLoad() {
        super.viewDidLoad()
        inject();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
}
