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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtEmail.delegate = self;
        txtPassword.delegate = self;
        
    }


    @IBAction func onLogin(_ sender: Any) {
        
        var isLogin:Bool = false;
        var email:String = txtEmail.text ?? "";
        var password:String = txtPassword.text ?? "";
        var mensaje:String = "";
        
        
       
        
        if(email != "admin@gmail.com"){
            mensaje = "El correo: '"+email+"' no está registrado."
            isLogin = false;
        }else if(password != "12345"){
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
            
            homeViewController.Usuario = "David Arroyo";
            
            UserDefaults.standard.set("Daniela Felix", forKey: "Nombre") //setObject

            
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
