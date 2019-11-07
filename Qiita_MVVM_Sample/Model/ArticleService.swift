//
//  ArticleModel.swift
//  Qiita_MVVM_Sample
//
//  Created by 吉田寛規 on 2019/11/06.
//  Copyright © 2019 服部　翼. All rights reserved.
//

import Foundation
import RxSwift

//シングルトンにする
class ArticleService {
    func getArticle(comltition: @escaping (_ response: [Qiita?], _ error: Swift.Error?) -> Void) {
        QiitaRepository.getQiita { event in
            switch event {
            case .success(let response):
                do {
                    let qiitaResponse = try JSONDecoder().decode([Qiita].self, from: response.data)
                    comltition(qiitaResponse, nil)
                } catch(let error) {
                    print(error)
                }
            case .error(let error):
                print(error)
            }
        }
    }
    
    func fetchArticle(comltition: @escaping (_ response: [Qiita?], _ error: Swift.Error?) -> Void) {
        QiitaRepository.getQiita { event in
            switch event {
            case .success(let response):
                do {
                    let qiitaResponse = try JSONDecoder().decode([Qiita].self, from: response.data)
                    comltition(qiitaResponse, nil)
                } catch(let error) {
                    print(error)
                }
            case .error(let error):
                print(error)
            }
        }
    }
}
