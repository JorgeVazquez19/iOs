//
//  VCItem2.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 5/4/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class VCItem2: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet var Tabla: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    let refHandle = DataHolder.sharedInstance.firDataBaseRef.child("Coches").observe(DataEventType.value, with: { (snapshot) in
        print("Lo descargado es: ",snapshot.value)
    //let postDict = snapshot.value as? [String : AnyObject] ?? [:]
    // ...
    })

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "idMiCelda") as! MiCelda1
        
        if indexPath.row == 0{
            celda.lblCelda?.text="Jorge"
        }else if indexPath.row == 1{
            celda.lblCelda?.text="Maria"
        }else if indexPath.row == 2{
            celda.lblCelda?.text="Elena"
        }else if indexPath.row == 3{
            celda.lblCelda?.text="Pedro"
        }else if indexPath.row == 4{
            celda.lblCelda?.text="Sara"
        }
        
        return celda
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
