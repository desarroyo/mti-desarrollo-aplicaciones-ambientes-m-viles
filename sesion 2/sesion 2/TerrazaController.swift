//
//  CocinaController.swift
//  sesion 2
//
//  Created by CTA CUCEA on 6/10/19.
//  Copyright © 2019 CTA CUCEA. All rights reserved.
//

import UIKit

class TerrazaController: UIViewController {

    @IBOutlet weak var fechaProgramacion: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
                
    }

    @IBAction func onGuardar(_ sender: Any) {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_MX")
        formatter.dateFormat = "HH:mm"
        
        let fecha = formatter.string(from: fechaProgramacion.date)
        print(fecha)
        
        let alert = UIAlertController(title: "Terraza", message: "Prendido programado a las: " + fecha, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        
        
        present(alert, animated: true, completion: nil)
    }
    
}
