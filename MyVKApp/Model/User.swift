//
//  User.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 06.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit

struct User {
    let name: String
    let avatar: UIImage
    let userPhoto: [UIImage]
}


var friends: [User] = [
    User(name: "Эльвина Мещерякова", avatar: UIImage(named: "female1")!, userPhoto: [UIImage(named: "female1")!, UIImage(named: "female2")!, UIImage(named: "male3")!]),
    User(name: "Леон Мещеряков", avatar: UIImage(named: "male3")!, userPhoto: [UIImage(named: "female1")!, UIImage(named: "male3")!, UIImage(named: "male2")!]),
    User(name: "Ильвир Гайнуллин", avatar: UIImage(named: "male2")!, userPhoto: [UIImage(named: "male3")!, UIImage(named: "male2")!, UIImage(named: "female2")!]),
    User(name: "Айгуль Саетгареева", avatar: UIImage(named: "female2")!, userPhoto: [UIImage(named: "male2")!, UIImage(named: "female2")!, UIImage(named: "male3")!]),
    User(name: "Кир Горелкин", avatar: UIImage(named: "male1")!, userPhoto: [UIImage(named: "female1")!, UIImage(named: "male1")!, UIImage(named: "male3")!]),
]
