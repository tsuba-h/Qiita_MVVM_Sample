//
//  QiitaMVVMAPI.swift
//  Qiita_MVVM_Sample
//
//  Created by 服部　翼 on 2019/11/01.
//  Copyright © 2019 服部　翼. All rights reserved.
//

import Moya

typealias qiitaAPIResponse = (( _ response: QiitaResponse?, _ error: Swift.Error?) -> Void)

final class QiitaRepository {
    private static let qiitaApiProvider = MoyaProvider<QiitaAPI>()
}


extension QiitaRepository {
    static func getQiita(completion: @escaping qiitaAPIResponse) {
        qiitaApiProvider.request(.getArticle) { (result) in
            switch result {
            case .success(let response):
                do {
                    let qiitaResponse = try JSONDecoder().decode(QiitaResponse.self, from: response.data)
                    print(qiitaResponse)
                    completion(qiitaResponse,nil)
                } catch(let error) {
                    print("Error: decoding error (getQiitadata) - \(error)")
                    completion(nil,error)
                }
            case .failure(let error):
                print("Error: API Call error (getQiitadata) - \(error)")
                completion(nil,error)
            }
        }
    }
}
