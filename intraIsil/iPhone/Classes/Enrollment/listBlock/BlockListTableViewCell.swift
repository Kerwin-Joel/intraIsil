//
//  BlockListTableViewCell.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/16/21.
//

import UIKit

class BlockListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myViewCell: UIView!
    
    @IBOutlet weak var mylabelTime: UILabel!
    @IBOutlet weak var myLabelTeacher: UIView!
    
    @IBOutlet weak var mybuttonChoose: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myViewCell.layer.cornerRadius = 30
        mybuttonChoose.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
