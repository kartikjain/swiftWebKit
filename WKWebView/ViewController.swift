//
//  ViewController.swift
//  WKWebView
//
//  Created by Luther on 2/23/16.
//  Copyright © 2016 Luther. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    
    
    @IBOutlet weak var webViewContainer: UIView! = nil
    
    @IBOutlet weak var `switch`: UIButton!
    var webViewController: WebViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewController = self.childViewControllers[0] as! WebViewController
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func `switch`(sender: AnyObject) {
        print("clicked")
        let js:String = "document.getElementById('image').setAttribute('src', 'Mic.png')"
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

}

