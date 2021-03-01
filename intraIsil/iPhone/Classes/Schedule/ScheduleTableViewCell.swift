//
//  ScheduleTableViewCell.swift
//  intraIsil
//
//  Created by Christopher Pinillos Collazos on 14/02/21.
//

import UIKit

protocol ScheduleTableViewCellDelegate {
    func ScheduleTableViewCell(_ cell: ScheduleTableViewCell, delete data: EnrolledCourseBE)
}

class ScheduleTableViewCell: UITableViewCell, UITableViewDelegate {
    
    @IBOutlet weak var imageCourse: UIImageView!
    @IBOutlet weak var nameCourse: UILabel!
    @IBOutlet weak var nameTeacher: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var schedule: UILabel!
    
    var delegate: ScheduleTableViewCellDelegate?
    
    public var obj: EnrolledCourseBE! {
        didSet{
            self.updateData()
        }
    }
    
    private func updateData(){
        
        self.nameCourse.text = self.obj.nameCourse
        self.nameTeacher.text = self.obj.nameTeacher
        self.place.text = self.obj.place
        self.schedule.text = self.obj.schedule
        
        let courseHolderImage = UIImage(named: "place_placeholder")
        self.imageCourse.downloadImageInURLString(self.obj.urlImage, placeHolderImage: courseHolderImage) { (image, urlString) in
            if self.obj.urlImage == urlString {
                self.imageCourse.image = image
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        self.imageCourse.layer.cornerRadius = 30
    }
}
