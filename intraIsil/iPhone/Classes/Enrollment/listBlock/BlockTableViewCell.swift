//
//  blockTableViewCell.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/16/21.
//

import UIKit

class BlockTableViewCell: UITableViewCell {

    @IBOutlet var texto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
