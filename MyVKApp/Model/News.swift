//
//  News.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 19.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit

struct News {
    var newsText: String
    var newsCreatorUser: User?
    var newsCreatorGroup: Group?
    var newsImage: [UIImage]
       
}


final class NewsFactory {
    
//  elvina = friends[0]
//  elvina1 = friends[1]
//  leon = friends[2]
//  leon1 = friends[3]
//  ilvir = friends[4]
//  aigul = friends[5]
//  kir = friends[6]
    
    static func createNewsArray() -> [News] {
        let friends = FriendsFactory.mergeFriends()
        let firstNews = News(newsText: "cursus risus at ultrices mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus et magnis dis", newsCreatorUser: friends[0], newsCreatorGroup: nil, newsImage: [UIImage(named: "forNews")!])
        let secondNews = News(newsText: "cursus risus at ultrices mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus et magnis dis", newsCreatorUser: friends[1], newsCreatorGroup: nil, newsImage: [UIImage(named: "forNews")!])
        let thirdNews = News(newsText: "cursus risus at ultrices mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus et magnis dis", newsCreatorUser: friends[2], newsCreatorGroup: nil, newsImage: [UIImage(named: "forNews")!])
        return [firstNews, secondNews, thirdNews]
    }
}
