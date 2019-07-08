//
//  EventosViewController.swift
//  proyecto-final
//
//  Created by David Arroyo Sanchez on 7/7/19.
//  Copyright © 2019 David Arroyo Sanchez. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class EventosViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var eventos = [EventoModel]()
    var selectedEvento: EventoModel = EventoModel(object: JSON())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadEventos()
        
        
    }
    
    
    
    func loadEventos(){
        AF.request("https://eventos-auditoriotelmex.free.beeceptor.com/api/eventos").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
                
                let json = JSON(data)
                
                for evento in json{
                    self.eventos.append(EventoModel(object: evento.1))
                }
                
                self.tableView.reloadData()
                
            }
            
            
            
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "evento") as! EventTableViewCell
        
        cell.lblNombre.text = eventos[indexPath.row].name
        cell.lblFecha.text = eventos[indexPath.row].fecha ?? "N/A" + " / " + eventos[indexPath.row].hora!
        
        AF.request(eventos[indexPath.row].img!).response { response in
            if let data = response.data {
                let image = UIImage(data: data)
                cell.imgEvento.image = image
            } else {
                print("Data is nil. I don't know what to do :(")
            }
        }
        
        
        //cell?.textLabel?.text = users[indexPath.row].name
        //cell?.detailTextLabel?.text = "\(users[indexPath.row].street!), \(users[indexPath.row].city!)"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getting the index path of selected row
        //let indexPath = tableView.indexPathForSelectedRow
        
        
        selectedEvento = eventos[indexPath.row]
        
        performSegue(withIdentifier: "eventoDetalle", sender: self)
        /*
         
         UserDefaults.standard.set(indexPath?.row ?? -1, forKey: "usuario") //setObject
         UserDefaults.standard.synchronize()
         
         let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         
         let homeViewController = storyBoard.instantiateViewController(withIdentifier: "usuario") as! UsuarioViewController
         
         //UsuarioViewController.Usuario = users[currentCell;
         
         
         self.present(homeViewController, animated: true, completion: nil)
         
         */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "eventoDetalle"{
            let vc = segue.destination as! EventoViewController;
            vc.evento = selectedEvento
            
        }
    }
    
    
    
    
}

