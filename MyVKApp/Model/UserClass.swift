//
//  UserClass.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 02.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit

class UserClass: NSObject {
    enum UserStatus {
        case online
        case offline
        case awayFromKeyboard
    }
    
    enum GenderType {
        case male
        case female
    }
    
    let name: String
    let surname: String
    let age: Int
    let gender: GenderType
    let photo: UIImage
    let status: UserStatus
    
    init(name: String, surname: String, age: Int, gender: GenderType, photo: UIImage, status: UserStatus) {
        self.name = name
        self.surname = surname
        self.age = age
        self.gender = gender
        self.photo = photo
        self.status = status
    }
}
