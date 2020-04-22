//
//  ViewController.swift
//  webviewer
//
//  Created by Michelle Yuen on 11/02/2020.
//  Copyright © 2020 Michelle Yuen. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBAction func goButton(_ sender: UIButton) {
        print("Will render URL: \(String(describing: urlTextField.text))")
        if let urlString = urlTextField.text {
            if urlString.starts(with: "http://") || urlString.starts(with: "https://") {
                let myURL = URL(string:urlString)
                let myRequest = URLRequest(url: myURL!)
                webView.load(myRequest)
            } else if urlString.contains("www") {
                let myURL = URL(string: "http://\(urlString)")
                let myRequest = URLRequest(url: myURL!)
                webView.load(myRequest)
            } else {
                let myURL = URL(string: "http://www.\(urlString)")
                let myRequest = URLRequest(url: myURL!)
                webView.load(myRequest)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
