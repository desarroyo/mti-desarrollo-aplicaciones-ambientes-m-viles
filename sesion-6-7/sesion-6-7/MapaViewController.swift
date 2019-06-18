//
//  MapaViewController.swift
//  sesion-6-7
//
//  Created by CTA CUCEA on 6/17/19.
//  Copyright © 2019 CTA CUCEA. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {

    var user: UserModel!
    @IBOutlet weak var mapa: MKMapView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblCalle: UILabel!
    @IBOutlet weak var lblCiudad: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        lblNombre.text = user.name
        
        lblCalle.text = user.street
        lblUsername.text = user.username
        lblCiudad.text = user.city
        
        // Do any additional setup after loading the view.
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: user.lat!, longitude: user.lon!)
        pin.title = user.username
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
