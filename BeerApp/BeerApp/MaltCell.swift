//
//  IngredientsCell.swift
//  BeerApp
//
//  Created by Mrlee on 2018. 1. 18..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

class MaltCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
