//
//  UserImageView.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 10.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit

//Не используется для фото друзей
final class ImageView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
    }
}



