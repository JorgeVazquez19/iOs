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

class VCItem2: UIViewController,UITableViewDelegate, UITableViewDataSource, DataHolderDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    
    
    @IBOutlet var Tabla: UITableView?
    @IBOutlet var imgView:UIImageView?
    let imagePicker = UIImagePickerController()
    var imgData:Data?

    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.descargarDatos(delegate: self)
        imgView?.image = #imageLiteral(resourceName: "usuario")
        imagePicker.delegate = self
        /*let blRes:Bool = DataHolder.sharedInstance.descargarDatos()
        if(blRes){
            print("DESCARGADO")
            self.refresh////
        }else{
            print("No Descargado")
        }*/
    
    
    
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
    @IBAction func accionBotonGaleria(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func accionBotonCamara(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        imgData = UIImageJPEGRepresentation(img!, 0.5)! as Data
        imgView?.image = img
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DHDDescargaDatosCompleta(blFin: Bool) {
        if blFin{
            self.Tabla?.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return DataHolder.sharedInstance.arCoches.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "idMiCelda") as! MiCelda1
        
        celda.lblCelda?.text=DataHolder.sharedInstance.arCoches[indexPath.row].sNombre
        //celda.mostrarImagen(url: DataHolder.sharedInstance.arCoches[indexPath.row].sImg!)
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
