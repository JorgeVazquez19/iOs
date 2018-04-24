//
//  CVCollection.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 5/4/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class CVCollection: UICollectionViewCell {
    @IBOutlet var imagen:UIImageView?
    @IBOutlet var lblCollection:UILabel?
    
    var imagenDescargada:UIImage?
    func mostrarImagen(url:String){
        self.imagen?.image = nil
        
        let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL:url)
        
        gsReference?.getData(maxSize: 1 * 1024 * 1024) {data, error in
            if error != nil {
                print("error ocurred")
            }else{
                self.imagenDescargada = UIImage(data:data!)
                self.imagen?.image = self.imagenDescargada
            }
        }
    }
}
