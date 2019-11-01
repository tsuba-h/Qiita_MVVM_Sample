//
//  TopViewController.swift
//  Qiita_MVVM_Sample
//
//  Created by 服部　翼 on 2019/10/31.
//  Copyright © 2019 服部　翼. All rights reserved.
//

import UIKit
import Moya

class TopViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var qiitaResponce = [QiitaResponse]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let provider = MoyaProvider<QiitaAPI>()
        provider.request(.getArticle) { (result) in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = try JSONDecoder().decode(QiitaResponse.self, from: moyaResponse.data)
                    print(data)
                } catch {
                    print("error")
                }
            case let .failure(error):
                print(error)
                break
            }
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension TopViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qiitaResponce.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = qiitaResponce[indexPath.row].title
//        cell.detailTextLabel?.text = qiitaResponce[indexPath.row].name
        return cell
    }
    
    
    
    
}
