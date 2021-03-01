//
//  File.swift
//  intraIsil
//
//  Created by Stalin Huallullo on 28/02/21.
//

import Foundation

class EnrolledCourseBE {
    
    var urlImage  : String
    var nameCourse  : String
    var nameTeacher : String
    var place : String
    var schedule    : String
    
    init(json: JSON) {
        self.urlImage       = json["urlImage"] as? String ?? ""
        self.nameCourse     = json["nameCourse"] as? String ?? ""
        self.nameTeacher    = json["nameTeacher"] as? String ?? ""
        self.place          = json["place"] as? String ?? ""
        self.schedule       = json["schedule"] as? String ?? ""
    }
}
