//
//  BaseUsecaseTest.swift
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

class BaseUsecaseTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /// Try Usecase.
    func testInit() {
        let scheduler = TestScheduler(initialClock: 0)
        _ = BaseUsecase()
        scheduler.start()
    }
}
