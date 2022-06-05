//
//  MypageViewcontroller.swift
//  BookMark
//
//  Created by 박진형 on 2022/05/10.
//

import Foundation
import UIKit

class MypageViewController: UITableViewController{
    var mypageData = [BookCell]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mypageData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.mypageData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyListCell", for: indexPath) as! MypageBookCell
        print(row.title.text!)
        cell.title.text = row.title.text!
        cell.thumbnail = row.thumbnail
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == .delete {
                mypageData.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            } else if editingStyle == .insert {
                
            }
        }
    
}
