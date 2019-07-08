//
//  EventTableViewCell.swift
//  proyecto-final
//
//  Created by David Arroyo Sanchez on 7/7/19.
//  Copyright © 2019 David Arroyo Sanchez. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var chkFavorito: UISwitch!
    @IBOutlet weak var imgEvento: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
