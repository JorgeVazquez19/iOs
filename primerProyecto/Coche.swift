//
//  Coche.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 19/4/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class Coche: NSObject {
    
    var sNombre:String?
    var sMarca:String?
    var iFabricado:Int?

    
    init(valores:[String:AnyObject]) {
        sNombre=valores["Nombre"] as? String
        sMarca=valores["Marca"] as? String
        iFabricado=valores["Fabricado"] as? Int
    }
}
