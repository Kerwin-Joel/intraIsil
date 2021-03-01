//
//  ListCurseTableViewCell.swift
//  intraIsil
//
//  Created by Stalin Huallullo on 27/02/21.
//


import UIKit

protocol ListCourseTableViewCellDelegate {
    func ListCourseTableViewCell(_ cell: ListCourseTableViewCell, deletePlace place: ScheduleBE)
}

class ListCourseTableViewCell: UITableViewCell{
    
    
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var hours: UILabel!
    
    var delegate: ListCourseTableViewCellDelegate?
    
    public var obj: ScheduleBE!{
        didSet{
            self.updateData()
        }
    }
    
    
    private func updateData(){
        self.place.text = self.obj.place
        self.day.text = self.obj.day
        self.hours.text = self.obj.hours
    }
    
}
