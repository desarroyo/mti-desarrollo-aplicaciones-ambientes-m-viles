//
//  MapaViewController.swift
//  proyecto-final
//
//  Created by David Arroyo Sanchez on 7/7/19.
//  Copyright © 2019 David Arroyo Sanchez. All rights reserved.
//

import UIKit
import MapKit


class MapaViewController: UIViewController {

    @IBOutlet weak var mapa: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        lblNombre.text = user.name
        
        lblCalle.text = user.street
        lblUsername.text = user.username
        lblCiudad.text = user.city
         */
        
        // Do any additional setup after loading the view.
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: 20.734622, longitude: -103.380392)
        let span = MKCoordinateSpan(latitudeDelta: 0.075, longitudeDelta: 0.075)
        let region = MKCoordinateRegion(center: pin.coordinate, span: span)
        mapa.setRegion(region, animated: true)
        pin.title = "Auditorio Telmex"
        mapa.addAnnotation(pin)
        mapa.setCenter(pin.coordinate, animated: true)
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
