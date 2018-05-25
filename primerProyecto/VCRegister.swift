//
//  VCRegister.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 3/4/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCRegister: UIViewController, DataHolderDelegate{

    
    @IBOutlet var txtNombre:UITextField?
    @IBOutlet var txtContrasena:UITextField?
    @IBOutlet var btnAceptar:UIButton?
    @IBOutlet var btnCancelar:UIButton?
    @IBOutlet var txtUsuario:UITextField?
    @IBOutlet var txtRepetir:UITextField?
    @IBOutlet var Date:UIDatePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func clickAceptar(){
        DataHolder.sharedInstance.firebaseRegistro(withEmail: (txtNombre?.text)!, password: (txtContrasena?.text)!, delegate: self)
        //DataHolder.sharedInstance.miPerfil.sNombre = "Jorge"
        //DataHolder.sharedInstance.miPerfil.iFecha = "1998"
        //DataHolder.sharedInstance.miPerfil.iAltura = "2"
        //DataHolder.sharedInstance.miPerfil.sApellidos = "Vazquez"
       /* Auth.auth().createUser(withEmail: (txtNombre?.text)!, password: (txtContrasena?.text)!) { (user, error) in
            if user != nil{
                print("Te Registraste")
                self.performSegue(withIdentifier: "trRegistroControlador", sender: self)
                DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!).setData(DataHolder.sharedInstance.miPerfil.getMap())
            }else{
                print(error!)
            }
        }*/
    }
    func DHDRegistro(blFinRegistro: Bool) {
        if blFinRegistro{
            self.performSegue(withIdentifier: "trRegistroControlador", sender: self)
        }
    }
    /*@IBAction func login(){
        if !txtNombre?.text?. && !txtApellidos?.text?.isEmpty{
            self.performSegue(withIdentifier: "trLogin", sender: self)
        }
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
