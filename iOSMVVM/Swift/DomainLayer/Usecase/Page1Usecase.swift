//
//  Page1Usecase.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/15.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import NSObject_Rx

protocol Page1UsecaseProtocol {
    
    /// <#Description#>
    ///
    /// - Returns: <#return value description#>
    func onClickToButton() -> Observable<FetchEntity>;
}

class Page1Usecase: BaseUsecase, Page1UsecaseProtocol {
    
    /** Repository */
    private let apiRepository: ApiRepositoryProtocol = ApiRepository.instance
    
    /** Translater */
    private let translater = Page1Translater.instance
    
    ///
    func onClickToButton() -> Observable<FetchEntity> {
        let dic: [String: Any] = [
            "key1": "value1",
            "key2": "value2"
        ]
        return Observable<FetchEntity>
        .zip(
            self.apiRepository.fetch(params: dic)!.asObservable(),
            self.apiRepository.watch(params: dic)!.asObservable(),
            // レスポンス
            resultSelector: translater.translateFetch
        )
        .map({ (fetchEntity) -> FetchEntity in
            NSLog("== \(fetchEntity)")
            return fetchEntity
        })
//        return Observable.create({ (observar) -> Disposable in
//
//            self.apiRepository.fetch(params: dic)?.subscribe(
//                onSuccess: { (entity) in
//                    NSLog("onClickToButton.onSuccess \(entity)")
//                    observar.on(.next(entity))
//            },
//                onError: { (error) in
//                    NSLog("onClickToButton.onError \(error)")
//                    observar.on(.error(error))
//            }).disposed(by: self.rx.disposeBag)
//            return Disposables.create()
//        })
    }
}
