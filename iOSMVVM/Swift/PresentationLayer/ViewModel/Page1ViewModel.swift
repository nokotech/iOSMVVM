//
//  Page1ViewModel.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/15.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class Page1ViewModel {
    
    let text1: BehaviorRelay<String> = BehaviorRelay(value: "sample text1")
    let text2: BehaviorRelay<String> = BehaviorRelay(value: "sample text2")
    
}
