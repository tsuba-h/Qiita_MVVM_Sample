//
//  QiitaMVVMAPI.swift
//  Qiita_MVVM_Sample
//
//  Created by 服部　翼 on 2019/11/01.
//  Copyright © 2019 服部　翼. All rights reserved.
//

import Moya
import RxSwift

typealias QiitaAPIResponse = (( _ response: Qiita?, _ error: Swift.Error?) -> Void)

final class QiitaRepository {
    private static let qiitaApiProvider = MoyaProvider<QiitaAPI>()
    
    private static let disposeBag: DisposeBag = DisposeBag()
}


extension QiitaRepository {
    
    static func getQiita(completion: @escaping (SingleEvent<Response>) -> ()) {
        qiitaApiProvider.rx.request(.getArticle).subscribe { event in
            completion(event)
        }.disposed(by: disposeBag)
    }
    
    static func fetchQiita(){
        qiitaApiProvider.rx.request(.getArticle)
            .map{(response) -> [Qiita]? in
                return try? JSONDecoder().decode([Qiita].self, from: response.data)
        }.subscribe(onSuccess: { response in
            if let response = response {
                print(response)
            }
        }, onError: {error in
            print(error)
        })
    }
    
}




//    qiitaApiProvider.rx.request(.getArticle) { (result) in
//            switch result {
//            case let .success(moyaResponse):
//                do {
////                    let data = try JSONDecoder().decode([Qiita].self, from: moyaResponse.data)
////                    self.qiita = data
//                    let data = try moyaResponse.map([Qiita].self)
//                } catch {
//                    print("error")
//                }
//            case let .failure(error):
//                print(error.localizedDescription)
//                break
