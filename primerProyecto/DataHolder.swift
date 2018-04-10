//
//  DataHolder.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 10/4/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import Firebase
import UIKit

class DataHolder: NSObject {
    
    static let sharedInstance:DataHolder = DataHolder()
    
    var sNick:String = "Jorge"
    
    func initFireBase(){
        FirebaseApp.configure()
    }
}
