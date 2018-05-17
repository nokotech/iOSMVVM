//
//  MoyaTest.swift
//  iOSMVVMTests
//
//  Created by takenaka on 2018/05/17.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//

import Moya

/**
 * APIの情報
 */
enum TestApi {
    case a()
}

/**
 *
 */
extension TestApi: TargetType {
    
    /** ベースURL */
    var baseURL: URL {
        return URL(string: "https://raw.githubusercontent.com/nokotech/iOSMVVM/master/MockData")!
    }
    
    /** パス */
    var path: String {
        switch self {
        case .ID(let id):   return "/\(id).json"
        case .SAMPLE:       return "/sample.json"
        }
    }
    
    /** メソッド（GET or POST） */
    var method: Moya.Method {
        switch self {
        case .ID, .SAMPLE: return .get
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
