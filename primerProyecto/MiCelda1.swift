//
//  MiCelda1.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 5/4/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class MiCelda1: UITableViewCell {
    @IBOutlet var lblCelda: UILabel?
    @IBOutlet var imgImagen: UIImageView?
    
    var imagenDescargada:UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func mostrarImagen(url:String){
        self.imgImagen?.image = nil
        let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL:url)
        
        gsReference?.getData(maxSize: 1 * 1024 * 1024) {data, error in
            if error != nil {
                
            }else{
                self.imagenDescargada = UIImage(data: data!)
                self.imgImagen?.image = self.imagenDescargada
            }
        }
        
    }
}
