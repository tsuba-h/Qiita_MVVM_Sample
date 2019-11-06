//
//  ArticleViewController.swift
//  Qiita_MVVM_Sample
//
//  Created by 服部　翼 on 2019/11/01.
//  Copyright © 2019 服部　翼. All rights reserved.
//

import UIKit
import Instantiate
import InstantiateStandard
import WebKit
import RxSwift
import RxCocoa

class ArticleViewController: UIViewController, StoryboardInstantiatable {
    
    var naviTitle: String?
    var qiitaUrl: String?
    var like: Bool = true
    @IBOutlet weak var starButton: UIBarButtonItem!
    @IBOutlet weak var articleWebView: WKWebView!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = naviTitle
        let request = URLRequest(url: URL(string: qiitaUrl!)!)
        articleWebView.load(request)
        
        buttonTapped()
    }
    
    func buttonTapped() {
        starButton.rx.tap
            .subscribe(onNext: { (next) in
                if self.like {
                    self.starButton.image = UIImage(systemName: "star.fill")
                    self.like = false
                } else {
                    self.starButton.image = UIImage(systemName: "star")
                    self.like = true
                }
                print("next")
            }, onError: { (error) in
                print("error:\(error)")
            }).disposed(by: disposeBag)
    }
    
    
    @IBAction func starButtonTappe(_ sender: Any) {
    }
}
