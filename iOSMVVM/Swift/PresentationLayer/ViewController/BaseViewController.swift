//
//  BaseViewController.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/15.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {
    
    /** */
    var bag = RxSwift.DisposeBag()
    
    /**
     * Abs
     */
    func inject() {}
    
    /**
     *
     */
    func databinding() {}

    /**
     *
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        inject()
        databinding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
}
