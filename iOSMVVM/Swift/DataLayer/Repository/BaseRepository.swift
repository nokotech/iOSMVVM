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


class BaseReopository: NSObject {
    
    typealias OnSuccess<U: Decodable> = ((U) -> Void)?
    typealias OnError = ((Error) -> Void)?
    
    /**
     * APIコール
     */
    func apiRequest<T, U: Decodable>(_ provider: MoyaProvider<T>, _ request: T, onSuccess: OnSuccess<U>, onError: OnError) {
        provider.rx.request(request).filterSuccessfulStatusCodes().map(U.self).subscribe(onSuccess: onSuccess, onError: onError).disposed(by: rx.disposeBag)
    }
    
    /**
     * エラーハンドラー
     */
    func errorHandler(error: Error) {
        NSLog("error \(error)")
    }
}
