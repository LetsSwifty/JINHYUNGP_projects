//
//  PopupViewController.swift
//  BookMark
//
//  Created by 박진형 on 2022/05/06.
//

import Foundation
import UIKit

protocol SendDataDelegate {
    func sendData(data: Book)
}
class PopupViewController1: UIViewController{

    var delegate: SendDataDelegate?
    let picker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bookTitle: UITextField!
    @IBOutlet weak var bookAuthor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func openLibrary(){
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: false, completion: nil)
      }

    func openCamera(){
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: false, completion: nil)

      }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        var tempBook = Book()
        tempBook.title = self.bookTitle.text!
        tempBook.author = self.bookAuthor.text!
        //tempBook.image = self.imageView.image
        delegate?.sendData(data: tempBook)
        dismiss(animated: true, completion: nil)
        
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        let alert = UIAlertController(title: "책 사진" , message: "사진을 가져올 방법을 선택해 주세요", preferredStyle: .actionSheet)
        let library = UIAlertAction(title: "사진앨범", style: .default){(action) in self.openLibrary()}
        let camera = UIAlertAction(title: "카메라", style: .default){(action) in self.openCamera()}
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        self.present(alert, animated: true,completion: nil)
        }

    @IBAction func close(_ sender: Any){
        self.dismiss(animated: false, completion: nil)
    }
    
}
extension PopupViewController1 : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage? = nil // update 할 이미지
        
                if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                    newImage = possibleImage // 수정된 이미지가 있을 경우
                } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                    newImage = possibleImage // 원본 이미지가 있을 경우
                }
            self.imageView.image = newImage
        picker.dismiss(animated: true, completion: nil)
    }
}
