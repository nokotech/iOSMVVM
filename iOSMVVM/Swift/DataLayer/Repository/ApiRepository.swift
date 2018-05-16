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

protocol ApiRepositoryProtocol {
    func fetch(params: [String : Any]) -> Single<FetchEntity>?
    func watch(params: [String : Any]) -> Single<WatchEntity>?
}

class ApiRepository: BaseReopository, ApiRepositoryProtocol {
    
    /// インスタンス
    static let instance: ApiRepositoryProtocol = ApiRepository()
    
    /// Provider
    private let sampleApiProvider = MoyaProvider<SampleApi>()

    ///
    public func fetch(params: [String : Any]) -> Single<FetchEntity>? {
        return super.apiRequest(self.sampleApiProvider, .SAMPLE)
    }
    
    ///
    public func watch(params: [String : Any]) -> Single<WatchEntity>? {
        return Single<WatchEntity>.create(subscribe: { (observer) -> Disposable in
            let successHandler = {(entity: WatchEntity) in
                super.successHandler(entity)
                observer(SingleEvent.success(entity))
            }
            let errorHandler = {(error: Error) in
                super.errorHandler(error)
                observer(SingleEvent.error(error))
            }
            super.apiRequestOnHandler(self.sampleApiProvider, .SAMPLE, onSuccess: successHandler, onError: errorHandler)
            return Disposables.create()
        })
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
