//
//  ViewController.swift
//  mingQuiz
//
//  Created by 박진형 on 2022/06/17.
//

import UIKit

class TableViewController: UITableViewController {
    var datasource = [
        
        "http://www.naver.com/",
        "https://blog.naver.com/gkqls879/222774389388",
        "https://blog.naver.com/carpedm96"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = datasource[indexPath.row]
        
        return cell
                
    }
}

extension TableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail_segue"{
            
            let path = self.tableView.indexPath(for: sender as! UITableViewCell)
            
            let detailVC = segue.destination as? DetailViewController
            detailVC?.data = self.datasource[path!.row]
        }
    }
        
    
}
