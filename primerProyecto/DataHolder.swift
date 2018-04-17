//
//  DataHolder.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 10/4/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import Firebase
import UIKit
import FirebaseDatabase

class DataHolder: NSObject {
    
    static let sharedInstance:DataHolder = DataHolder()
    
    var sNick:String = "Jorge"
    var miPerfil:Perfil = Perfil()
    var firDataBaseRef: DatabaseReference!
    
    var fireStoreDB:Firestore?
    
    func initFireBase() {
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
        firDataBaseRef = Database.database().reference()
    }
}
