//
//  WebViewController.swift
//  WKWebView
//
//  Created by Luther on 2/23/16.
//  Copyright © 2016 Luther. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var webView: WKWebView?
    var webCfg:WKWebViewConfiguration = WKWebViewConfiguration()
    
    override func loadView() {
        super.loadView()
        
        self.webView = WKWebView()
        self.view = self.webView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
