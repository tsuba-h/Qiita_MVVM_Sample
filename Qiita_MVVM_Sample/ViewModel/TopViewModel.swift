//
//  TopViewModel.swift
//  Qiita_MVVM_Sample
//
//  Created by 吉田寛規 on 2019/11/06.
//  Copyright © 2019 服部　翼. All rights reserved.
//

import Foundation
import RxSwift

protocol TopViewModelInputs {
    
}

protocol TopViewModelOutputs {
    var articles: Observable<[Qiita]> {get}
    var error: Observable<Error> {get}
}

protocol TopViewModelType{
    var inputs: TopViewModelInputs {get}
    var outputs: TopViewModelOutputs {get}
}

class TopViewModel: TopViewModelOutputs {
    
    let articles: Observable<[Qiita]>
    let error: Observable<Error>
    
    
//    var article: Observable<[Qiita]>
//    var articleService = ArticleService()
    
    
    private let disposeBag = DisposeBag()
    
    init() {
        let _articles = PublishSubject<[Qiita]>()
        self.articles = _articles.asObservable()
    
        let _error = PublishSubject<Error>()
        self.error = _error.asObservable()
    }
    
    func getArticle() {
//        articleService.getArticle { (response, error) in
//
//        }
    }
}
