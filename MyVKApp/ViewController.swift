//
//  ViewController.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 26.03.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import Foundation
import UIKit
import WebKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var scrollBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginTextFIeld: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        appNameLabel.text = "MyVKApp"
        loginLabel.text = "Login"
        passwordLabel.text = "Password"
        
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        
            
                                    
        
    }
    
    @IBAction func logout(unwindSegue: UIStoryboardSegue) {}
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let login = loginTextFIeld.text!
        let password = passwordTextField.text!
        
        if login == "admin" && password == "123456" {
            return true
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Логин или пароль введены неверно", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return false
        }
    }
    
    @objc func keyboardWasShown (notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo as! [String: Any]
        let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        
        scrollBottomConstraint.constant = frame.height
        
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        scrollBottomConstraint.constant = 0
    }
        
   
    
        
        
    
    
        
}

class MainScreenView: UIView {
    
    var mainScreenLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.mainScreenLayer.colors = [
                    UIColor.white.cgColor,
                    UIColor.darkGray.cgColor]
        //        gradientLayer.locations = [0,1]
        self.mainScreenLayer.startPoint = CGPoint.zero
        self.mainScreenLayer.endPoint = CGPoint(x: 0, y: 1)
    }
    
}

