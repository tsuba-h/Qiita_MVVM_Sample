//
//  ApiResponse.swift
//  Qiita_MVVM_Sample
//
//  Created by 服部　翼 on 2019/11/01.
//  Copyright © 2019 服部　翼. All rights reserved.
//

import Foundation

struct QiitaResponse: Codable {
    let title: String
    let name: String
    let url: URL
}
