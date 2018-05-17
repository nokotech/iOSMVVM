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

/// API処理のインターフェース
protocol ApiRepositoryProtocol {
    /// 処理1
    ///
    /// - Parameter params: パラメータ
    /// - Returns: エンティティ
    func fetch(params: [String : Any]) -> Single<FetchEntity>?
    
    /// 処理2
    ///
    /// - Parameter params: パラメータ
    /// - Returns: エンティティ
    func watch(params: [String : Any]) -> Single<WatchEntity>?
}
// MARK: -

/// API処理の実装
class ApiRepository: BaseRepository, ApiRepositoryProtocol {
    
    /// インスタンス
    static let instance: ApiRepositoryProtocol = ApiRepository()
    
    /// Provider
    private let sampleApiProvider = MoyaProvider<SampleApi>()

    /// 処理1
    public func fetch(params: [String : Any]) -> Single<FetchEntity>? {
        return super.apiRequest(self.sampleApiProvider, .SAMPLE)
    }
    
    /// 処理2
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
