//
//  ScheduleTableViewCell.swift
//  intraIsil
//
//  Created by Christopher Pinillos Collazos on 14/02/21.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblDia       : UILabel!
    @IBOutlet weak var lblRelleno   : UILabel!
    
    public var objRelleno: Relleno! {
        didSet{
            self.updateData()
        }
    }
    
    private func updateData(){
        
        self.lblDia.text = self.objRelleno.dia
        self.lblRelleno.text = self.objRelleno.relleno
    }
}
