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
    }
}

extension ViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}
