//
//  CocinaController.swift
//  sesion 2
//
//  Created by CTA CUCEA on 6/10/19.
//  Copyright © 2019 CTA CUCEA. All rights reserved.
//

import UIKit

class HabitacionController: UIViewController {

    
    @IBOutlet weak var chkTodo: UISwitch!
    @IBOutlet weak var chkV: UISwitch!
    @IBOutlet weak var chkL2: UISwitch!
    @IBOutlet weak var chkL1: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    func checkTodo(){
        if(chkV.isOn && chkL1.isOn && chkL2.isOn){
           chkTodo.isOn = true
        }else{
           chkTodo.isOn = false
        }
    }
    
    @IBAction func onL1(_ sender: Any) {
        checkTodo()
    }
    
    @IBAction func onL2(_ sender: Any) {
        checkTodo()
    }
    
    @IBAction func onV(_ sender: Any) {
        checkTodo()
    }
    
    @IBAction func onTodo(_ sender: Any) {
        chkV.isOn = chkTodo.isOn
        chkL1.isOn = chkTodo.isOn
        chkL2.isOn = chkTodo.isOn
    }
}
