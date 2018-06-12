//
//  Perfil.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 12/4/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class Perfil: NSObject {
    
    var sID:String?
    var sUsuario:String?
    var sEmail:String?
    var sTelefono:String?
    
    func setMap(valores:[String:Any]) {
        sUsuario=valores["Usuario"] as? String
        sEmail=valores["Email"] as? String
        sTelefono=valores["Telefono"] as? String
    }
    
    func getMap() -> [String:Any] {
        var mapTemp:[String:Any] = [:]
        mapTemp["Usuario"] = sUsuario
        mapTemp["Email"] = sEmail
        mapTemp["Telefono"] = sTelefono
        return mapTemp
    }
}
