//
//  TopViewModel.swift
//  Qiita_MVVM_Sample
//
//  Created by 吉田寛規 on 2019/11/06.
//  Copyright © 2019 服部　翼. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol TopViewModelInputs {
    
}

protocol TopViewModelOutputs {
    // 内部ではSubjectだが書き込まれないようにObservableにしている
    var articles: Observable<[Qiita]> {get}
    var error: Observable<Error> {get}
}

protocol TopViewModelType{
    var inputs: TopViewModelInputs {get}
    var outputs: TopViewModelOutputs {get}
}

class TopViewModel: TopViewModelOutputs {
    
    var articles: Observable<[Qiita]>
    let error: Observable<Error>
    
    
//    var article: Observable<[Qiita]>
//    var articleService = ArticleService()
    
    
    private let disposeBag = DisposeBag()
    
    init() {
        // BehaviorReplayにすると初期値を出力する。
        // 外部インターフェースはObservableなので初期値を持っているかどうか判断できないのでないほうがいい。
        let _articles = PublishRelay<[Qiita]>()
        let _error = PublishRelay<Error>()
        
        
        QiitaRepository._fetchQiita()
        .subscribe(onNext: { response in
            _articles.accept(response)
        }, onError: { error in
            _error.accept(error)
        }).disposed(by: disposeBag)

        self.articles = _articles.asObservable()
        self.error = _error.asObservable()
    }
    
//    func getArticle() {
//        QiitaRepository._fetchQiita()
//            .subscribe(onNext: { response in
//                articles.
//            }, onError: { (<#Error#>) in
//                <#code#>
//            }).disposed(by: disposeBag)
//    }
    
}

