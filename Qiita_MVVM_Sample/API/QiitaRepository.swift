//
//  QiitaMVVMAPI.swift
//  Qiita_MVVM_Sample
//
//  Created by 服部　翼 on 2019/11/01.
//  Copyright © 2019 服部　翼. All rights reserved.
//

import Moya

typealias qiitaAPIResponse = (( _ response: Qiita?, _ error: Swift.Error?) -> Void)

final class QiitaRepository {
    private static let qiitaApiProvider = MoyaProvider<QiitaAPI>()
}


extension QiitaRepository {
    static func getQiita(completion: @escaping qiitaAPIResponse) {
        qiitaApiProvider.request(.getArticle) { (result) in
            switch result {
            case let .success(moyaResponse):
                do {
//                    let data = try JSONDecoder().decode([Qiita].self, from: moyaResponse.data)
//                    self.qiita = data
                    let data = try moyaResponse.map([Qiita].self)
                } catch {
                    print("error")
                }
            case let .failure(error):
                print(error.localizedDescription)
                break
            }
        }
    }
}
