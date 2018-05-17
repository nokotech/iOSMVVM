//
//  Page1Usecase.swift
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

class Page1UsecaseTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /// Try Usecase 1.
    func testFetch() {
        let scheduler = TestScheduler(initialClock: 0)
        let page1Usecase: Page1Usecase = Page1Usecase()
        page1Usecase.apiRepository = ApiRepositoryMock(scheduler)
        
        // Usecase Test
        scheduler.scheduleAt(100) {
//            let entity: FetchEntity? = try! page1Usecase.onClickToButton().toBlocking(timeout: 3).last()
//            XCTAssertTrue(entity?.result == "OK")
        }
        
        // Usecase Test
        scheduler.scheduleAt(200) {
//            let entity: FetchEntity? = try! page1Usecase.onClickToButton().toBlocking(timeout: 3).last()
//            XCTAssertTrue(entity?.result == "OK")
        }
        
        scheduler.start()
    }
}
