//
//  ViewController.swift
//  SampleWebView
//
//  Created by 서상현 on 2022/02/13.
//

import WebKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var WebViewMain: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString = "https://www.google.com"
        if let url = URL(string : urlString) { //unwrapping 과정
            let urlReq = URLRequest(url : url)
            print(urlString)
            WebViewMain.load(urlReq)
        }
    }
    //8강

}

