//
//  PopupViewController2.swift
//  BookMark
//
//  Created by 박진형 on 2022/05/19.
//

import Foundation
import UIKit

class PopupViewController2: UIViewController {
    var data = [Book]()
    let api = APIService()
    
    override func viewDidLoad() {
        api.getData(keyword: "언더그라운드") { response in
            for book in response!.items {
                self.data.append(book)
            }
            
        }
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var bookTableView: UITableView!
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        api.getData(keyword: titleTextField.text!) { response in
           // print(response!.items[0].author) // 
            print(response!.items)
            print(type(of: response!.items))
            for book in response!.items {
                self.data.append(book)
            }

            DispatchQueue.main.async{
                self.bookTableView.reloadData()
            }
        }
    }

}
extension PopupViewController2: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(data.count)
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = data[indexPath.row].title
        return cell
    }
}

extension PopupViewController2: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
