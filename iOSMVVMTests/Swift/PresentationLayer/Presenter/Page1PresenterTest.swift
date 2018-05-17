//
//  Page1PresenterTest.swift
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

class Page1PresenterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /// Try Usecase 1.
    func testFetch() {
        let scheduler = TestScheduler(initialClock: 0)
        let presenter: Page1Presenter = Page1Presenter()
        presenter.usecase = Page1UsecaseMock(scheduler)
        presenter.onTouchEvent()
        
        // ViewModel Test
        scheduler.scheduleAt(99) {
            XCTAssertTrue(presenter.viewModel.text1.value == "sample text1")
            XCTAssertTrue(presenter.viewModel.text2.value == "sample text2")
        }
        // ViewModel Test
        scheduler.scheduleAt(100) {
            XCTAssertTrue(presenter.viewModel.text1.value == "sample text1")
            XCTAssertTrue(presenter.viewModel.text2.value == "OK")
        }
        scheduler.start()
    }
}
