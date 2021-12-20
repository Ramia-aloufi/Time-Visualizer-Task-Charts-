//
//  TableViewCell.swift
//  Time Visualizer (Charts)
//
//  Created by R on 16/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var taskTF: UITextField!
    
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        taskTF.textColor = .lightGray
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

        
    }


