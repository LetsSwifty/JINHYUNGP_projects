//
//  Cell2.swift
//  myGIF
//
//  Created by 박진형 on 2022/06/12.
//

import Foundation
import UIKit

class Cell: UICollectionViewCell{
    @IBOutlet weak var imgView: UIImageView!
    
    func update(at row: Photo){
        let url = URL(string: row.thumb)
        var image : UIImage?
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async { [self] in
                    image = UIImage(data: data!)
                    imgView.image = image
            }
        }

    }
    
}
