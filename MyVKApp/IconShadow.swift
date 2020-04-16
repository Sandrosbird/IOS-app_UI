//
//  IconShadow.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 12.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit

@IBDesignable class IconShadow: UIView {
    
    @IBInspectable
    var shadowColor: UIColor = .black   {
        didSet {
            self.refreshShadowColor()
        }
    }
    
    @IBInspectable
    var shadowOpacity: CGFloat = 1.0 {
        didSet {
            self.refreshShadowOpacity()
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = 1.0 {
        didSet {
            self.refreshShadowRadius()
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize = .zero {
        didSet {
            self.refreshShadowOffset()
        }
    }

    
    func refreshShadowColor() {
        self.layer.shadowColor = self.shadowColor.cgColor
    }
    
    func refreshShadowOpacity() {
        self.layer.shadowOpacity = Float(self.shadowOpacity)
    }
    
    func refreshShadowRadius() {
        self.layer.shadowRadius = self.shadowRadius
    }
    
    func refreshShadowOffset() {
        self.layer.shadowOffset = shadowOffset
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
    }
    
}
