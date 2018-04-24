//
//  VCMapa.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 19/4/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit
import MapKit

class VCMapa: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var miMapa:MKMapView?
    var locationManager:CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.agregarPin(titulo: "hola", latitude: 42, longitude: -3)
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        miMapa?.showsUserLocation = true
        // Do any additional setup after loading the view.
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
        let miSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01,longitudeDelta: 0.01)
        let puntoCentro:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let miRegion:MKCoordinateRegion = MKCoordinateRegion(center: puntoCentro, span: miSpan)
        miMapa?.setRegion(miRegion, animated: true)
    }

}
