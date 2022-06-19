//
//  WebkitController.swift
//  mingQuiz
//
//  Created by 박진형 on 2022/06/17.
//

import Foundation
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var data: String!
    
    override func viewDidLoad() {
        let url = URL(string: data)
        let req = URLRequest(url: url!)
        self.webView.load(req)
        self.webView.allowsBackForwardNavigationGestures = true
    }
    
}
