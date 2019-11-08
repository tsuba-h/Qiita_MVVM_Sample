//
//  TopViewController.swift
//  Qiita_MVVM_Sample
//
//  Created by 服部　翼 on 2019/10/31.
//  Copyright © 2019 服部　翼. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import Instantiate
import InstantiateStandard


class TopViewController: UIViewController, StoryboardInstantiatable {
    
    @IBOutlet weak var tableView: UITableView!
    var qiita = [Qiita]()
    
    var viewModel = TopViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let provider = MoyaProvider<QiitaAPI>()
        provider.request(.getArticle) { (result) in
            switch result {
            case let .success(moyaResponse):
                do {
//                    let data = try JSONDecoder().decode([Qiita].self, from: moyaResponse.data)
//                    self.qiita = data
                    let data = try moyaResponse.map([Qiita].self)
                    self.qiita = data
                    print(self.qiita)
                    self.tableView.reloadData()
                } catch {
                    print("error")
                }
            case let .failure(error):
                print(error.localizedDescription)
                break
            }
        }
        
        TableViewUtil.registerCell(tableView, identifier: TopViewControllerTableViewCell.reusableIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        QiitaRepository.fetchQiita()
    }
}

extension TopViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qiita.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewUtil.createCell(tableView, identifier: TopViewControllerTableViewCell.reusableIdentifier, indexPath) as! TopViewControllerTableViewCell
        cell.titleLabel.text = qiita[indexPath.row].title
        cell.likeButton.setImage(UIImage(systemName: "star"), for: .normal)
        //cell.likeButton.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: ArticleViewController = ArticleViewController.instantiate()
        vc.naviTitle = qiita[indexPath.row].title
        vc.qiitaUrl = qiita[indexPath.row].url
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
