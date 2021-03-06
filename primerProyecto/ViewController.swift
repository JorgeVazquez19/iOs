//
//  ViewController.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 22/3/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, DataHolderDelegate {
    
    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var btnLogin:UIButton?
    @IBOutlet var btnRegister:UIButton?
    @IBOutlet var lblReintentar:UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblReintentar?.isHidden=true
        self.btnLogin?.layer.cornerRadius = 15
        self.btnRegister?.layer.cornerRadius = 15
    
    }
   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func login(){
        
        DataHolder.sharedInstance.firebaseLogin(withEmail: (txtUser?.text)!, password: (txtPass?.text)!, delegate: self)
        //print("Hey Whats up!!"+(txtUser?.text)!)
        /*Auth.auth().signIn(withEmail: (txtUser?.text)!, password: (txtPass?.text)!) { (user, error) in
            if user != nil{
                let ruta =
                DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!)
                
                ruta?.getDocument { (document, error) in
                    if document != nil{
                        DataHolder.sharedInstance.miPerfil.setMap(valores:(document?.data())!)
                        self.performSegue(withIdentifier: "trControlador", sender: self)
                    }else{
                        print(error!)
                        print(self.lblReintentar)
    
                    }
                }
                
                
            }else{
                print("NO SE HA LOGUEADO")
                print(error!)
                self.lblReintentar?.isHidden = false
            }
        }
        //if txtUser?.text == "Jorge Vazquez" && txtPass?.text == "123456789"{
        //    self.performSegue(withIdentifier: "trLogin", sender: self)
       // }*/
     }
    func DHDLogin(blFinLogin: Bool) {
        if blFinLogin{
            self.performSegue(withIdentifier: "trControlador", sender: self)
        }
    }
      /*@IBAction func alerta(){
            let alert = UIAlertController(
                title: nil,
                message: "Introduce tus datos por favor",
                preferredStyle: .alert)
            let reintentar = UIAlertAction(                      //funcion alerta
                title: "Aceptar",
                style: .default) { (UIAlertAction) in
                    self.login()
            }
            alert.addAction(reintentar)
            self.present(alert, animated: true, completion: nil)
        }*/
    @IBAction func register(){
        self.performSegue(withIdentifier: "trRegistro", sender: self)
    }
}

