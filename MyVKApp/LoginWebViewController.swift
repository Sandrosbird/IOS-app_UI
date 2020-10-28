//
//  LoginWebViewController.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 13.05.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class LoginWebViewController: UIViewController {
    @IBOutlet weak var loginWebVIew: WKWebView! {
        didSet {
            loginWebVIew.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlForVK = URLComponents()
                urlForVK.scheme = "https"
                urlForVK.host = "oauth.vk.com"
                urlForVK.path = "/authorize"
                urlForVK.queryItems = [
                    URLQueryItem(name: "client_id", value: "7461662"),
                    URLQueryItem(name: "redirect_uri", value: "/blank.html"),
                    URLQueryItem(name: "display", value: "mobile"),
                    URLQueryItem(name: "response_type", value: "token"),
                    URLQueryItem(name: "scope", value: "262150"), //262150
                    URLQueryItem(name: "v", value: "5.103")
                ]
        let request = URLRequest(url: urlForVK.url!)
        
        loginWebVIew.load(request)
        
    
    }
    
    
  
   

}

extension LoginWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let parameters = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String:String]()) { result, parameter in
                var dict = result
                let key = parameter[0]
                let value = parameter[1]
                dict[key] = value
                return dict
            }
            
        let token = parameters["access_token"]
        let userId = parameters["user_id"]
        
      
        
        Session.instance.token = token!
        Session.instance.userId = Int(userId!)!
        
//        print("token \(Session.instance.token)")
//        print("userID \(Session.instance.userId)")
        
        decisionHandler(.cancel)
        performSegue(withIdentifier: "webViewLogin", sender: token)

    }
    
    
}

