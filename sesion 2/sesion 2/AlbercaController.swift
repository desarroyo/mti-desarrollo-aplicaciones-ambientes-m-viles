//
//  CocinaController.swift
//  sesion 2
//
//  Created by CTA CUCEA on 6/10/19.
//  Copyright © 2019 CTA CUCEA. All rights reserved.
//

import UIKit

class AlbercaController: UIViewController {

    @IBOutlet weak var tipoAlberca: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
                
    }

  
    @IBAction func onAlberca(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Alberca", message: "Estado de la Alberca: " + (	tipoAlberca.titleForSegment(at: tipoAlberca.selectedSegmentIndex) ?? "N/A"), preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        
        
        present(alert, animated: true, completion: nil)
    }
}
