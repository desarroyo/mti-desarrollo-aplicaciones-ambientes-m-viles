//
//  UserTableViewCell.swift
//  sesion-6-7
//
//  Created by CTA CUCEA on 6/17/19.
//  Copyright © 2019 CTA CUCEA. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblInvitados: UILabel!
    @IBOutlet weak var stpInvitado: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onInvitado(_ sender: UISwitch) {
        if sender.isOn {
            stpInvitado.isEnabled = true
        }else{
            stpInvitado.isEnabled = false
            stpInvitado.value = 0
            lblInvitados.text = "0"
        }
    }
    @IBAction func agregarInvitados(_ sender: UIStepper) {
        lblInvitados.text = stpInvitado.value.description
    
    }
    
}
