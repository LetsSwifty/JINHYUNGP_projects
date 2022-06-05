//
//  APIService.swift
//  BookMark
//
//  Created by 박진형 on 2022/05/15.
//

import Foundation

class APIService {
    let AccessKey: String = "YxSjG7CdmO0o5PmMH5aRX3q_RK-i6jWSjL2rzo1Jjzg"
    
    func getData(page:Int, completion: @escaping ([Response]?) -> Void) {
                       
        let urlString = "https://api.unsplash.com/photos?client_id=\(AccessKey)&per_page=20&page=\(page)"
        let url = URL(string: urlString)
        
        let request: URLRequest = URLRequest(url: url!)
        var result: [Response]?
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error")
                return }
            
            do {
                result = try JSONDecoder().decode([Response].self, from: data)
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
