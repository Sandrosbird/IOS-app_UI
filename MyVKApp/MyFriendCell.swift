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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
