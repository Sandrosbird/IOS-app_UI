//
//  MyGroupCell.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 05.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit

class MyGroupCell: UITableViewCell {
    
    
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        groupImg.layer.borderColor = UIColor.darkGray.cgColor
        groupImg.layer.borderWidth = 1
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
