//
//  LikeButton.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 12.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit

class LikeButton: UIControl {
    private var liked = false
    
    private var likesCount: UILabel = {
        let likesCount = UILabel()
        likesCount.text = "0"
        likesCount.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        likesCount.numberOfLines = 1
        likesCount.translatesAutoresizingMaskIntoConstraints = false
        return likesCount
    }()
    
    private var likeImg: UIImageView = {
        let likeImg = UIImageView()
        likeImg.image = UIImage(systemName: "heart.fill")
        likeImg.contentMode = .scaleAspectFill
        likeImg.tintColor = UIColor.red.withAlphaComponent(0.3)
        likeImg.translatesAutoresizingMaskIntoConstraints = false
        return likeImg
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        changeState()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        changeState()
    }
    
    private func changeState() {
        
        addSubview(likesCount)
        NSLayoutConstraint.activate([
            likesCount.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            likesCount.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            likesCount.topAnchor.constraint(equalTo: topAnchor),
            likesCount.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
        addSubview(likeImg)
        NSLayoutConstraint.activate([
            likeImg.leadingAnchor.constraint(equalTo: leadingAnchor),
            likeImg.topAnchor.constraint(equalTo: topAnchor),
            likeImg.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        likesCount.isUserInteractionEnabled = false
        likeImg.isUserInteractionEnabled = false
        
        addTarget(self, action: #selector(changeLikesCount), for: .touchUpInside)
    }
    
    @objc func changeLikesCount () {
        liked = !liked
        likesCount.text = liked ? "1" : "0"
        likeImg.tintColor = liked ? UIColor.red : UIColor.red.withAlphaComponent(0.3)
    }
}
