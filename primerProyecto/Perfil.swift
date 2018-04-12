//
//  Perfil.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 12/4/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class Perfil: NSObject {
    
    var sNombre:String?
    var iFecha:Int?
    var sApellidos:String?
    var ialtura:Int?
    
    func setMap(valores:[String:Any]) {
        sNombre = valores["nombre"] as? String
        iFecha = valores["nacimiento"] as? Int
        sApellidos = valores["apellidos"] as? String
        ialtura = valores["altura"] as? Int
    }
    
    func getMap() -> [String:Any] {
        return [
            "nombre": sNombre as Any,
            "apellido": sApellidos as Any,
            "nacimiento": iFecha as Any,
            "altura": ialtura as Any
        ]
    }
}
