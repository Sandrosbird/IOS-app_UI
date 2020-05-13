//
//  UserImageView.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 10.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit

final class ImageView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        friends
//        layer.cornerRadius = bounds.height / 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
    }
}

final class UserImageSubview: UIImageView {
    
}
