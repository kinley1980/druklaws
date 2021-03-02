//
//  pdfelectionViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 1/19/21.
//  Copyright © 2021 Kinley Tshering. All rights reserved.
//

import UIKit
import WebKit

class pdfelectionViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

            webView.navigationDelegate = self
            
            if let fileName = title {
                openPDFFile(fileName)
            }
        }
        
        private func openPDFFile(_ fileName: String) {
            if let filePath = Bundle.main.url(forResource: fileName, withExtension: "pdf") {
                let request = URLRequest(url: filePath)
                webView.load(request)
                
            }
        }
        
        private func webView(_ webView: WKWebView, didfinish navigation: WKNavigation) {
            activityIndicator.stopAnimating()
        }

}
