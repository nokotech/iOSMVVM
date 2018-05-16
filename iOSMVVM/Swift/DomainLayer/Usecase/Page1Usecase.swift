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

/// Page1のユースケースのインターフェース
protocol Page1UsecaseProtocol {
    
    /// クリック時に画面情報を更新する
    ///
    /// - Returns: 画面情報
    func onClickToButton() -> Observable<FetchEntity>;
}
// MARK: -

/// Page1のユースケースの実装クラス
class Page1Usecase: BaseUsecase, Page1UsecaseProtocol {
    
    /// Repository
    private var apiRepository: ApiRepositoryProtocol!
    
    /// Translater
    private var translater: Page1TranslaterProtocl!
    
    /// Dependency Injection
    override func inject() {
        apiRepository = ApiRepository.instance
        translater = Page1Translater.instance
    }
    
    /// クリック時に画面情報を更新する
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
