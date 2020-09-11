//
//  AllGroupsCell.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 06.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit

class AllGroupsCell: UITableViewCell {

    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        groupImg.layer.borderColor = UIColor.darkGray.cgColor
                    groupImg.layer.borderWidth = 1
            //        friendIcon.layer.masksToBounds = true
                    clipsToBounds = true
    }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            groupImg.layer.cornerRadius = bounds.height / 2
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
