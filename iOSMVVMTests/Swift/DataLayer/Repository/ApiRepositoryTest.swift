//
//  ApiRepositoryTest.swift
//  iOSMVVMTests
//
//  Created by takenaka on 2018/05/16.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import XCTest
import RxBlocking

@testable import iOSMVVM

class ApiRepositoryTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    /// Try Api. (url: https://github.com/nokotech/iOSMVVM/blob/master/MockData/sample.json)
    func testFetch() {
        let apiRepository: ApiRepositoryProtocol = ApiRepository()
        let p = ["a": "a"]
        let entity: FetchEntity? = try! apiRepository.fetch(params: p)?.toBlocking().last()
        XCTAssertTrue(entity?.result == "OK")
    }
    
    /// Try Api. (url: https://github.com/nokotech/iOSMVVM/blob/master/MockData/sample.json)
    func testWatch() {
        let apiRepository: ApiRepositoryProtocol = ApiRepository()
        let p = ["a": "a"]
        let entity: WatchEntity? = try! apiRepository.watch(params: p)?.toBlocking().last()
        XCTAssertTrue(entity?.result == "OK")
    }
}
