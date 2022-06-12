//
//  GIF.swift
//  myGIF
//
//  Created by 박진형 on 2022/06/02.
//

import UIKit

struct Photo: Codable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}

struct APIResponse: Codable {
    let total: Int
    let total_pages: Int
    let results: [Result]
}

struct Result: Codable {
    let urls: Photo
}


