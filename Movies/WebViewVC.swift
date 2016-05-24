//
//  WebViewVC.swift
//  Movies
//
//  Created by Nikema Prophet on 5/24/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {


    @IBOutlet weak var container: UIView!
    
    var urlStr: String = ""
  
    
    var webView: WKWebView!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        webView = WKWebView()
        container.addSubview(webView)
        loadRequest(urlStr)
        
    }

    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
        }
    
    func loadRequest(urlStr: String) {
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }

    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
