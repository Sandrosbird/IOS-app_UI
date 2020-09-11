//
//  LoadScreen.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 21.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit

class LoadScreen: UIViewController {

    @IBOutlet weak var firstLoadingPoint: UIImageView!
    @IBOutlet weak var secondLoadingPoint: UIImageView!
    @IBOutlet weak var thirdLoadingPoint: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UIView.animate(withDuration: 1.5, delay: 0,
                       options: [.curveLinear, .autoreverse, .repeat], animations: {
            self.firstLoadingPoint.alpha = 0.0
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.35,
                       options: [.curveLinear, .autoreverse, .repeat], animations: {
            self.secondLoadingPoint.alpha = 0.0
        })
        
        UIView.animate(withDuration: 3, delay: 0.7,
                       options: [.curveLinear], animations: {
            self.thirdLoadingPoint.alpha = 0.0
        }, completion: { (success) in
            self.performSegue(withIdentifier: "LoadComplete", sender: self)
        })
        
        // Do any additional setup after loading the view.
    }
    

    

}
