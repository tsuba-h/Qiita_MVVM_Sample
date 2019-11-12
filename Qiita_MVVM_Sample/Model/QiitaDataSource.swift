//
//  QiitaDataSource.swift
//  Qiita_MVVM_Sample
//
//  Created by 吉田寛規 on 2019/11/12.
//  Copyright © 2019 服部　翼. All rights reserved.
//

import Foundation
import RxDataSources

struct QiitaData {
    var items: [Qiita]
}

extension QiitaData: SectionModelType {
    typealias Item = Qiita
    
    init(original: QiitaData, items: [Qiita]) {
        self = original
        self.items = items
    }
}
