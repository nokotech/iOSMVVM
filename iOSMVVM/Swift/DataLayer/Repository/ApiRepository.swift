//
//  ApiRepository.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/15.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa

class ApiRepository {
    
    
    
    public func fetch(params: [String : AnyObject]) -> Single<String>? {
        let provider = MoyaProvider<SampleApi>()
        provider.rx.request(SampleApi.sample)
            .filterSuccessfulStatusCodes()
        return nil
    }
}
