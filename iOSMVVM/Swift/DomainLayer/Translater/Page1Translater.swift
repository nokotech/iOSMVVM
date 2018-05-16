//
//  Page1Translater.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/16.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import Foundation

protocol Page1TranslaterProtocl {
    func translateFetch(fetchEntity: FetchEntity, watchEntity: WatchEntity) -> FetchEntity
}

class Page1Translater: Page1TranslaterProtocl {
    
    /// インスタンス
    static let instance: Page1TranslaterProtocl = Page1Translater()
    
    ///
    func translateFetch(fetchEntity: FetchEntity, watchEntity: WatchEntity) -> FetchEntity {
        NSLog("translateFetch. \(fetchEntity), \(watchEntity)")
        return fetchEntity
    }
    
}
