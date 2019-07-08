//
//  PerfilViewController.swift
//  proyecto-final
//
//  Created by David Arroyo Sanchez on 7/7/19.
//  Copyright © 2019 David Arroyo Sanchez. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {

    @IBOutlet weak var lblUsuario: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var user = UserDefaults.standard.string(forKey: "usuario")
        if(!user!.isEmpty){
            lblUsuario.text = user
        }
    }
    
    @IBAction func onCambiarFoto(_ sender: Any) {
        
        performSegue(withIdentifier: "navCamara", sender: self)
    }
    
    @IBAction func onMapa(_ sender: Any) {
        performSegue(withIdentifier: "navMapa", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navCamara"{
            let vc = segue.destination as! TomarFotoViewController;
            
        }else if segue.identifier == "navMapa"{
            let vc = segue.destination as! MapaViewController;
            //vc.user = selectedUser
            
        }
    }
    

}
