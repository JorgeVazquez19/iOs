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
import FirebaseStorage

class DataHolder: NSObject {
    
    static let sharedInstance:DataHolder = DataHolder()
    
    var sNick:String = "Jorge"
    var miPerfil:Perfil = Perfil()
    var firDataBaseRef: DatabaseReference!
    var firStorageRef:StorageReference?
    var fireStoreDB:Firestore?
    var firStorage:Storage?
    var arCoches:[Coche] = []
    var hmimg:[String:UIImage] = [:]
    
    
    func initFireBase() {
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
        firStorage = Storage.storage()
        firStorageRef = firStorage?.reference()
    }
        
    func descargarDatos(delegate:DataHolderDelegate){
            fireStoreDB?.collection("Coches").addSnapshotListener() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    delegate.DHDDescargaDatosCompleta!(blFin: false)
                } else {
                    self.arCoches = []
                    for document in querySnapshot!.documents {
                        let coches:Coche = Coche()
                        coches.sID=document.documentID
                        coches.setMap(valores: document.data())
                        self.arCoches.append(coches)
                        
                        //print("document.documentID) => \(document.data())")
                        
                    }
                    
                    print("---->>>  ", self.arCoches)
                    delegate.DHDDescargaDatosCompleta!(blFin: true)
                }
                
            }
            
        }
    
    func firebaseRegistro(withEmail: String, password: String, delegate:DataHolderDelegate){
        Auth.auth().createUser(withEmail: withEmail,password: password) { (user, error) in
            if user != nil{
                print("Te Registraste")
                //self.performSegue(withIdentifier: "trRegistroControlador", sender: self)
                self.fireStoreDB?.collection("Perfiles").document((user?.uid)!).setData(self.miPerfil.getMap())
                delegate.DHDRegistro!(blFinRegistro: true)
            }else{
                print(error!)
            }
        }
    }
    func firebaseLogin(withEmail: String, password: String, delegate:DataHolderDelegate){
        Auth.auth().signIn(withEmail: withEmail, password: password) { (user, error) in
            if user != nil{
                let ruta =
                    self.fireStoreDB?.collection("Perfiles").document((user?.uid)!)
                
                ruta?.getDocument { (document, error) in
                    if document != nil{
                        self.miPerfil.setMap(valores:(document?.data())!)
                        delegate.DHDLogin!(blFinLogin: true)
                    }else{
                        print(error!)
                    }
                }
                
                
            }else{
                print("NO SE HA LOGUEADO")
                print(error!)
            }
        }
    }
    func perfilUsuario(){
    let user = Auth.auth().currentUser
    if let user = user {
        let Usuario = user.displayName
        let photoURL = user.photoURL
        }
    }
    }

    @objc protocol DataHolderDelegate{
        @objc optional func DHDDescargaDatosCompleta(blFin: Bool)
        @objc optional func DHDRegistro(blFinRegistro: Bool)
        @objc optional func DHDLogin(blFinLogin: Bool)
        
      
        }

