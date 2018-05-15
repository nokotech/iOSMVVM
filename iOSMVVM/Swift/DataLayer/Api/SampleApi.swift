//
//  SampleApi.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/15.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import Foundation
import Moya

/**
 * APIの情報
 */
enum SampleApi {
    case id(id: String)
    case sample
}

/**
 *
 */
extension SampleApi: TargetType {
    
    /** ベースURL */
    var baseURL: URL {
        return URL(string: "https://raw.githubusercontent.com/nokotech/iOSMVVM/master/MockData")!
    }
    
    /** パス */
    var path: String {
        switch self {
        case .id(let id):   return "/\(id).json"
        case .sample:       return "/sample.json"
        }
    }
    
    /** メソッド（GET or POST） */
    var method: Moya.Method {
        switch self {
        case .id, .sample: return .get
        }
    }
    
    /** モックデータ */
    var sampleData: Data {
        return "Stub data".data(using: String.Encoding.utf8)!
    }
    
    /** リクエスト方式 */
    var task: Task {
        return Task.requestPlain
    }
    
    /** ヘッダー */
    var headers: [String : String]? {
        return nil;
    }
}
