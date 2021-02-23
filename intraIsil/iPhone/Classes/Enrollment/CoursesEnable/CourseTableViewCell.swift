//
//  MyCustomTableViewCell.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/15/21.
//

import UIKit

protocol CourseTableViewCellDelegate {
    func CourseTableViewCell(_ cell: CourseTableViewCell, deletePlace place: CourseBE)
}

class CourseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCourse: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var teacher: UILabel!
    
    var delegate: CourseTableViewCellDelegate?
     
    public var obj: CourseBE! {
        didSet {
            self.updateData()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func updateData() {
        self.name.text       = self.obj.name
        self.teacher.text    = self.obj.teacher
        
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

