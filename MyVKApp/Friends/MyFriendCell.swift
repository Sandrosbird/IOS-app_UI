//
//  MyFriendCell.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 05.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit

class MyFriendCell: UITableViewCell {

    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendIcon: UIImageView!
//    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var iconShadow: IconShadow!
    @IBAction func resizeFriendIcon(_ sender: Any) {
        iconShadow.resizeAnimation(iconShadow)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        friendIcon.layer.borderColor = UIColor.darkGray.cgColor
        friendIcon.layer.borderWidth = 1
//        friendIcon.layer.masksToBounds = true
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        friendIcon.layer.cornerRadius = bounds.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func resizingAnimation(_ forView: UIView) {
        
    }

}
