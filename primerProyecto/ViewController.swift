//
//  ViewController.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 22/3/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var btnLogin:UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //lblPrueba?.text = "Bienvenido!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(){
        //print("Hey Whats up!!"+(txtUser?.text)!)
        if txtUser?.text == "Jorge Vazquez" && txtPass?.text == "123456789"{
            self.performSegue(withIdentifier: "trLogin", sender: self)
        }
    }
    @IBAction func register(){
        self.performSegue(withIdentifier: "trRegistro", sender: self)
    }
}

