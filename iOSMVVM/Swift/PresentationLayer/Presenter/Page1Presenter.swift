//
//  Page1Presenter.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/15.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import NSObject_Rx

class Page1Presenter: BasePresenter {
    
    /** ViewModel */
    public var viewModel: Page1ViewModel!
    
    /** Usecase */
    internal var usecase: Page1UsecaseProtocol!
    
    /**
     * Dependency Injection
     */
    override func inject() {
        viewModel = Page1ViewModel()
        usecase = Page1Usecase()
    }
    
    /**
     * Touch Event
     */
    public func onTouchEvent() {
        NSLog("onTouch. %@", viewModel.text1.value)
        usecase.onClickToButton().subscribe(onNext: { (str, entity) in
            //
            self.viewModel.text2.accept(entity.result)
        }, onError: { (error) in
            // 失敗時はインジケータ非表示
            // hideIndicator()
        }, onCompleted: {
            // 失敗時はインジケータ非表示
            // hideIndicator()
        }, onDisposed: nil).disposed(by: rx.disposeBag)
    }
}
