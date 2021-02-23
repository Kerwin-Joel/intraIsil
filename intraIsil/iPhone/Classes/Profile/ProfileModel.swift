//
//  Profile.swift
//  intraIsil
//
//  Created by Stalin Huallullo on 17/02/21.
//

typealias JSON = [String: Any]

class ProfileModel {
    
    var id: String
    var apellidos: String
    var dni: String
    var email: String
    var nombre: String
    var rol: String

    init(json: JSON){
       
        self.id         = json["id"]            as? String ?? ""
        self.apellidos  = json["apellidos"]     as? String ?? ""
        self.dni        = json["dni"]           as? String ?? ""
        self.email      = json["email"]         as? String ?? ""
        self.nombre     = json["nombre"]        as? String ?? ""
        self.rol        = json["rol"]           as? String ?? ""
        
    }

}

