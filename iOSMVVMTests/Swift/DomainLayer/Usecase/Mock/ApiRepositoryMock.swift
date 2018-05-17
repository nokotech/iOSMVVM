//
//  ApiRepositoryMock.swift
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

class ApiRepositoryMock: ApiRepositoryProtocol {
    
    var scheduler: TestScheduler?
    init(_ scheduler: TestScheduler) {
        self.scheduler = scheduler
    }
    
    func fetch(params: [String : Any]) -> Single<FetchEntity>? {
        let xs: TestableObservable<FetchEntity> = scheduler!.createHotObservable([
            Recorded.next(100, FetchEntity(result: "OK")),
            Recorded.completed(200),
            ])
        return xs.asSingle()
    }
    
    func watch(params: [String : Any]) -> Single<WatchEntity>? {
        let xs: TestableObservable<WatchEntity> = scheduler!.createHotObservable([
            Recorded.next(100, WatchEntity(result: "OK")),
            Recorded.completed(200),
            ])
        return xs.asSingle()
    }
}
