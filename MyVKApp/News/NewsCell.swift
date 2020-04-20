//
//  NewsCell.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 19.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsCreatorName: UILabel!
    @IBOutlet weak var newsCreatorIcon: UIImageView!
    @IBOutlet weak var newsTextField: UITextField!
    @IBOutlet weak var newsImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newsCreatorIcon.layer.borderColor = UIColor.darkGray.cgColor
        newsCreatorIcon.layer.borderWidth = 1
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        
        newsCreatorIcon.layer.cornerRadius = bounds.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
