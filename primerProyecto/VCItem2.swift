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
    var arCoches:[Coche]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.fireStoreDB?.collection("Coches").getDocuments() { (querySnapshot, err) in
            if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let coches:Coche = Coche()
                        coches.sID=document.documentID
                        coches.setMap(valores: document.data())
                        self.arCoches.append(coches)
                        print("\(document.documentID) => \(document.data())")
                    }
                
                
                self.Tabla?.reloadData()
                }
            
        }
    
    
    
        /*let refHandle = DataHolder.sharedInstance.firDataBaseRef.child("Coches").observeSingleEvent(of: .value, with: {(snapshot) in
            let arTemp = snapshot.value as? Array<AnyObject>
           //if(DataHolder.sharedInstance.arCoches==nil){
                DataHolder.sharedInstance.arCoches = Array<Coche>()
            //	}
            
            for co in arTemp! as [AnyObject]{
                let cochei=Coche(valores: co as! [String : AnyObject])
                DataHolder.sharedInstance.arCoches?.append(cochei)
            }
            
            self.Tabla?.reloadData()
            //let coche0=Coche(valores: arTemp?[0] as! [String : AnyObject]
            //let coche0=arTemp?[0] as? [String:AnyObject]
           // print("Lo descargado es: ",snapshot.value)
        })*/
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.arCoches.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "idMiCelda") as! MiCelda1
        
        celda.lblCelda?.text=self.arCoches[indexPath.row].sNombre
        celda.mostrarImagen(url: self.arCoches[indexPath.row].sImg!)
       /* if indexPath.row == 0{
            celda.lblCelda?.text="Jorge"
        }else if indexPath.row == 1{
            celda.lblCelda?.text="Maria"
        }else if indexPath.row == 2{
            celda.lblCelda?.text="Elena"
        }else if indexPath.row == 3{
            celda.lblCelda?.text="Pedro"
        }else if indexPath.row == 4{
            celda.lblCelda?.text="Sara"
        }*/
        
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
