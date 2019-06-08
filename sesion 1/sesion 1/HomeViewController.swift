//
//  HomeViewController.swift
//  sesion 1
//
//  Created by David Arroyo Sanchez on 6/7/19.
//  Copyright © 2019 David Arroyo Sanchez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var lblNombre: UILabel!
    var Usuario:String = "N/A"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNombre.text = UserDefaults.standard.string(forKey: "Nombre")

        // Do any additional setup after loading the view.
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
