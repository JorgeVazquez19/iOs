//
//  Coche.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 19/4/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class Coche: NSObject {
    let IDNombre = "Nombre"
    let IDImagen = "img"
    
    var sID:String?
    var sNombre:String?
    var sImg:String?

    
    func setMap(valores:[String:Any]) {
        sNombre=valores[IDNombre] as? String
        sImg=valores[IDImagen] as? String
        
        if sImg == nil{
            sImg = "gs://mi-proyecto-increible19.appspot.com/musica.png"
        }
    }
    func getMap() -> [String:Any]{
        return [
            IDNombre: sNombre as Any,
            IDImagen: sImg as Any
        ]
    }
}
