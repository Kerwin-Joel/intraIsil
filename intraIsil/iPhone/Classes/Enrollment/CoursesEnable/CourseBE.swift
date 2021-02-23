//
//  CourseBE.swift
//  intraIsil
//
//  Created by Stalin Huallullo on 21/02/21.
//

import Foundation

class CourseBE {
    
    var idCourse    : String
    var urlImage    : String
    var name        : String
    var teacher     : String
    
    init(idCourse: String, urlImage: String, name: String, teacher: String) {
        
        self.idCourse   = idCourse
        self.urlImage   = urlImage
        self.name       = name
        self.teacher    = teacher
    }
}
