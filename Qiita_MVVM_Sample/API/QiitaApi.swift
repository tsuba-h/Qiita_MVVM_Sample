//
//  QiitaApi.swift
//  Qiita_MVVM_Sample
//
//  Created by 服部　翼 on 2019/10/31.
//  Copyright © 2019 服部　翼. All rights reserved.
//

import Moya

enum QiitaAPI {
    case getArticle
}

extension QiitaAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://qiita.com")!
    }
    
    var path: String {
        return "/api/v2/items"
    }
    
    var method: Method {
        switch self {
        case .getArticle:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: ["per_page" : "10"], encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
