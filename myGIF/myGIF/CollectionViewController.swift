//
//  CollectionViewController2.swift
//  myGIF
//
//  Created by 박진형 on 2022/06/11.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController {
    
    let api = APIService()
    var datasource = [Photo]()
    var page = 1
    var isAvailable = true
    var keyword = String()
   
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!

    
    @IBAction func searchButtonClicked(_ sender: Any) {
        
        keyword.removeAll()
        for cell in collectionView.visibleCells{
            cell.removeFromSuperview()
        }
        datasource.removeAll()
        reloadCollectionView()
        
        keyword += textField.text!
        fetchData()
    }
    
    func reloadCollectionView() -> (){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func fetchData() -> (){
        api.getData(keyword: keyword  ,page: page) { [self] response in
            if let tempResult = response?.results{
                for i in tempResult{
                    datasource.append(i.urls)
                }
                reloadCollectionView()
           }
            else{
                //do nothing
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSpacing: CGFloat = 10
        let width: CGFloat = (collectionView.bounds.width - itemSpacing) / 2
        let height: CGFloat = width * 10/7
        return CGSize(width: width, height: height)
    }
    
}

extension CollectionViewController: UICollectionViewDelegate{
    
}

extension CollectionViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?
                    Cell else {
            
                return UICollectionViewCell()
        }
        
        cell.update(at: datasource[indexPath.row])
        return cell
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.collectionView.contentOffset.y > collectionView.contentSize.height - collectionView.bounds.size.height{
            if isAvailable == true {
                isAvailable = false
                page += 1
                fetchData()
                isAvailable = true
                
                }
            }
        }
}


