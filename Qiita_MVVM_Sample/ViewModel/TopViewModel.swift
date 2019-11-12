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
    var articles: Observable<[QiitaDataSource]> {get}
    var error: Observable<Error> {get}
}

protocol TopViewModelType{
    var inputs: TopViewModelInputs {get}
    var outputs: TopViewModelOutputs {get}
}

class TopViewModel: TopViewModelOutputs {
    
    var articles: Observable<[QiitaDataSource]>
    let error: Observable<Error>
    
    
//    var article: Observable<[Qiita]>
//    var articleService = ArticleService()
    
    
    private let disposeBag = DisposeBag()
    
    init() {
        // BehaviorReplayにすると初期値を出力する。
        // 外部インターフェースはObservableなので初期値を持っているかどうか判断できないのでないほうがいい。
        let _articles = PublishRelay<[QiitaDataSource]>()
        let _error = PublishRelay<Error>()
        
        
        QiitaRepository._fetchQiita()
        .subscribe(onNext: { response in
            let dataSource = QiitaDataSource.init(items: response)
            _articles.accept([dataSource])
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

extension TopViewModel: TopViewModelInputs {
    
}

extension TopViewModel: TopViewModelType {
    var inputs: TopViewModelInputs {return self}
    var outputs: TopViewModelOutputs {return self}
}

