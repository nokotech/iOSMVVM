//
//  BaseRepository.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/16.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa
import NSObject_Rx


class BaseRepository: NSObject {
    
    typealias OnSuccess<U: Decodable> = ((U) -> Void)?
    typealias OnError = ((Error) -> Void)?
    
    /// APIコール
    ///
    /// - Parameters:
    ///   - provider:
    ///   - request:
    func apiRequest<T, U: Decodable>(_ provider: MoyaProvider<T>, _ request: T) -> Single<U> {
        return provider.rx.request(request).filterSuccessfulStatusCodes().map(U.self)
    }
    
    /// APIコール
    ///
    /// - Parameters:
    ///   - provider:
    ///   - request:
    ///   - onSuccess:
    ///   - onError:
    func apiRequestOnHandler<T, U: Decodable>(_ provider: MoyaProvider<T>, _ request: T, onSuccess: OnSuccess<U>, onError: OnError) {
        provider.rx.request(request).filterSuccessfulStatusCodes().map(U.self).subscribe(onSuccess: onSuccess, onError: onError).disposed(by: rx.disposeBag)
    }
    
    /// OKハンドラー
    ///
    /// - Parameter error: error
    func successHandler<U: Decodable>(_ response: U) {
        NSLog("success \(response)")
    }
    
    /// NGハンドラー
    ///
    /// - Parameter error: error
    func errorHandler(_ error: Error) {
        NSLog("error \(error)")
    }
}
