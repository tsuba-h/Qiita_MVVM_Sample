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
import RxCocoa
import Instantiate
import InstantiateStandard


class TopViewController: UIViewController, StoryboardInstantiatable {
    
    @IBOutlet weak var tableView: UITableView!
    var qiita = [Qiita]()
    
    let viewModel:TopViewModelType = TopViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableViewUtil.registerCell(tableView, identifier: TopViewControllerTableViewCell.reusableIdentifier)
        
        viewModel.outputs.articles
            .bind(to: tableView.rx.items(cellIdentifier: TopViewControllerTableViewCell.reusableIdentifier, cellType: TopViewControllerTableViewCell.self)) { index, result, cell in
                cell.titleLabel.text = result.title
                cell.likeButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        .disposed(by: disposeBag)
  
        tableView.delegate = self
    }
}

extension TopViewController: UITableViewDelegate {
    
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
