//
//  RegistroViewController.swift
//  proyecto-final
//
//  Created by David Arroyo Sanchez on 7/7/19.
//  Copyright © 2019 David Arroyo Sanchez. All rights reserved.
//

import UIKit

class RegistroViewController: UIViewController {

    @IBOutlet weak var txtUsuario: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


    @IBAction func onRegistrar(_ sender: Any) {
        
        var mensaje:String = "";
        
        if(txtUsuario.text!.isEmpty || txtPassword.text!.isEmpty){
            mensaje = "Favor de completar los datos"
            let alert = UIAlertController(title: "Login", message: mensaje, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            
        }else{
            
            UserDefaults.standard.set(txtUsuario.text, forKey: "usuario")
            UserDefaults.standard.set(txtPassword.text, forKey: "password")
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
        
    }
}
