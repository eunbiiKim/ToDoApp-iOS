//
//  DailyToDoCell.swift
//  ToDo
//
//  Created by Meo MacBook Pro on 27/06/2019.
//  Copyright © 2019 Busan iOS. All rights reserved.
//

import UIKit

class DailyToDoCell: UITableViewCell {

    @IBOutlet var dailyTitle: UITextField!
    @IBOutlet var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
