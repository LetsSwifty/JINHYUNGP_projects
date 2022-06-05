//
//  BookVO.swift
//  BookMark
//
//  Created by 박진형 on 2022/05/04.
//

import UIKit

struct Book: Codable {
    var title: String
    var image: String
    var author: String
    var price: String
    
    init(title: String = "", image: String = "", author: String = "", price: String = "") {
        self.title = title
        self.image = image
        self.author = author
        self.price = price
     }
}

struct Response: Decodable {
    let items: [Book]
}

