//
//  ViewController.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 22/3/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lblPrueba:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblPrueba?.text = "HELLO!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

