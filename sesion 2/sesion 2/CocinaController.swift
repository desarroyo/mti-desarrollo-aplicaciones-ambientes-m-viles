//
//  CocinaController.swift
//  sesion 2
//
//  Created by CTA CUCEA on 6/10/19.
//  Copyright © 2019 CTA CUCEA. All rights reserved.
//

import UIKit

class CocinaController: UIViewController {

    @IBOutlet weak var chkFreidora: UISwitch!
    @IBOutlet weak var sldFreidoraTemp: UISlider!
    @IBOutlet weak var lblTemp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        chkFreidora.isOn = false
        sldFreidoraTemp.isEnabled = chkFreidora.isOn
        
    }
    
    @IBAction func onFreidora(_ sender: Any) {
        sldFreidoraTemp.isEnabled = chkFreidora.isOn
    }
    @IBAction func onSliderTemp(_ sender: Any) {
        lblTemp.text = "Temp: " + (NSString(format: "%.2f", sldFreidoraTemp.value) as String) + "º"
    }
}
