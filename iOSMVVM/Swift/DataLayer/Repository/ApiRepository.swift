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
import NSObject_Rx

class ApiRepository: BaseReopository {
    
    /** インスタンス */
    static let instance = ApiRepository()
    
    /** Provider */
    private let sampleApiProvider = MoyaProvider<SampleApi>()
    
    /**
     * 処理
     */
    public func fetch(params: [String : Any]) -> Single<FetchEntity>? {
        let successHandler = {(response: FetchResponse) in
            NSLog("response \(response)")
        }
        super.apiRequest(sampleApiProvider, .SAMPLE, onSuccess: successHandler, onError: super.errorHandler)
        return nil
    }
    
//    func temp() {
//        sampleApiProvider
//            .rx
//            .request(SampleApi.sample)
//            .filterSuccessfulStatusCodes()
//            .map(FetchResponse.self)
//            .subscribe(
//                onSuccess: { (response) in
//                    NSLog("response \(response)")
//            },
//                onError: { (error) in
//                    NSLog("error \(error)")
//            })
//            .disposed(by: rx.disposeBag)
//    }
}
