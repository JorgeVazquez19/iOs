//
//  ViewController.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 22/3/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var btnLogin:UIButton?
    @IBOutlet var lblReintentar:UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblReintentar?.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        //lblPrueba?.text = "Bienvenido!"
       // txtUser?.text = DataHolder.sharedInstance.sNick
        
        /*Auth.auth().addStateDidChangeListener{ (auth, user) in
            // ...
            if user != nil{
                self.performSegue(withIdentifier: "trLogin", sender: self)
            }
        }*/
    }
    /*
    do{
        try Auth.auth().signOut()
    }catch{
    
    }*/
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(){
        //print("Hey Whats up!!"+(txtUser?.text)!)
        Auth.auth().signIn(withEmail: (txtUser?.text)!, password: (txtPass?.text)!) { (user, error) in
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
       // }
     }
      @IBAction func alerta(){
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
        }
    @IBAction func register(){
        self.performSegue(withIdentifier: "trRegistro", sender: self)
    }
}

