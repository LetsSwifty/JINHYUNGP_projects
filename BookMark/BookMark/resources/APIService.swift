//
//  APIService.swift
//  BookMark
//
//  Created by 박진형 on 2022/05/15.
//

import Foundation

class APIService {
    static let NAVER_CLIENT_ID: String = "0U7H9c15x8vL1S3WtQBf"
    static let NAVER_CLIETNT_SECRET: String = "4RjajZ1Si1"
    
    func MakeAPIRequest(keyword: String) -> URLRequest {
        let EncodedKeyword = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let urlString = "https://openapi.naver.com/v1/search/book.json?query=\(EncodedKeyword)"
        let url = URL(string: urlString)
        
        var request: URLRequest = URLRequest(url: url!)
        request.addValue(APIService.NAVER_CLIENT_ID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(APIService.NAVER_CLIETNT_SECRET, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        return request
    }
    
    func getData(keyword: String, completion: @escaping (Response?) -> Void) {
        let requestURL = MakeAPIRequest(keyword: keyword)
        var result: Response?
        
        let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
                completion(result)
            }
            catch {
                print("failed to convert \(error.localizedDescription)")
                completion(nil)
            }
        }
        task.resume()
    }
    
}


