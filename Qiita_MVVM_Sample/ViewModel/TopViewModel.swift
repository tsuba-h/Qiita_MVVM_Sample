//
//  TopViewModel.swift
//  Qiita_MVVM_Sample
//
//  Created by 吉田寛規 on 2019/11/06.
//  Copyright © 2019 服部　翼. All rights reserved.
//

import Foundation
import RxSwift

class TopViewModel {
    
    var article: Observable<[Qiita]>?
    
    var articleService = ArticleService()
    
    func getArticle() {
        articleService.getArticle { (response, error) in
            
        }
    }
}
