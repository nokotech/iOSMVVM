//
//  Page1Usecase.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/15.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import Foundation
import RxSwift

class Page1Usecase: NSObject {
    
    func onClickToButton() -> Observable<FetchEntity>? {
        let dic: [String: Any] = [
            "key1": "value1",
            "key2": "value2"
        ]
        return ApiRepository.instance.fetch(params: dic)?.asObservable()
    }
    
}
