//
//  EventoViewController.swift
//  proyecto-final
//
//  Created by David Arroyo Sanchez on 7/7/19.
//  Copyright © 2019 David Arroyo Sanchez. All rights reserved.
//

import UIKit
import Alamofire

class EventoViewController: UIViewController {

    @IBOutlet weak var imgEvento: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    var evento: EventoModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblNombre.text = evento.name
        lblFecha.text = evento.fecha ?? "N/A" + " / " + evento.hora!
        
        AF.request(evento.img!).response { response in
            if let data = response.data {
                let image = UIImage(data: data)
                self.imgEvento.image = image
            } else {
                print("Data is nil. I don't know what to do :(")
            }
        }
    }
    


}
