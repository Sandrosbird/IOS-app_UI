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
    User(name: "Эльвина Мещерякова", avatar: UIImage(named: "girl.png")!, userPhoto: [UIImage(named: "girl")!, UIImage(named: "boy")!, UIImage(named: "girl")!]),
    User(name: "Леон Мещеряков", avatar: UIImage(named: "boy.png")!, userPhoto: [UIImage(named: "girl.png")!, UIImage(named: "boy.png")!, UIImage(named: "girl.png")!]),
    User(name: "Ильвир Гайнуллин", avatar: UIImage(named: "boy.png")!, userPhoto: [UIImage(named: "girl.png")!, UIImage(named: "boy.png")!, UIImage(named: "girl.png")!]),
    User(name: "Айгуль Саетгареева", avatar: UIImage(named: "girl.png")!, userPhoto: [UIImage(named: "girl.png")!, UIImage(named: "boy.png")!, UIImage(named: "girl.png")!]),
    User(name: "Кир Горелкин", avatar: UIImage(named: "boy.png")!, userPhoto: [UIImage(named: "girl.png")!, UIImage(named: "boy.png")!, UIImage(named: "girl.png")!]),
]
