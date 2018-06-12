//
//  VCMapa.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 19/4/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit
import MapKit

class VCMapa: UIViewController, CLLocationManagerDelegate, DataHolderDelegate {
    
    @IBOutlet var miMapa:MKMapView?
    var locationManager:CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.descargarDatos(delegate: self)
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        miMapa?.showsUserLocation = true
        agregarPin(titulo:"Calle de Servator, 19", latitude:40.464636, longitude:-3.647671)
        agregarPin(titulo:"Calle Hermanos Gomez, 53", latitude:40.429843, longitude:-3.649511)
        agregarPin(titulo:"Estacion de Autobuses, 13", latitude:40.372698, longitude:-3.676732)
        agregarPin(titulo:"Calle Alfredo Aleix, 5", latitude:40.368448, longitude:-3.754559)
        agregarPin(titulo:"Calle Tablada, 25", latitude:40.460389, longitude:-3.701925)
        agregarPin(titulo:"Calle Mirasierra, 0", latitude:40.38916, longitude:-3.7051)
        // Do any additional setup after loading the view.
    }
    
    func DHDDescargaDatosCompleta(blFin: Bool) {
        if blFin{
            self.agregarPines()
        }
    }
    
    func agregarPines() {
        print("Agregando pines")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func agregarPin(titulo:String, latitude lat:Double, longitude long:Double){
        let miPin:MKPointAnnotation = MKPointAnnotation()
        miPin.coordinate.latitude=lat
        miPin.coordinate.longitude=long
        miPin.title = titulo
        miMapa?.addAnnotation(miPin)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print(locations[0])
        self.NuevaRegionMapa(lat: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
    }
    
    func NuevaRegionMapa(lat: Double, longitude long:Double){
        let miSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1,longitudeDelta: 0.1)
        let puntoCentro:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 40.4167, longitude: -3.70325)
        let miRegion:MKCoordinateRegion = MKCoordinateRegion(center: puntoCentro, span: miSpan)
        miMapa?.setRegion(miRegion, animated: true)
    }

}
