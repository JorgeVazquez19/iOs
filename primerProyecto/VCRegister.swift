//
//  VCRegister.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 3/4/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class VCRegister: UIViewController {

    
    @IBOutlet var txtNombre:UITextField?
    @IBOutlet var txtApellidos:UITextField?
    @IBOutlet var txtEmail:UITextField?
    @IBOutlet var btnAceptar:UIButton?
    @IBOutlet var btnCancelar:UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
