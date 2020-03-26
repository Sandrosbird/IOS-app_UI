//
//  ViewController.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 26.03.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loadScreenButton: UIButton!
    @IBOutlet weak var scrollBottomConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollBottomConstraint.constant = 500
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func loginPressed(_ sender: UIButton, forEvent: UIEvent) {
    }
    
    @objc func keyboardWasShown (notification: Notification) {
        //нижний отступ UIScrollView по размеру клавиатуры
        scrollBottomConstraint.constant = 300
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        scrollBottomConstraint.constant = 0
    }
        
}

