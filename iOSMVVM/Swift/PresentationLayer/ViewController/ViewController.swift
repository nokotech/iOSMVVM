//
//  ViewController.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/15.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Page1に遷移
        let vc: UIViewController = Page1ViewController().instantiateViewControllerWithMessage(string: "aaaaaaaaa")
        self.present(vc, animated: true, completion: nil)
    }
}

