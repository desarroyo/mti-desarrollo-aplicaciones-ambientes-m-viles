//
//  ViewController.swift
//  sesion 1
//
//  Created by David Arroyo Sanchez on 6/6/19.
//  Copyright © 2019 David Arroyo Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnOlvidePass: UIButton!
    
    let user = "aldo"
    let pass = "mti"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtEmail.delegate = self;
        txtPassword.delegate = self;
        
    }

    @IBAction func onOlvidePass(_ sender: Any) {
        let alert = UIAlertController(title: "Olvide Contraseña", message: "Llamale a tu máma", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))
        
        
        alert.addAction(UIAlertAction(title: "Dame el Password", style: .default, handler: {(action) in
            print("Password Denegado")
        }
        ))
        
        
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onLogin(_ sender: Any) {
    
        var isLogin:Bool = false;
        let usuario:String = txtEmail.text ?? "";
        let password:String = txtPassword.text ?? "";
        var mensaje:String = "";
        
        if(txtEmail.text!.isEmpty || txtPassword.text!.isEmpty){
         mensaje = "Favor de completar los datos"
        }else if(txtEmail.text! != user){
            mensaje = "El usuario: '"+usuario+"' no está registrado."
            isLogin = false;
        }else if(password != pass){
            mensaje = "La contraseña es incorrecta."
            isLogin = false;
        }else{
            //mensaje = "Login Correcto."
            isLogin = true;
        }
        
        if(!isLogin){
            let alert = UIAlertController(title: "Login", message: mensaje, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        
        if(isLogin){
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let homeViewController = storyBoard.instantiateViewController(withIdentifier: "home") as! HomeViewController
            
            homeViewController.Usuario = user;
            
            UserDefaults.standard.set(user, forKey: "Nombre") //setObject

            
            self.present(homeViewController, animated: true, completion: nil)
            
        }
 
        
    }
}

extension ViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}
