//
//  APIService.swift
//  BookMark
//
//  Created by 박진형 on 2022/05/15.
//

import Foundation

class APIService {
    let AccessKey: String = ""
    
    func getData(keyword: String, page: Int, completion: @escaping (APIResponse?) -> Void) {
                       
        let urlString = "https://api.unsplash.com/search/photos?&query=\(keyword)?&client_id=\(AccessKey)&per_page=20&page=\(page)"
        let url = URL(string: urlString)
        
        let request: URLRequest = URLRequest(url: url!)
        var result: APIResponse?
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error")
                return }
          
            do {
                result = try JSONDecoder().decode(APIResponse.self, from: data)
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
