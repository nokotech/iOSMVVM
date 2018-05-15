//
//  Page1Presenter.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/15.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import Foundation

class Page1Presenter {
    
    /** ViewModel */
    public /* fileprivate(set)*/ var viewModel: Page1ViewModel?

    /** Getter, Setter */
    
    init() {
        self.viewModel = Page1ViewModel()
    }
    
    /**
     * Touch Event
     */
    public func onTouchEvent() {
        NSLog("onTouch. " + viewModel!.text1.value)
    }

}
