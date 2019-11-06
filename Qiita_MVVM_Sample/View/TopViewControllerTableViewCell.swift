//
//  TopViewControllerTableViewCell.swift
//  Qiita_MVVM_Sample
//
//  Created by 服部　翼 on 2019/10/31.
//  Copyright © 2019 服部　翼. All rights reserved.
//

import UIKit
import Instantiate
import InstantiateStandard

class TopViewControllerTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    var like: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        print("tap")
        if like {
            likeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            like = false
        } else {
            likeButton.setImage(UIImage(systemName: "star"), for: .normal)
            like = true
        }
    }
}
