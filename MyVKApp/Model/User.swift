//
//  User.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 06.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit

struct User: Equatable {
    var name: String
    let avatar: UIImage
    let userPhoto: [UIImage]
}




final class FriendsFactory {
    static func mergeFriends() -> [User]{
        let elvina = User(name: "Эльвина Мещерякова", avatar: UIImage(named: "female1")!, userPhoto: [UIImage(named: "female1")!, UIImage(named: "female2")!, UIImage(named: "male3")!])
        let elvina1 = User(name: "Эльвина Мещерякова", avatar: UIImage(named: "female1")!, userPhoto: [UIImage(named: "female1")!, UIImage(named: "female2")!, UIImage(named: "male3")!])
        let leon = User(name: "Леон Мещеряков", avatar: UIImage(named: "male3")!, userPhoto: [UIImage(named: "female1")!, UIImage(named: "male3")!, UIImage(named: "male2")!])
        let leon1 = User(name: "Леон Мещеряков", avatar: UIImage(named: "male3")!, userPhoto: [UIImage(named: "female1")!, UIImage(named: "male3")!, UIImage(named: "male2")!])
        let ilvir = User(name: "Ильвир Гайнуллин", avatar: UIImage(named: "male2")!, userPhoto: [UIImage(named: "male3")!, UIImage(named: "male2")!, UIImage(named: "female2")!])
        let aigul = User(name: "Айгуль Саетгареева", avatar: UIImage(named: "female2")!, userPhoto: [UIImage(named: "male2")!, UIImage(named: "female2")!, UIImage(named: "male3")!])
        let kir = User(name: "Кир Горелкин", avatar: UIImage(named: "male1")!, userPhoto: [UIImage(named: "female1")!, UIImage(named: "male1")!, UIImage(named: "male3")!])
        return [elvina, elvina1, leon, leon1, ilvir, aigul, kir]
    }
    
    static func inAlphabetOrder(users: [User]) -> [(String,[User])] {
        var friendsInAlphabetOrder = Dictionary<String, [User]>()
        for user in users {
            let name = user.name
            if friendsInAlphabetOrder[name] == nil {
                friendsInAlphabetOrder[name] = Array<User>()
            }
            friendsInAlphabetOrder[name]?.append(user)
        }
        return friendsInAlphabetOrder.sorted { $0.0 < $1.0 }
    }
    
}


