//
//  ViewController.swift
//  myGIF
//
//  Created by 박진형 on 2022/06/02.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    let api = APIService()
    var datasource = [Photo]()
    var page = 1
    var isAvailable = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getData(page: page) { response in
            for i in response!{
                self.datasource.append(i.urls)
            }
        }
        DispatchQueue.main.async{
            self.collectionView.reloadData()
        }
        
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSpacing: CGFloat = 10
        let width: CGFloat = (collectionView.bounds.width - itemSpacing) / 2
        let height: CGFloat = width * 10/7
        return CGSize(width: width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?
                    Cell else {
                return UICollectionViewCell()
        }
        
        cell.update(at: datasource[indexPath.row])
        return cell
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout{

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.collectionView.contentOffset.y > collectionView.contentSize.height - collectionView.bounds.size.height{
            if isAvailable == true {
                isAvailable = false
                self.page += 1
                
                api.getData(page: page) { response in
                    for i in response!{
                        self.datasource.append(i.urls)
                    }
                }
                self.collectionView.reloadData()
                isAvailable = true
            }
        }
    }
}
