//
//  UsuarioViewController.swift
//  sesion-6-7
//
//  Created by David Arroyo Sanchez on 6/17/19.
//  Copyright © 2019 CTA CUCEA. All rights reserved.
//

import UIKit
import MapKit


final class UsuarioAnotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?){
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        super.init()
    }
    
    var region: MKCoordinateRegion{
        let span = MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
    
}


class UsuarioViewController: UIViewController {

    //var usuario:UserModel
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblUsername: UILabel!    
    @IBOutlet weak var lblCalle: UILabel!
    @IBOutlet weak var llblCiudad: UILabel!
    
    @IBOutlet weak var mapa: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        lblNombre.text = usuario.name
        
        lblCalle.text = usuario.street
        lblUsername.text = usuario.username
        llblCiudad.text = usuario.city
        
        mapa.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        let coor = CLLocationCoordinate2D(latitude: usuario.lat!, longitude: usuario.lon!)
        let annot = UsuarioAnotation(coordinate: coor, title: usuario.name, subtitle: usuario.city)
        
        mapa.addAnnotation(annot)
        mapa.setRegion(annot.region, animated: true)
 */

    }
    /*
    required init?(coder aDecoder: NSCoder) {
        self.usuario = users[UserDefaults.standard.integer(forKey: "usuario")]
        super.init(coder: aDecoder)

    }
 */
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    


}

extension UsuarioViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView{
            annotationView.animatesWhenAdded = true
            annotationView.titleVisibility = .adaptive
            annotationView.subtitleVisibility = .adaptive
        }
        return nil
    }
    
}
