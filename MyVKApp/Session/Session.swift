//
//  Session.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 01.05.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit
import WebKit

class Session {
    
    private init() {}
    
    static let instance = Session()
    
    var token = ""
    var userId = 0
    
    
  
}

extension Session {
    
    
    
    
    func getFriends() {
        
        let configuration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: configuration)
        
        var urlConstructor = URLComponents()
        
        urlConstructor.scheme = "https"
        
        urlConstructor.host = "api.vk.com"
        
        urlConstructor.path = "/method/friends.get"
        
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_id", value: "\(userId)"),
            URLQueryItem(name: "access_token", value: "\(token)"),
            URLQueryItem(name: "v", value: "5.103"),
            URLQueryItem(name: "fields", value: "first_name"),
            URLQueryItem(name: "fields", value: "last_name"),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "order", value: "hints")
        ]
        
        
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
            guard let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) else {
                return
            }
            
            let usersArray = json as! [Any]
            
            for friendResponse in usersArray {
                let friendResponse = friendResponse as! [String: Any]
                
                let response = friendResponse["response"] as! [String: Any]
                let count = response["count"] as! Int
                
                let friends = response["items"] as! [String: Any]
                let id = friends["id"] as! Int
                let first_name = friends["first_name"] as! String
                let last_name = friends["last_name"] as! String
                let photo_50 = friends["photo_50"] as! String                
                
            }
            
            
        }
        
        let friends: [User]
        
        
        
        
        task.resume()
       
    }
}
