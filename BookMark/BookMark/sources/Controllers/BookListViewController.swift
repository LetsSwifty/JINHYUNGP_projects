//
//  ViewController.swift
//  BookMark
//
//  Created by 박진형 on 2022/05/04.
//

import UIKit


class BookListViewController: UITableViewController, SendDataDelegate {
    var dataset = [Book]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            let viewController : PopupViewController1 = segue.destination as! PopupViewController1
            viewController.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataset.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.dataset[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell" ,for: indexPath) as? BookCell {
            print("============")
            cell.title.text = row.title
            cell.author.text = row.author
            print(row.image)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    @IBAction func toMyPage(_ sender: Any) {
        guard let mypagevc = self.storyboard?.instantiateViewController(withIdentifier: "Mypage") as? MypageViewController else { return }
        
        self.navigationController?.pushViewController(mypagevc, animated: true)
    }
    
    func sendData(data: Book) {
        self.dataset.append(data)
        self.tableView.reloadData()
    }
}

