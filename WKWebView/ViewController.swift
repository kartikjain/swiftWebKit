//
//  ViewController.swift
//  WKWebView
//
//  Created by Luther on 2/23/16.
//  Copyright © 2016 Luther. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {
    
    
    
    @IBOutlet weak var webViewContainer: UIView! = nil
    
    @IBOutlet weak var `switch`: UIButton!
    var webViewController: WebViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewController = self.childViewControllers[0] as! WebViewController
        var userController:WKUserContentController = WKUserContentController()
        userController.addScriptMessageHandler(
            self,
            name: "callbackHandler"
        )
        webViewController!.webCfg.userContentController = userController;
        let htmlString = "<img id='image' src=\"image-loading.gif\" alt=\"Smiley face\" onclick=\"try{webkit.messageHandlers.callbackHandler.postMessage('Hello from JavaScript')}catch(err){console.log(webkit);console.log('The native context does not exist yet')}\">"
        
        let path = NSBundle.mainBundle().pathForResource("resource/images", ofType: "")
        let requestURL = NSURL(fileURLWithPath : path!)
        webViewController!.webView!.loadHTMLString(htmlString, baseURL: requestURL)
//        var url = NSURL(string:"https://www.google.com/")
//        var req = NSURLRequest(URL:url!)
//        webViewController.webView!.loadRequest(req)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func `switch`(sender: AnyObject) {
        print("clicked")
//        var userController:WKUserContentController = WKUserContentController()
        let js:String = "document.getElementById('image').setAttribute('src', 'Mic.png')"
        
        var userScript:WKUserScript =  WKUserScript(source: js,
            injectionTime: WKUserScriptInjectionTime.AtDocumentEnd,
            forMainFrameOnly: false)
        print(userScript)
        // Add the user script to the WKUserContentController instance
//        userController.addScriptMessageHandler(
//            self,
//            name: "callbackHandler"
//        )
        
        // Configure the WKWebViewConfiguration instance with the WKUserContentController
//        webViewController!.webCfg.userContentController = userController;
        webViewController!.webView!.evaluateJavaScript(js) { (result, error) in
            if error != nil {
                print(result)
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userContentController(userContentController: WKUserContentController!, didReceiveScriptMessage message: WKScriptMessage!) {
        if(message.name == "callbackHandler") {
            print("JavaScript is sending a message \(message.body)")
        }
    }


}

