//
//  Mock.swift
//  iOSMVVMTests
//
//  Created by takenaka on 2018/05/17.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxBlocking
import RxTest

@testable import iOSMVVM

class Page1UsecaseMock: Page1UsecaseProtocol {
    
    var scheduler: TestScheduler?
    init(_ scheduler: TestScheduler) {
        self.scheduler = scheduler
    }
    
    /// クリック時に画面情報を更新する
    func onClickToButton() -> Observable<FetchEntity> {
        let xs: TestableObservable<FetchEntity> = scheduler!.createHotObservable([
            Recorded.next(100, FetchEntity(result: "OK")),
            Recorded.completed(200),
            ])
        return xs.asObservable()
    }
}
