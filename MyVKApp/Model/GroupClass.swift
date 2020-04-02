//
//  GroupClass.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 02.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit

class GroupClass: NSObject {
    enum GroupType {
        case autoMoto, citiesCountries, homeDesign, animals, musicArtists, beautyHealthness, foodRecipes, cultureArt
    }
    
    let name: String
    let type: GroupType
    let numberOfSubcibers: Int
    let groupDescription: Int
    
    init(name: String, type: GroupType, numberOfSubcibers: Int, groupDescription: Int) {
        self.name = name
        self.type = type
        self.numberOfSubcibers = numberOfSubcibers
        self.groupDescription = groupDescription
    }
}
