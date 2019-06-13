//
//  MoreViewController.swift
//  sesion-3-4
//
//  Created by CTA CUCEA on 6/12/19.
//  Copyright © 2019 CTA CUCEA. All rights reserved.
//

import UIKit

var tasks = [TaskModel]()

class MoreViewController: UIViewController {

    @IBOutlet weak var txtTask: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addTask(_ sender: Any) {
        if(txtTask.text!.isEmpty){
            let alert = UIAlertController(title: "Cuidado", message: "La tarea está vacía", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }else{
            tasks.append(TaskModel(task: txtTask.text!, dueDate: datePicker.date))
            print(tasks.count)
            
            txtTask.text = ""
            
        }
    }
    
}
