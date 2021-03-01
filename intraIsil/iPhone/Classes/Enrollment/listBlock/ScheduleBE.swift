//
//  ScheduleBE.swift
//  intraIsil
//
//  Created by Stalin Huallullo on 27/02/21.
//

import Foundation

class ScheduleBE{
    
    var idSchedule  : String
    var day         : String
    var hours       : String
    var place       : String
    init(json: JSON, idSchedule: String) {
        
        self.idSchedule = idSchedule//json["idSchedule"] as? String ?? ""
        self.day        = json["dia"] as? String ?? ""
        self.hours      = json["hora"] as? String ?? ""
        self.place      = json["lugar"] as? String ?? ""
    }
    /*
     init(idSchedule: String, day: String, hours: String, place: String) {
         
         self.idSchedule = idSchedule
         self.day        = day
         self.hours      = hours
         self.place      = place
     }
     */
}
