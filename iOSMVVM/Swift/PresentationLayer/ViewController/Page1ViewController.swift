//
//  Page1ViewController.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/15.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import Foundation
import UIKit

class Page1ViewController: BaseViewController {
    
    var presenter: Page1Presenter?
    
    /**
     * Dependency Injection
     */
    override func inject() {
         presenter = Page1Presenter()
    }
    
    /**
     * 初期描画
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /**
     * 画面遷移
     */
    public func instantiateViewControllerWithMessage(string: NSString?) -> UIViewController {
        let storyBoard: UIStoryboard = R.storyboard.page1()
        let vc: UIViewController = storyBoard.instantiateViewController(withIdentifier: "Page1")
        return vc
    }
}
