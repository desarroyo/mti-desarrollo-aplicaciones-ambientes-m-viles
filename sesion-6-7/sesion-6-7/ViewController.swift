//
//  ViewController.swift
//  sesion-6-7
//
//  Created by CTA CUCEA on 6/14/19.
//  Copyright © 2019 CTA CUCEA. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var users = [UserModel]()

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{


    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadUsers()
        

    }
    
    
    func loadUsers(){
        AF.request("https://jsonplaceholder.typicode.com/users").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
                
                let json = JSON(data)
                
                for user in json{
                    users.append(UserModel(object: user.1))
                }
                
                self.tableView.reloadData()
                
            }
            
            
            
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usuario")
        cell?.textLabel?.text = users[indexPath.row].name
        cell?.detailTextLabel?.text = "\(users[indexPath.row].street!), \(users[indexPath.row].city!)"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //getting the index path of selected row
        let indexPath = tableView.indexPathForSelectedRow
        
        /*
        //getting the text of that cell
        let currentItem = currentCell.textLabel!.text
        
        let alertController = UIAlertController(title: "Simplified iOS", message: "You Selected " + currentItem! , preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close Alert", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        */
        
        
        UserDefaults.standard.set(indexPath?.row ?? -1, forKey: "usuario") //setObject
        UserDefaults.standard.synchronize()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let homeViewController = storyBoard.instantiateViewController(withIdentifier: "usuario") as! UsuarioViewController
        
        //UsuarioViewController.Usuario = users[currentCell;
        
        
        self.present(homeViewController, animated: true, completion: nil)
    }
    
    


}

