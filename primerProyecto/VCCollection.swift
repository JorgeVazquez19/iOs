//
//  VCCollection.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 5/4/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class VCCollection: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var colPrincipal:UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataHolder.sharedInstance.arCoches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVCollection=collectionView.dequeueReusableCell(withReuseIdentifier: "MiCelda2", for: indexPath) as! CVCollection
        
        cell.lblCollection?.text=DataHolder.sharedInstance.arCoches[indexPath.row].sNombre
        cell.mostrar(url: DataHolder.sharedInstance.arCoches[indexPath.row].sImg!)
        /*
        if indexPath.row == 0{
            cell.lblCollection?.text="Jorge"
            cell.imagen?.image=UIImage(named:"nike.png")
        }else if indexPath.row == 1{
            cell.lblCollection?.text="Maria"
            cell.imagen?.image=UIImage(named:"lg.png")
        }else if indexPath.row == 2{
            cell.lblCollection?.text="Elena"
            cell.imagen?.image=UIImage(named:"hugo.png_1024")
        }else if indexPath.row == 3{
            cell.lblCollection?.text="Pedro"
            cell.imagen?.image=UIImage(named:"chanel.png")
        }else if indexPath.row == 4{
            cell.lblCollection?.text="Sara"
            cell.imagen?.image=UIImage(named:"adidas.png")
        }
        */
        return cell
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
