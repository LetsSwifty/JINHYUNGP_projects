//
//  BookCell.swift
//  BookMark
//
//  Created by 박진형 on 2022/05/06.
//

import Foundation
import UIKit
class BookCell: UITableViewCell{
    
    var toggleIsOn = false
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBAction func buttonTapped(_ sender: Any) {
        if toggleIsOn == false{
            
            likeButton.setImage(UIImage(systemName: "heart.square.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "heart.square"), for: .normal)
        }
        self.toggleIsOn = !toggleIsOn
    }
}
