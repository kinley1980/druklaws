//
//  PDFDrugViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 10/12/20.
//  Copyright © 2020 Kinley Tshering. All rights reserved.
//

import UIKit
import WebKit

class PDFDrugViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
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