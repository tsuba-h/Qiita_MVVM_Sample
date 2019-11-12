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

    static func fetchQiita() -> Observable<[Qiita]>{
        return qiitaApiProvider.rx.request(.getArticle)
            .map([Qiita].self)
            .asObservable()
     }
    
}
