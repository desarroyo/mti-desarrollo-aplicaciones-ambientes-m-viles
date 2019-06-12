//
//  CocinaController.swift
//  sesion 2
//
//  Created by CTA CUCEA on 6/10/19.
//  Copyright © 2019 CTA CUCEA. All rights reserved.
//

import UIKit

class GarageController: UIViewController {

    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var chkGarage: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        chkGarage.isOn = false
        self.loading.hidesWhenStopped = true
        loading.stopAnimating()
        
        
    }
    
    @IBAction func onGarage(_ sender: Any) {
        
        loading.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.loading.stopAnimating()
            self.loading.isHidden = true
            
        }
        
        
    }
}
