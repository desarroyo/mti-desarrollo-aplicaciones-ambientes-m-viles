//
//  LoginViewController.swift
//  proyecto-final
//
//  Created by David Arroyo Sanchez on 7/7/19.
//  Copyright © 2019 David Arroyo Sanchez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        let user = UserDefaults.standard.string(forKey: "usuario")
        if(user != nil && !(user!.isEmpty)){
            txtUsuario.text = user
        }
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func onRegistrar(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let registrarViewController = storyBoard.instantiateViewController(withIdentifier: "registro") as! RegistroViewController
        
        self.present(registrarViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func onLogin(_ sender: Any) {
        
        var user = UserDefaults.standard.string(forKey: "usuario")
        var pass = UserDefaults.standard.string(forKey: "password")
        
        var isLogin:Bool = false;
        var mensaje:String = "";
        
        if(txtUsuario.text!.isEmpty || txtPassword.text!.isEmpty){
            mensaje = "Favor de completar los datos"
        }else if(txtUsuario.text! != user){
            mensaje = "El usuario: '"+txtUsuario.text!+"' no está registrado."
            isLogin = false;
        }else if(txtPassword.text != pass){
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
            
            let tabbarVC = storyboard!.instantiateViewController(withIdentifier: "tab") as! UITabBarController
            
            self.present(tabbarVC, animated: false, completion: nil)
            
        }
    }
    
}
