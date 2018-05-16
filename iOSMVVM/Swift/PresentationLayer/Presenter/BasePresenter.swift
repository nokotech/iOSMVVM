//
//  BasePresenter.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/16.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import Foundation

class BasePresenter: NSObject {
    
    override init() {
        super.init()
        inject()
    }
    
    /**
     * Dependency Injection
     */
    func inject() {}
}
