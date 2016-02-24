//
//  WebViewController.swift
//  WKWebView
//
//  Created by Luther on 2/23/16.
//  Copyright © 2016 Luther. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKScriptMessageHandler {
    
    var webView: WKWebView?
    var webCfg:WKWebViewConfiguration = WKWebViewConfiguration()
    
    override func loadView() {
        super.loadView()
        var contentController = WKUserContentController();
        contentController.addScriptMessageHandler(
            self,
            name: "callbackHandler"
        )
        
        var config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        self.webView = WKWebView(
            frame: self.view.bounds,
            configuration: config
        )
        self.view = self.webView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let htmlString = "<img id='image' src=\"image-loading.gif\" alt=\"Smiley face\" onclick=\"try{webkit.messageHandlers.callbackHandler.postMessage('Hello from JavaScript')}catch(err){console.log(webkit);console.log('The native context does not exist yet')}\">"
        let path = NSBundle.mainBundle().pathForResource("resource/images", ofType: "")
        let requestURL = NSURL(fileURLWithPath : path!)
        self.webView!.loadHTMLString(htmlString, baseURL: requestURL)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func userContentController(userContentController: WKUserContentController!, didReceiveScriptMessage message: WKScriptMessage!) {
        if(message.name == "callbackHandler") {
            print("JavaScript is sending a message \(message.body)")
        }
    }

}
