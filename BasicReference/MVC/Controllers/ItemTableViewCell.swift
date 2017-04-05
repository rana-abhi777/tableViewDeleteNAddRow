//
//  ItemTableViewCell.swift
//  BasicReference
//
//  Created by Sierra 4 on 05/04/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var lblItemName: UILabel!
    
    var gesture: Bool!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
